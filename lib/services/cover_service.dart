import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../core/constants/app_constants.dart';

final coverServiceProvider = Provider<CoverService>((ref) => CoverService());

class CoverService {
  final _uuid = const Uuid();

  Future<String> copyCoverForWork({
    required String sourcePath,
    required String workId,
  }) async {
    final source = File(sourcePath);
    if (!source.existsSync()) {
      throw const FileSystemException('封面文件不存在');
    }

    final coversDir = await _coversDirectory();
    final extension = _safeExtension(source.path);
    final stamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = 'work_${workId}_$stamp$extension';
    final targetPath = p.join(coversDir.path, fileName);

    await source.copy(targetPath);
    return p.join('covers', fileName);
  }

  Future<String> downloadCover({
    required String coverUrl,
    required String providerId,
    required String sourceId,
  }) async {
    final uri = Uri.tryParse(coverUrl);
    if (uri == null || !uri.hasScheme) {
      throw const FileSystemException('封面地址无效');
    }

    final response = await http.get(uri, headers: const {
      'user-agent': 'Recallio/0.1.0'
    }).timeout(const Duration(seconds: 30));
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw const FileSystemException('封面下载失败');
    }
    if (response.bodyBytes.isEmpty) {
      throw const FileSystemException('封面内容为空');
    }

    final coversDir = await _coversDirectory();
    final extension = _extensionFromResponse(uri, response);
    final fileName =
        '${_safeFilePart(providerId)}_${_safeFilePart(sourceId)}_${_uuid.v4()}$extension';
    final targetPath = p.join(coversDir.path, fileName);

    await File(targetPath).writeAsBytes(response.bodyBytes);
    return p.join('covers', fileName);
  }

  Future<Directory> _coversDirectory() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final coversDir = Directory(
      p.join(documentsDir.path, AppConstants.dataRootName, 'covers'),
    );

    if (!coversDir.existsSync()) {
      coversDir.createSync(recursive: true);
    }

    return coversDir;
  }

  Future<File?> resolveCoverFile(String? path) async {
    if (path == null || path.trim().isEmpty) {
      return null;
    }

    final normalizedPath = path.trim();
    if (p.isAbsolute(normalizedPath)) {
      final file = File(normalizedPath);
      return file.existsSync() ? file : null;
    }

    final documentsDir = await getApplicationDocumentsDirectory();
    final file = File(
      p.join(documentsDir.path, AppConstants.dataRootName, normalizedPath),
    );
    return file.existsSync() ? file : null;
  }

  String _extensionFromResponse(Uri uri, http.Response response) {
    final pathExtension = _safeExtension(uri.path);
    if (pathExtension != '.jpg' || uri.path.toLowerCase().endsWith('.jpg')) {
      return pathExtension;
    }

    final contentType = response.headers['content-type']?.toLowerCase() ?? '';
    if (contentType.contains('png')) {
      return '.png';
    }
    if (contentType.contains('webp')) {
      return '.webp';
    }
    if (contentType.contains('jpeg') || contentType.contains('jpg')) {
      return '.jpg';
    }
    return '.jpg';
  }

  String _safeExtension(String path) {
    final extension = p.extension(path).toLowerCase();
    const allowed = {'.jpg', '.jpeg', '.png', '.webp'};
    return allowed.contains(extension) ? extension : '.jpg';
  }

  String _safeFilePart(String value) {
    return value.replaceAll(RegExp(r'[^a-zA-Z0-9_-]+'), '_');
  }
}
