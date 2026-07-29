import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../core/constants/app_constants.dart';

final settingsServiceProvider = Provider<SettingsService>((ref) {
  return SettingsService();
});

class SettingsService {
  Future<String?> readTmdbToken() async {
    final settings = await _readSettings();
    final token = settings['tmdbToken'];
    if (token is! String) {
      return null;
    }
    final trimmed = token.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  Future<void> saveTmdbToken(String token) async {
    final settings = await _readSettings();
    final trimmed = token.trim();
    if (trimmed.isEmpty) {
      settings.remove('tmdbToken');
    } else {
      settings['tmdbToken'] = trimmed;
    }
    await _writeSettings(settings);
  }

  Future<Map<String, Object?>> _readSettings() async {
    final file = await _settingsFile();
    if (!file.existsSync()) {
      return {};
    }

    try {
      final decoded = jsonDecode(await file.readAsString());
      if (decoded is Map<String, dynamic>) {
        return Map<String, Object?>.from(decoded);
      }
    } catch (_) {
      return {};
    }
    return {};
  }

  Future<void> _writeSettings(Map<String, Object?> settings) async {
    final file = await _settingsFile();
    final parent = file.parent;
    if (!parent.existsSync()) {
      parent.createSync(recursive: true);
    }
    const encoder = JsonEncoder.withIndent('  ');
    await file.writeAsString(encoder.convert(settings));
  }

  Future<File> _settingsFile() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    return File(
      p.join(documentsDir.path, AppConstants.dataRootName, 'settings.json'),
    );
  }
}
