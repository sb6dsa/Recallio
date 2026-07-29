import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../../services/settings_service.dart';
import '../../shared/widgets/error_view.dart';
import '../../shared/widgets/loading_view.dart';
import '../../shared/widgets/recallio_page_scaffold.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _tmdbTokenController = TextEditingController();

  late final Future<void> _loadFuture;
  bool _saving = false;
  bool _obscureToken = true;

  @override
  void initState() {
    super.initState();
    _loadFuture = _loadSettings();
  }

  @override
  void dispose() {
    _tmdbTokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RecallioPageScaffold(
      title: '设置',
      child: FutureBuilder<void>(
        future: _loadFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const LoadingView();
          }
          if (snapshot.hasError) {
            return const ErrorView(message: '读取设置失败');
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _InfoCard(
                icon: Icons.folder_outlined,
                title: '数据保存位置',
                subtitle: '数据库、封面和附件会保存在应用文档目录下。',
              ),
              const SizedBox(height: 10),
              _InfoCard(
                icon: Icons.shield_outlined,
                title: '隐私',
                subtitle: '不需要账号，不上传用户记录，不接入广告 SDK。',
              ),
              const SizedBox(height: 10),
              _InfoCard(
                icon: Icons.public_off_outlined,
                title: '网络访问',
                subtitle: '除非主动使用外部搜索功能，否则应用不会访问网络。',
              ),
              const SizedBox(height: 24),
              Text('外部搜索', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              TextField(
                controller: _tmdbTokenController,
                obscureText: _obscureToken,
                decoration: InputDecoration(
                  labelText: 'TMDb API Token / API Key',
                  helperText: '仅保存在本机，用于电影搜索导入。',
                  suffixIcon: IconButton(
                    tooltip: _obscureToken ? '显示' : '隐藏',
                    onPressed: () => setState(() => _obscureToken = !_obscureToken),
                    icon: Icon(
                      _obscureToken
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: FilledButton.icon(
                  onPressed: _saving ? null : _saveSettings,
                  icon: _saving
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.save_outlined),
                  label: Text(_saving ? '正在保存' : '保存 TMDb 设置'),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, 44),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _loadSettings() async {
    final token = await ref.read(settingsServiceProvider).readTmdbToken();
    if (!mounted) return;
    _tmdbTokenController.text = token ?? '';
  }

  Future<void> _saveSettings() async {
    setState(() => _saving = true);
    try {
      await ref
          .read(settingsServiceProvider)
          .saveTmdbToken(_tmdbTokenController.text);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('TMDb 设置已保存。')),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('保存设置失败，请稍后重试。')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          Icon(icon, size: 22, color: AppTheme.primary.withValues(alpha: 0.7)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
