import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../services/backup_service.dart';
import '../../shared/widgets/recallio_page_scaffold.dart';

class BackupPage extends ConsumerStatefulWidget {
  const BackupPage({super.key});

  @override
  ConsumerState<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends ConsumerState<BackupPage> {
  bool _exporting = false;
  bool _importing = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RecallioPageScaffold(
      title: '备份与恢复',
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: colorScheme.brightness == Brightness.light
                  ? AppTheme.cardLight
                  : AppTheme.cardDark,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: colorScheme.outlineVariant.withValues(alpha: 0.15),
                width: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 3,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text('数据安全', style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Recallio 的记录默认保存在当前设备本地。重新安装或卸载 App 后数据会丢失，请务必在更新或卸载前先导出备份包。',
                ),
                const SizedBox(height: 8),
                Text(
                  '备份包保存在应用数据目录的 backups 文件夹中。',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _exporting ? null : _startExport,
            icon: _exporting
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.upload_file_outlined),
            label: Text(_exporting ? '正在导出...' : '导出备份包'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _importing ? null : _startImport,
            icon: _importing
                ? const SizedBox.square(
                    dimension: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.download_outlined),
            label: Text(_importing ? '正在导入...' : '导入备份包'),
          ),
        ],
      ),
    );
  }

  Future<void> _startExport() async {
    setState(() => _exporting = true);
    try {
      final service = ref.read(backupServiceProvider);
      final savePath = await service.exportToZip();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('已导出：$savePath'),
            duration: const Duration(seconds: 6),
            action: SnackBarAction(label: '确定', onPressed: () {}),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('导出失败：${e.toString().replaceFirst('Exception: ', '')}'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  Future<void> _startImport() async {
    final result = await FilePicker.pickFiles(
      dialogTitle: '选择备份包',
      type: FileType.custom,
      allowedExtensions: const ['zip'],
    );
    if (result == null || result.files.isEmpty) return;

    final zipPath = result.files.single.path;
    if (zipPath == null) return;

    setState(() => _importing = true);
    try {
      final service = ref.read(backupServiceProvider);
      final parsed = await service.parseZipFile(zipPath);
      if (!mounted) return;

      final mode = await _showPreviewDialog(parsed);
      if (mode == null) return;

      final importResult = await service.importFromParsed(parsed, mode: mode);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '导入完成：新增 ${importResult.inserted} 条，'
              '跳过 ${importResult.skipped} 条，'
              '还原封面 ${importResult.coverFilesExtracted} 个。',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('导入失败：${e.toString().replaceFirst('Exception: ', '')}'),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _importing = false);
    }
  }

  Future<ImportMode?> _showPreviewDialog(ParsedBackup parsed) async {
    final manifest = parsed.manifest;
    final entryCount = parsed.entries.length;
    final coverCount = parsed.coverFiles.length;
    ImportMode selectedMode = ImportMode.merge;

    return showDialog<ImportMode>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title: const Text('导入预览'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('应用：${manifest.app}'),
                    Text('格式版本：${manifest.schemaVersion}'),
                    Text('导出时间：${_formatDateTime(manifest.exportedAt)}'),
                    Text('来源：${manifest.sourceClient} / ${manifest.platform}'),
                    const SizedBox(height: 12),
                    Text('包含 $entryCount 条记录'),
                    if (coverCount > 0) Text('包含 $coverCount 个封面文件'),
                    const SizedBox(height: 16),
                    const Text('冲突处理方式：'),
                    const SizedBox(height: 8),
                    SegmentedButton<ImportMode>(
                      segments: const [
                        ButtonSegment(
                          value: ImportMode.merge,
                          label: Text('合并'),
                          tooltip: '跳过已存在的记录，仅导入新记录',
                        ),
                        ButtonSegment(
                          value: ImportMode.overwrite,
                          label: Text('覆盖'),
                          tooltip: '用备份中的记录覆盖已存在的同名记录',
                        ),
                      ],
                      selected: {selectedMode},
                      onSelectionChanged: (set) {
                        setDialogState(() => selectedMode = set.first);
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('取消'),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(ctx).pop(selectedMode),
                  child: const Text('确认导入'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  String _formatDateTime(DateTime dt) {
    return '${dt.year}-${_pad(dt.month)}-${_pad(dt.day)} '
        '${_pad(dt.hour)}:${_pad(dt.minute)}';
  }

  String _pad(int n) => n.toString().padLeft(2, '0');
}
