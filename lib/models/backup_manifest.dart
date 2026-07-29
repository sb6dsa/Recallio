import '../core/constants/app_constants.dart';

class BackupManifest {
  const BackupManifest({
    required this.app,
    required this.schemaVersion,
    required this.exportedAt,
    required this.sourceClient,
    required this.platform,
  });

  final String app;
  final int schemaVersion;
  final DateTime exportedAt;
  final String sourceClient;
  final String platform;

  factory BackupManifest.recallio({
    required DateTime exportedAt,
    required String platform,
  }) {
    return BackupManifest(
      app: AppConstants.appName,
      schemaVersion: AppConstants.backupSchemaVersion,
      exportedAt: exportedAt,
      sourceClient: 'flutter-local',
      platform: platform,
    );
  }

  factory BackupManifest.fromJson(Map<String, Object?> json) {
    return BackupManifest(
      app: json['app'] as String? ?? '',
      schemaVersion: json['schemaVersion'] as int? ?? 0,
      exportedAt: DateTime.parse(json['exportedAt'] as String),
      sourceClient: json['sourceClient'] as String? ?? '',
      platform: json['platform'] as String? ?? '',
    );
  }

  Map<String, Object?> toJson() {
    return {
      'app': app,
      'schemaVersion': schemaVersion,
      'exportedAt': exportedAt.toIso8601String(),
      'sourceClient': sourceClient,
      'platform': platform,
    };
  }
}
