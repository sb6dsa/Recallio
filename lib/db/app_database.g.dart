// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WorksTable extends Works with TableInfo<$WorksTable, Work> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _aliasesMeta =
      const VerificationMeta('aliases');
  @override
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
      'aliases', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverPathMeta =
      const VerificationMeta('coverPath');
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
      'cover_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverSourceUrlMeta =
      const VerificationMeta('coverSourceUrl');
  @override
  late final GeneratedColumn<String> coverSourceUrl = GeneratedColumn<String>(
      'cover_source_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceProviderMeta =
      const VerificationMeta('sourceProvider');
  @override
  late final GeneratedColumn<String> sourceProvider = GeneratedColumn<String>(
      'source_provider', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceIdMeta =
      const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
      'source_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceUrlMeta =
      const VerificationMeta('sourceUrl');
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
      'source_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _creatorsMeta =
      const VerificationMeta('creators');
  @override
  late final GeneratedColumn<String> creators = GeneratedColumn<String>(
      'creators', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<String> deletedAt = GeneratedColumn<String>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        title,
        originalTitle,
        aliases,
        summary,
        coverPath,
        coverSourceUrl,
        sourceProvider,
        sourceId,
        sourceUrl,
        releaseDate,
        creators,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'works';
  @override
  VerificationContext validateIntegrity(Insertable<Work> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    }
    if (data.containsKey('aliases')) {
      context.handle(_aliasesMeta,
          aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta));
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('cover_path')) {
      context.handle(_coverPathMeta,
          coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta));
    }
    if (data.containsKey('cover_source_url')) {
      context.handle(
          _coverSourceUrlMeta,
          coverSourceUrl.isAcceptableOrUnknown(
              data['cover_source_url']!, _coverSourceUrlMeta));
    }
    if (data.containsKey('source_provider')) {
      context.handle(
          _sourceProviderMeta,
          sourceProvider.isAcceptableOrUnknown(
              data['source_provider']!, _sourceProviderMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    }
    if (data.containsKey('source_url')) {
      context.handle(_sourceUrlMeta,
          sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta));
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('creators')) {
      context.handle(_creatorsMeta,
          creators.isAcceptableOrUnknown(data['creators']!, _creatorsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Work map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Work(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      originalTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_title']),
      aliases: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aliases']),
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
      coverPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_path']),
      coverSourceUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cover_source_url']),
      sourceProvider: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_provider']),
      sourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_id']),
      sourceUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_url']),
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date']),
      creators: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}creators']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $WorksTable createAlias(String alias) {
    return $WorksTable(attachedDatabase, alias);
  }
}

class Work extends DataClass implements Insertable<Work> {
  final String id;
  final String type;
  final String title;
  final String? originalTitle;
  final String? aliases;
  final String? summary;
  final String? coverPath;
  final String? coverSourceUrl;
  final String? sourceProvider;
  final String? sourceId;
  final String? sourceUrl;
  final String? releaseDate;
  final String? creators;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  const Work(
      {required this.id,
      required this.type,
      required this.title,
      this.originalTitle,
      this.aliases,
      this.summary,
      this.coverPath,
      this.coverSourceUrl,
      this.sourceProvider,
      this.sourceId,
      this.sourceUrl,
      this.releaseDate,
      this.creators,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || originalTitle != null) {
      map['original_title'] = Variable<String>(originalTitle);
    }
    if (!nullToAbsent || aliases != null) {
      map['aliases'] = Variable<String>(aliases);
    }
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || coverPath != null) {
      map['cover_path'] = Variable<String>(coverPath);
    }
    if (!nullToAbsent || coverSourceUrl != null) {
      map['cover_source_url'] = Variable<String>(coverSourceUrl);
    }
    if (!nullToAbsent || sourceProvider != null) {
      map['source_provider'] = Variable<String>(sourceProvider);
    }
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    if (!nullToAbsent || creators != null) {
      map['creators'] = Variable<String>(creators);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String>(deletedAt);
    }
    return map;
  }

  WorksCompanion toCompanion(bool nullToAbsent) {
    return WorksCompanion(
      id: Value(id),
      type: Value(type),
      title: Value(title),
      originalTitle: originalTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(originalTitle),
      aliases: aliases == null && nullToAbsent
          ? const Value.absent()
          : Value(aliases),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      coverPath: coverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPath),
      coverSourceUrl: coverSourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverSourceUrl),
      sourceProvider: sourceProvider == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceProvider),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      creators: creators == null && nullToAbsent
          ? const Value.absent()
          : Value(creators),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Work.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Work(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      originalTitle: serializer.fromJson<String?>(json['originalTitle']),
      aliases: serializer.fromJson<String?>(json['aliases']),
      summary: serializer.fromJson<String?>(json['summary']),
      coverPath: serializer.fromJson<String?>(json['coverPath']),
      coverSourceUrl: serializer.fromJson<String?>(json['coverSourceUrl']),
      sourceProvider: serializer.fromJson<String?>(json['sourceProvider']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      creators: serializer.fromJson<String?>(json['creators']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'originalTitle': serializer.toJson<String?>(originalTitle),
      'aliases': serializer.toJson<String?>(aliases),
      'summary': serializer.toJson<String?>(summary),
      'coverPath': serializer.toJson<String?>(coverPath),
      'coverSourceUrl': serializer.toJson<String?>(coverSourceUrl),
      'sourceProvider': serializer.toJson<String?>(sourceProvider),
      'sourceId': serializer.toJson<String?>(sourceId),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'creators': serializer.toJson<String?>(creators),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  Work copyWith(
          {String? id,
          String? type,
          String? title,
          Value<String?> originalTitle = const Value.absent(),
          Value<String?> aliases = const Value.absent(),
          Value<String?> summary = const Value.absent(),
          Value<String?> coverPath = const Value.absent(),
          Value<String?> coverSourceUrl = const Value.absent(),
          Value<String?> sourceProvider = const Value.absent(),
          Value<String?> sourceId = const Value.absent(),
          Value<String?> sourceUrl = const Value.absent(),
          Value<String?> releaseDate = const Value.absent(),
          Value<String?> creators = const Value.absent(),
          String? createdAt,
          String? updatedAt,
          Value<String?> deletedAt = const Value.absent()}) =>
      Work(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        originalTitle:
            originalTitle.present ? originalTitle.value : this.originalTitle,
        aliases: aliases.present ? aliases.value : this.aliases,
        summary: summary.present ? summary.value : this.summary,
        coverPath: coverPath.present ? coverPath.value : this.coverPath,
        coverSourceUrl:
            coverSourceUrl.present ? coverSourceUrl.value : this.coverSourceUrl,
        sourceProvider:
            sourceProvider.present ? sourceProvider.value : this.sourceProvider,
        sourceId: sourceId.present ? sourceId.value : this.sourceId,
        sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        creators: creators.present ? creators.value : this.creators,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Work copyWithCompanion(WorksCompanion data) {
    return Work(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      originalTitle: data.originalTitle.present
          ? data.originalTitle.value
          : this.originalTitle,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      summary: data.summary.present ? data.summary.value : this.summary,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      coverSourceUrl: data.coverSourceUrl.present
          ? data.coverSourceUrl.value
          : this.coverSourceUrl,
      sourceProvider: data.sourceProvider.present
          ? data.sourceProvider.value
          : this.sourceProvider,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      creators: data.creators.present ? data.creators.value : this.creators,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Work(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('aliases: $aliases, ')
          ..write('summary: $summary, ')
          ..write('coverPath: $coverPath, ')
          ..write('coverSourceUrl: $coverSourceUrl, ')
          ..write('sourceProvider: $sourceProvider, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('creators: $creators, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      type,
      title,
      originalTitle,
      aliases,
      summary,
      coverPath,
      coverSourceUrl,
      sourceProvider,
      sourceId,
      sourceUrl,
      releaseDate,
      creators,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Work &&
          other.id == this.id &&
          other.type == this.type &&
          other.title == this.title &&
          other.originalTitle == this.originalTitle &&
          other.aliases == this.aliases &&
          other.summary == this.summary &&
          other.coverPath == this.coverPath &&
          other.coverSourceUrl == this.coverSourceUrl &&
          other.sourceProvider == this.sourceProvider &&
          other.sourceId == this.sourceId &&
          other.sourceUrl == this.sourceUrl &&
          other.releaseDate == this.releaseDate &&
          other.creators == this.creators &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class WorksCompanion extends UpdateCompanion<Work> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> title;
  final Value<String?> originalTitle;
  final Value<String?> aliases;
  final Value<String?> summary;
  final Value<String?> coverPath;
  final Value<String?> coverSourceUrl;
  final Value<String?> sourceProvider;
  final Value<String?> sourceId;
  final Value<String?> sourceUrl;
  final Value<String?> releaseDate;
  final Value<String?> creators;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String?> deletedAt;
  final Value<int> rowid;
  const WorksCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.aliases = const Value.absent(),
    this.summary = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.coverSourceUrl = const Value.absent(),
    this.sourceProvider = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.creators = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorksCompanion.insert({
    required String id,
    required String type,
    required String title,
    this.originalTitle = const Value.absent(),
    this.aliases = const Value.absent(),
    this.summary = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.coverSourceUrl = const Value.absent(),
    this.sourceProvider = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.creators = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        title = Value(title),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Work> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? originalTitle,
    Expression<String>? aliases,
    Expression<String>? summary,
    Expression<String>? coverPath,
    Expression<String>? coverSourceUrl,
    Expression<String>? sourceProvider,
    Expression<String>? sourceId,
    Expression<String>? sourceUrl,
    Expression<String>? releaseDate,
    Expression<String>? creators,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (originalTitle != null) 'original_title': originalTitle,
      if (aliases != null) 'aliases': aliases,
      if (summary != null) 'summary': summary,
      if (coverPath != null) 'cover_path': coverPath,
      if (coverSourceUrl != null) 'cover_source_url': coverSourceUrl,
      if (sourceProvider != null) 'source_provider': sourceProvider,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (releaseDate != null) 'release_date': releaseDate,
      if (creators != null) 'creators': creators,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorksCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? title,
      Value<String?>? originalTitle,
      Value<String?>? aliases,
      Value<String?>? summary,
      Value<String?>? coverPath,
      Value<String?>? coverSourceUrl,
      Value<String?>? sourceProvider,
      Value<String?>? sourceId,
      Value<String?>? sourceUrl,
      Value<String?>? releaseDate,
      Value<String?>? creators,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String?>? deletedAt,
      Value<int>? rowid}) {
    return WorksCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      aliases: aliases ?? this.aliases,
      summary: summary ?? this.summary,
      coverPath: coverPath ?? this.coverPath,
      coverSourceUrl: coverSourceUrl ?? this.coverSourceUrl,
      sourceProvider: sourceProvider ?? this.sourceProvider,
      sourceId: sourceId ?? this.sourceId,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      releaseDate: releaseDate ?? this.releaseDate,
      creators: creators ?? this.creators,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (coverSourceUrl.present) {
      map['cover_source_url'] = Variable<String>(coverSourceUrl.value);
    }
    if (sourceProvider.present) {
      map['source_provider'] = Variable<String>(sourceProvider.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (creators.present) {
      map['creators'] = Variable<String>(creators.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorksCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('aliases: $aliases, ')
          ..write('summary: $summary, ')
          ..write('coverPath: $coverPath, ')
          ..write('coverSourceUrl: $coverSourceUrl, ')
          ..write('sourceProvider: $sourceProvider, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('creators: $creators, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecordEntriesTable extends RecordEntries
    with TableInfo<$RecordEntriesTable, RecordEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<String> workId = GeneratedColumn<String>(
      'work_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES works (id)'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _shortCommentMeta =
      const VerificationMeta('shortComment');
  @override
  late final GeneratedColumn<String> shortComment = GeneratedColumn<String>(
      'short_comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reviewMeta = const VerificationMeta('review');
  @override
  late final GeneratedColumn<String> review = GeneratedColumn<String>(
      'review', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _spoilerReviewMeta =
      const VerificationMeta('spoilerReview');
  @override
  late final GeneratedColumn<String> spoilerReview = GeneratedColumn<String>(
      'spoiler_review', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<String> startDate = GeneratedColumn<String>(
      'start_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _finishDateMeta =
      const VerificationMeta('finishDate');
  @override
  late final GeneratedColumn<String> finishDate = GeneratedColumn<String>(
      'finish_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<String> progress = GeneratedColumn<String>(
      'progress', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _platformMeta =
      const VerificationMeta('platform');
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
      'platform', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _favoriteLevelMeta =
      const VerificationMeta('favoriteLevel');
  @override
  late final GeneratedColumn<int> favoriteLevel = GeneratedColumn<int>(
      'favorite_level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<String> deletedAt = GeneratedColumn<String>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        workId,
        status,
        rating,
        shortComment,
        review,
        spoilerReview,
        startDate,
        finishDate,
        progress,
        platform,
        favoriteLevel,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'records';
  @override
  VerificationContext validateIntegrity(Insertable<RecordEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('work_id')) {
      context.handle(_workIdMeta,
          workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta));
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('short_comment')) {
      context.handle(
          _shortCommentMeta,
          shortComment.isAcceptableOrUnknown(
              data['short_comment']!, _shortCommentMeta));
    }
    if (data.containsKey('review')) {
      context.handle(_reviewMeta,
          review.isAcceptableOrUnknown(data['review']!, _reviewMeta));
    }
    if (data.containsKey('spoiler_review')) {
      context.handle(
          _spoilerReviewMeta,
          spoilerReview.isAcceptableOrUnknown(
              data['spoiler_review']!, _spoilerReviewMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('finish_date')) {
      context.handle(
          _finishDateMeta,
          finishDate.isAcceptableOrUnknown(
              data['finish_date']!, _finishDateMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('platform')) {
      context.handle(_platformMeta,
          platform.isAcceptableOrUnknown(data['platform']!, _platformMeta));
    }
    if (data.containsKey('favorite_level')) {
      context.handle(
          _favoriteLevelMeta,
          favoriteLevel.isAcceptableOrUnknown(
              data['favorite_level']!, _favoriteLevelMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecordEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}work_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating']),
      shortComment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_comment']),
      review: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}review']),
      spoilerReview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}spoiler_review']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_date']),
      finishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}finish_date']),
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}progress']),
      platform: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}platform']),
      favoriteLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}favorite_level']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $RecordEntriesTable createAlias(String alias) {
    return $RecordEntriesTable(attachedDatabase, alias);
  }
}

class RecordEntry extends DataClass implements Insertable<RecordEntry> {
  final String id;
  final String workId;
  final String status;
  final double? rating;
  final String? shortComment;
  final String? review;
  final String? spoilerReview;
  final String? startDate;
  final String? finishDate;
  final String? progress;
  final String? platform;
  final int? favoriteLevel;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  const RecordEntry(
      {required this.id,
      required this.workId,
      required this.status,
      this.rating,
      this.shortComment,
      this.review,
      this.spoilerReview,
      this.startDate,
      this.finishDate,
      this.progress,
      this.platform,
      this.favoriteLevel,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['work_id'] = Variable<String>(workId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || shortComment != null) {
      map['short_comment'] = Variable<String>(shortComment);
    }
    if (!nullToAbsent || review != null) {
      map['review'] = Variable<String>(review);
    }
    if (!nullToAbsent || spoilerReview != null) {
      map['spoiler_review'] = Variable<String>(spoilerReview);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<String>(startDate);
    }
    if (!nullToAbsent || finishDate != null) {
      map['finish_date'] = Variable<String>(finishDate);
    }
    if (!nullToAbsent || progress != null) {
      map['progress'] = Variable<String>(progress);
    }
    if (!nullToAbsent || platform != null) {
      map['platform'] = Variable<String>(platform);
    }
    if (!nullToAbsent || favoriteLevel != null) {
      map['favorite_level'] = Variable<int>(favoriteLevel);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String>(deletedAt);
    }
    return map;
  }

  RecordEntriesCompanion toCompanion(bool nullToAbsent) {
    return RecordEntriesCompanion(
      id: Value(id),
      workId: Value(workId),
      status: Value(status),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      shortComment: shortComment == null && nullToAbsent
          ? const Value.absent()
          : Value(shortComment),
      review:
          review == null && nullToAbsent ? const Value.absent() : Value(review),
      spoilerReview: spoilerReview == null && nullToAbsent
          ? const Value.absent()
          : Value(spoilerReview),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      finishDate: finishDate == null && nullToAbsent
          ? const Value.absent()
          : Value(finishDate),
      progress: progress == null && nullToAbsent
          ? const Value.absent()
          : Value(progress),
      platform: platform == null && nullToAbsent
          ? const Value.absent()
          : Value(platform),
      favoriteLevel: favoriteLevel == null && nullToAbsent
          ? const Value.absent()
          : Value(favoriteLevel),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory RecordEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordEntry(
      id: serializer.fromJson<String>(json['id']),
      workId: serializer.fromJson<String>(json['workId']),
      status: serializer.fromJson<String>(json['status']),
      rating: serializer.fromJson<double?>(json['rating']),
      shortComment: serializer.fromJson<String?>(json['shortComment']),
      review: serializer.fromJson<String?>(json['review']),
      spoilerReview: serializer.fromJson<String?>(json['spoilerReview']),
      startDate: serializer.fromJson<String?>(json['startDate']),
      finishDate: serializer.fromJson<String?>(json['finishDate']),
      progress: serializer.fromJson<String?>(json['progress']),
      platform: serializer.fromJson<String?>(json['platform']),
      favoriteLevel: serializer.fromJson<int?>(json['favoriteLevel']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workId': serializer.toJson<String>(workId),
      'status': serializer.toJson<String>(status),
      'rating': serializer.toJson<double?>(rating),
      'shortComment': serializer.toJson<String?>(shortComment),
      'review': serializer.toJson<String?>(review),
      'spoilerReview': serializer.toJson<String?>(spoilerReview),
      'startDate': serializer.toJson<String?>(startDate),
      'finishDate': serializer.toJson<String?>(finishDate),
      'progress': serializer.toJson<String?>(progress),
      'platform': serializer.toJson<String?>(platform),
      'favoriteLevel': serializer.toJson<int?>(favoriteLevel),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  RecordEntry copyWith(
          {String? id,
          String? workId,
          String? status,
          Value<double?> rating = const Value.absent(),
          Value<String?> shortComment = const Value.absent(),
          Value<String?> review = const Value.absent(),
          Value<String?> spoilerReview = const Value.absent(),
          Value<String?> startDate = const Value.absent(),
          Value<String?> finishDate = const Value.absent(),
          Value<String?> progress = const Value.absent(),
          Value<String?> platform = const Value.absent(),
          Value<int?> favoriteLevel = const Value.absent(),
          String? createdAt,
          String? updatedAt,
          Value<String?> deletedAt = const Value.absent()}) =>
      RecordEntry(
        id: id ?? this.id,
        workId: workId ?? this.workId,
        status: status ?? this.status,
        rating: rating.present ? rating.value : this.rating,
        shortComment:
            shortComment.present ? shortComment.value : this.shortComment,
        review: review.present ? review.value : this.review,
        spoilerReview:
            spoilerReview.present ? spoilerReview.value : this.spoilerReview,
        startDate: startDate.present ? startDate.value : this.startDate,
        finishDate: finishDate.present ? finishDate.value : this.finishDate,
        progress: progress.present ? progress.value : this.progress,
        platform: platform.present ? platform.value : this.platform,
        favoriteLevel:
            favoriteLevel.present ? favoriteLevel.value : this.favoriteLevel,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  RecordEntry copyWithCompanion(RecordEntriesCompanion data) {
    return RecordEntry(
      id: data.id.present ? data.id.value : this.id,
      workId: data.workId.present ? data.workId.value : this.workId,
      status: data.status.present ? data.status.value : this.status,
      rating: data.rating.present ? data.rating.value : this.rating,
      shortComment: data.shortComment.present
          ? data.shortComment.value
          : this.shortComment,
      review: data.review.present ? data.review.value : this.review,
      spoilerReview: data.spoilerReview.present
          ? data.spoilerReview.value
          : this.spoilerReview,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      finishDate:
          data.finishDate.present ? data.finishDate.value : this.finishDate,
      progress: data.progress.present ? data.progress.value : this.progress,
      platform: data.platform.present ? data.platform.value : this.platform,
      favoriteLevel: data.favoriteLevel.present
          ? data.favoriteLevel.value
          : this.favoriteLevel,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordEntry(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('status: $status, ')
          ..write('rating: $rating, ')
          ..write('shortComment: $shortComment, ')
          ..write('review: $review, ')
          ..write('spoilerReview: $spoilerReview, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate, ')
          ..write('progress: $progress, ')
          ..write('platform: $platform, ')
          ..write('favoriteLevel: $favoriteLevel, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      workId,
      status,
      rating,
      shortComment,
      review,
      spoilerReview,
      startDate,
      finishDate,
      progress,
      platform,
      favoriteLevel,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordEntry &&
          other.id == this.id &&
          other.workId == this.workId &&
          other.status == this.status &&
          other.rating == this.rating &&
          other.shortComment == this.shortComment &&
          other.review == this.review &&
          other.spoilerReview == this.spoilerReview &&
          other.startDate == this.startDate &&
          other.finishDate == this.finishDate &&
          other.progress == this.progress &&
          other.platform == this.platform &&
          other.favoriteLevel == this.favoriteLevel &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class RecordEntriesCompanion extends UpdateCompanion<RecordEntry> {
  final Value<String> id;
  final Value<String> workId;
  final Value<String> status;
  final Value<double?> rating;
  final Value<String?> shortComment;
  final Value<String?> review;
  final Value<String?> spoilerReview;
  final Value<String?> startDate;
  final Value<String?> finishDate;
  final Value<String?> progress;
  final Value<String?> platform;
  final Value<int?> favoriteLevel;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String?> deletedAt;
  final Value<int> rowid;
  const RecordEntriesCompanion({
    this.id = const Value.absent(),
    this.workId = const Value.absent(),
    this.status = const Value.absent(),
    this.rating = const Value.absent(),
    this.shortComment = const Value.absent(),
    this.review = const Value.absent(),
    this.spoilerReview = const Value.absent(),
    this.startDate = const Value.absent(),
    this.finishDate = const Value.absent(),
    this.progress = const Value.absent(),
    this.platform = const Value.absent(),
    this.favoriteLevel = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordEntriesCompanion.insert({
    required String id,
    required String workId,
    required String status,
    this.rating = const Value.absent(),
    this.shortComment = const Value.absent(),
    this.review = const Value.absent(),
    this.spoilerReview = const Value.absent(),
    this.startDate = const Value.absent(),
    this.finishDate = const Value.absent(),
    this.progress = const Value.absent(),
    this.platform = const Value.absent(),
    this.favoriteLevel = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        workId = Value(workId),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<RecordEntry> custom({
    Expression<String>? id,
    Expression<String>? workId,
    Expression<String>? status,
    Expression<double>? rating,
    Expression<String>? shortComment,
    Expression<String>? review,
    Expression<String>? spoilerReview,
    Expression<String>? startDate,
    Expression<String>? finishDate,
    Expression<String>? progress,
    Expression<String>? platform,
    Expression<int>? favoriteLevel,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workId != null) 'work_id': workId,
      if (status != null) 'status': status,
      if (rating != null) 'rating': rating,
      if (shortComment != null) 'short_comment': shortComment,
      if (review != null) 'review': review,
      if (spoilerReview != null) 'spoiler_review': spoilerReview,
      if (startDate != null) 'start_date': startDate,
      if (finishDate != null) 'finish_date': finishDate,
      if (progress != null) 'progress': progress,
      if (platform != null) 'platform': platform,
      if (favoriteLevel != null) 'favorite_level': favoriteLevel,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? workId,
      Value<String>? status,
      Value<double?>? rating,
      Value<String?>? shortComment,
      Value<String?>? review,
      Value<String?>? spoilerReview,
      Value<String?>? startDate,
      Value<String?>? finishDate,
      Value<String?>? progress,
      Value<String?>? platform,
      Value<int?>? favoriteLevel,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String?>? deletedAt,
      Value<int>? rowid}) {
    return RecordEntriesCompanion(
      id: id ?? this.id,
      workId: workId ?? this.workId,
      status: status ?? this.status,
      rating: rating ?? this.rating,
      shortComment: shortComment ?? this.shortComment,
      review: review ?? this.review,
      spoilerReview: spoilerReview ?? this.spoilerReview,
      startDate: startDate ?? this.startDate,
      finishDate: finishDate ?? this.finishDate,
      progress: progress ?? this.progress,
      platform: platform ?? this.platform,
      favoriteLevel: favoriteLevel ?? this.favoriteLevel,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workId.present) {
      map['work_id'] = Variable<String>(workId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (shortComment.present) {
      map['short_comment'] = Variable<String>(shortComment.value);
    }
    if (review.present) {
      map['review'] = Variable<String>(review.value);
    }
    if (spoilerReview.present) {
      map['spoiler_review'] = Variable<String>(spoilerReview.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<String>(startDate.value);
    }
    if (finishDate.present) {
      map['finish_date'] = Variable<String>(finishDate.value);
    }
    if (progress.present) {
      map['progress'] = Variable<String>(progress.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (favoriteLevel.present) {
      map['favorite_level'] = Variable<int>(favoriteLevel.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordEntriesCompanion(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('status: $status, ')
          ..write('rating: $rating, ')
          ..write('shortComment: $shortComment, ')
          ..write('review: $review, ')
          ..write('spoilerReview: $spoilerReview, ')
          ..write('startDate: $startDate, ')
          ..write('finishDate: $finishDate, ')
          ..write('progress: $progress, ')
          ..write('platform: $platform, ')
          ..write('favoriteLevel: $favoriteLevel, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<String> deletedAt = GeneratedColumn<String>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, color, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(Insertable<Tag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final String id;
  final String name;
  final String? color;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  const Tag(
      {required this.id,
      required this.name,
      this.color,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String>(deletedAt);
    }
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Tag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<String?>(json['color']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<String?>(color),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  Tag copyWith(
          {String? id,
          String? name,
          Value<String?> color = const Value.absent(),
          String? createdAt,
          String? updatedAt,
          Value<String?> deletedAt = const Value.absent()}) =>
      Tag(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color.present ? color.value : this.color,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, color, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> color;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<String?> deletedAt;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required String name,
    this.color = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Tag> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? color,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? color,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<String?>? deletedAt,
      Value<int>? rowid}) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecordTagsTable extends RecordTags
    with TableInfo<$RecordTagsTable, RecordTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES records (id)'));
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES tags (id)'));
  @override
  List<GeneratedColumn> get $columns => [recordId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'record_tags';
  @override
  VerificationContext validateIntegrity(Insertable<RecordTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recordId, tagId};
  @override
  RecordTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordTag(
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      tagId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $RecordTagsTable createAlias(String alias) {
    return $RecordTagsTable(attachedDatabase, alias);
  }
}

class RecordTag extends DataClass implements Insertable<RecordTag> {
  final String recordId;
  final String tagId;
  const RecordTag({required this.recordId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['record_id'] = Variable<String>(recordId);
    map['tag_id'] = Variable<String>(tagId);
    return map;
  }

  RecordTagsCompanion toCompanion(bool nullToAbsent) {
    return RecordTagsCompanion(
      recordId: Value(recordId),
      tagId: Value(tagId),
    );
  }

  factory RecordTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordTag(
      recordId: serializer.fromJson<String>(json['recordId']),
      tagId: serializer.fromJson<String>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recordId': serializer.toJson<String>(recordId),
      'tagId': serializer.toJson<String>(tagId),
    };
  }

  RecordTag copyWith({String? recordId, String? tagId}) => RecordTag(
        recordId: recordId ?? this.recordId,
        tagId: tagId ?? this.tagId,
      );
  RecordTag copyWithCompanion(RecordTagsCompanion data) {
    return RecordTag(
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordTag(')
          ..write('recordId: $recordId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recordId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordTag &&
          other.recordId == this.recordId &&
          other.tagId == this.tagId);
}

class RecordTagsCompanion extends UpdateCompanion<RecordTag> {
  final Value<String> recordId;
  final Value<String> tagId;
  final Value<int> rowid;
  const RecordTagsCompanion({
    this.recordId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordTagsCompanion.insert({
    required String recordId,
    required String tagId,
    this.rowid = const Value.absent(),
  })  : recordId = Value(recordId),
        tagId = Value(tagId);
  static Insertable<RecordTag> custom({
    Expression<String>? recordId,
    Expression<String>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recordId != null) 'record_id': recordId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordTagsCompanion copyWith(
      {Value<String>? recordId, Value<String>? tagId, Value<int>? rowid}) {
    return RecordTagsCompanion(
      recordId: recordId ?? this.recordId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordTagsCompanion(')
          ..write('recordId: $recordId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<String> workId = GeneratedColumn<String>(
      'work_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES works (id)'));
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES records (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localPathMeta =
      const VerificationMeta('localPath');
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
      'local_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceUrlMeta =
      const VerificationMeta('sourceUrl');
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
      'source_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<String> deletedAt = GeneratedColumn<String>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, workId, recordId, type, localPath, sourceUrl, createdAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(Insertable<Attachment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('work_id')) {
      context.handle(_workIdMeta,
          workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta));
    }
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(_localPathMeta,
          localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta));
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('source_url')) {
      context.handle(_sourceUrlMeta,
          sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      workId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}work_id']),
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      localPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_path'])!,
      sourceUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_url']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final String id;
  final String? workId;
  final String? recordId;
  final String type;
  final String localPath;
  final String? sourceUrl;
  final String createdAt;
  final String? deletedAt;
  const Attachment(
      {required this.id,
      this.workId,
      this.recordId,
      required this.type,
      required this.localPath,
      this.sourceUrl,
      required this.createdAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || workId != null) {
      map['work_id'] = Variable<String>(workId);
    }
    if (!nullToAbsent || recordId != null) {
      map['record_id'] = Variable<String>(recordId);
    }
    map['type'] = Variable<String>(type);
    map['local_path'] = Variable<String>(localPath);
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<String>(deletedAt);
    }
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      workId:
          workId == null && nullToAbsent ? const Value.absent() : Value(workId),
      recordId: recordId == null && nullToAbsent
          ? const Value.absent()
          : Value(recordId),
      type: Value(type),
      localPath: Value(localPath),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      createdAt: Value(createdAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<String>(json['id']),
      workId: serializer.fromJson<String?>(json['workId']),
      recordId: serializer.fromJson<String?>(json['recordId']),
      type: serializer.fromJson<String>(json['type']),
      localPath: serializer.fromJson<String>(json['localPath']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      deletedAt: serializer.fromJson<String?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'workId': serializer.toJson<String?>(workId),
      'recordId': serializer.toJson<String?>(recordId),
      'type': serializer.toJson<String>(type),
      'localPath': serializer.toJson<String>(localPath),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'createdAt': serializer.toJson<String>(createdAt),
      'deletedAt': serializer.toJson<String?>(deletedAt),
    };
  }

  Attachment copyWith(
          {String? id,
          Value<String?> workId = const Value.absent(),
          Value<String?> recordId = const Value.absent(),
          String? type,
          String? localPath,
          Value<String?> sourceUrl = const Value.absent(),
          String? createdAt,
          Value<String?> deletedAt = const Value.absent()}) =>
      Attachment(
        id: id ?? this.id,
        workId: workId.present ? workId.value : this.workId,
        recordId: recordId.present ? recordId.value : this.recordId,
        type: type ?? this.type,
        localPath: localPath ?? this.localPath,
        sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
        createdAt: createdAt ?? this.createdAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      workId: data.workId.present ? data.workId.value : this.workId,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      type: data.type.present ? data.type.value : this.type,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('recordId: $recordId, ')
          ..write('type: $type, ')
          ..write('localPath: $localPath, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, workId, recordId, type, localPath, sourceUrl, createdAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.workId == this.workId &&
          other.recordId == this.recordId &&
          other.type == this.type &&
          other.localPath == this.localPath &&
          other.sourceUrl == this.sourceUrl &&
          other.createdAt == this.createdAt &&
          other.deletedAt == this.deletedAt);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<String> id;
  final Value<String?> workId;
  final Value<String?> recordId;
  final Value<String> type;
  final Value<String> localPath;
  final Value<String?> sourceUrl;
  final Value<String> createdAt;
  final Value<String?> deletedAt;
  final Value<int> rowid;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.workId = const Value.absent(),
    this.recordId = const Value.absent(),
    this.type = const Value.absent(),
    this.localPath = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    required String id,
    this.workId = const Value.absent(),
    this.recordId = const Value.absent(),
    required String type,
    required String localPath,
    this.sourceUrl = const Value.absent(),
    required String createdAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        localPath = Value(localPath),
        createdAt = Value(createdAt);
  static Insertable<Attachment> custom({
    Expression<String>? id,
    Expression<String>? workId,
    Expression<String>? recordId,
    Expression<String>? type,
    Expression<String>? localPath,
    Expression<String>? sourceUrl,
    Expression<String>? createdAt,
    Expression<String>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workId != null) 'work_id': workId,
      if (recordId != null) 'record_id': recordId,
      if (type != null) 'type': type,
      if (localPath != null) 'local_path': localPath,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttachmentsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? workId,
      Value<String?>? recordId,
      Value<String>? type,
      Value<String>? localPath,
      Value<String?>? sourceUrl,
      Value<String>? createdAt,
      Value<String?>? deletedAt,
      Value<int>? rowid}) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      workId: workId ?? this.workId,
      recordId: recordId ?? this.recordId,
      type: type ?? this.type,
      localPath: localPath ?? this.localPath,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (workId.present) {
      map['work_id'] = Variable<String>(workId.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<String>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('workId: $workId, ')
          ..write('recordId: $recordId, ')
          ..write('type: $type, ')
          ..write('localPath: $localPath, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExternalCachesTable extends ExternalCaches
    with TableInfo<$ExternalCachesTable, ExternalCache> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExternalCachesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _providerMeta =
      const VerificationMeta('provider');
  @override
  late final GeneratedColumn<String> provider = GeneratedColumn<String>(
      'provider', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _responseJsonMeta =
      const VerificationMeta('responseJson');
  @override
  late final GeneratedColumn<String> responseJson = GeneratedColumn<String>(
      'response_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<String> cachedAt = GeneratedColumn<String>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, provider, query, type, responseJson, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'external_cache';
  @override
  VerificationContext validateIntegrity(Insertable<ExternalCache> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('provider')) {
      context.handle(_providerMeta,
          provider.isAcceptableOrUnknown(data['provider']!, _providerMeta));
    } else if (isInserting) {
      context.missing(_providerMeta);
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('response_json')) {
      context.handle(
          _responseJsonMeta,
          responseJson.isAcceptableOrUnknown(
              data['response_json']!, _responseJsonMeta));
    } else if (isInserting) {
      context.missing(_responseJsonMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExternalCache map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExternalCache(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      provider: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}provider'])!,
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type']),
      responseJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}response_json'])!,
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $ExternalCachesTable createAlias(String alias) {
    return $ExternalCachesTable(attachedDatabase, alias);
  }
}

class ExternalCache extends DataClass implements Insertable<ExternalCache> {
  final String id;
  final String provider;
  final String query;
  final String? type;
  final String responseJson;
  final String cachedAt;
  const ExternalCache(
      {required this.id,
      required this.provider,
      required this.query,
      this.type,
      required this.responseJson,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['provider'] = Variable<String>(provider);
    map['query'] = Variable<String>(query);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    map['response_json'] = Variable<String>(responseJson);
    map['cached_at'] = Variable<String>(cachedAt);
    return map;
  }

  ExternalCachesCompanion toCompanion(bool nullToAbsent) {
    return ExternalCachesCompanion(
      id: Value(id),
      provider: Value(provider),
      query: Value(query),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      responseJson: Value(responseJson),
      cachedAt: Value(cachedAt),
    );
  }

  factory ExternalCache.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExternalCache(
      id: serializer.fromJson<String>(json['id']),
      provider: serializer.fromJson<String>(json['provider']),
      query: serializer.fromJson<String>(json['query']),
      type: serializer.fromJson<String?>(json['type']),
      responseJson: serializer.fromJson<String>(json['responseJson']),
      cachedAt: serializer.fromJson<String>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'provider': serializer.toJson<String>(provider),
      'query': serializer.toJson<String>(query),
      'type': serializer.toJson<String?>(type),
      'responseJson': serializer.toJson<String>(responseJson),
      'cachedAt': serializer.toJson<String>(cachedAt),
    };
  }

  ExternalCache copyWith(
          {String? id,
          String? provider,
          String? query,
          Value<String?> type = const Value.absent(),
          String? responseJson,
          String? cachedAt}) =>
      ExternalCache(
        id: id ?? this.id,
        provider: provider ?? this.provider,
        query: query ?? this.query,
        type: type.present ? type.value : this.type,
        responseJson: responseJson ?? this.responseJson,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  ExternalCache copyWithCompanion(ExternalCachesCompanion data) {
    return ExternalCache(
      id: data.id.present ? data.id.value : this.id,
      provider: data.provider.present ? data.provider.value : this.provider,
      query: data.query.present ? data.query.value : this.query,
      type: data.type.present ? data.type.value : this.type,
      responseJson: data.responseJson.present
          ? data.responseJson.value
          : this.responseJson,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExternalCache(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('query: $query, ')
          ..write('type: $type, ')
          ..write('responseJson: $responseJson, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, provider, query, type, responseJson, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExternalCache &&
          other.id == this.id &&
          other.provider == this.provider &&
          other.query == this.query &&
          other.type == this.type &&
          other.responseJson == this.responseJson &&
          other.cachedAt == this.cachedAt);
}

class ExternalCachesCompanion extends UpdateCompanion<ExternalCache> {
  final Value<String> id;
  final Value<String> provider;
  final Value<String> query;
  final Value<String?> type;
  final Value<String> responseJson;
  final Value<String> cachedAt;
  final Value<int> rowid;
  const ExternalCachesCompanion({
    this.id = const Value.absent(),
    this.provider = const Value.absent(),
    this.query = const Value.absent(),
    this.type = const Value.absent(),
    this.responseJson = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExternalCachesCompanion.insert({
    required String id,
    required String provider,
    required String query,
    this.type = const Value.absent(),
    required String responseJson,
    required String cachedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        provider = Value(provider),
        query = Value(query),
        responseJson = Value(responseJson),
        cachedAt = Value(cachedAt);
  static Insertable<ExternalCache> custom({
    Expression<String>? id,
    Expression<String>? provider,
    Expression<String>? query,
    Expression<String>? type,
    Expression<String>? responseJson,
    Expression<String>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (provider != null) 'provider': provider,
      if (query != null) 'query': query,
      if (type != null) 'type': type,
      if (responseJson != null) 'response_json': responseJson,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExternalCachesCompanion copyWith(
      {Value<String>? id,
      Value<String>? provider,
      Value<String>? query,
      Value<String?>? type,
      Value<String>? responseJson,
      Value<String>? cachedAt,
      Value<int>? rowid}) {
    return ExternalCachesCompanion(
      id: id ?? this.id,
      provider: provider ?? this.provider,
      query: query ?? this.query,
      type: type ?? this.type,
      responseJson: responseJson ?? this.responseJson,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (provider.present) {
      map['provider'] = Variable<String>(provider.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (responseJson.present) {
      map['response_json'] = Variable<String>(responseJson.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<String>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExternalCachesCompanion(')
          ..write('id: $id, ')
          ..write('provider: $provider, ')
          ..write('query: $query, ')
          ..write('type: $type, ')
          ..write('responseJson: $responseJson, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorksTable works = $WorksTable(this);
  late final $RecordEntriesTable recordEntries = $RecordEntriesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $RecordTagsTable recordTags = $RecordTagsTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $ExternalCachesTable externalCaches = $ExternalCachesTable(this);
  late final Index recordsWorkId = Index(
      'records_work_id', 'CREATE INDEX records_work_id ON records (work_id)');
  late final Index externalCacheProviderQuery = Index(
      'external_cache_provider_query',
      'CREATE INDEX external_cache_provider_query ON external_cache (provider, "query")');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        works,
        recordEntries,
        tags,
        recordTags,
        attachments,
        externalCaches,
        recordsWorkId,
        externalCacheProviderQuery
      ];
}

typedef $$WorksTableCreateCompanionBuilder = WorksCompanion Function({
  required String id,
  required String type,
  required String title,
  Value<String?> originalTitle,
  Value<String?> aliases,
  Value<String?> summary,
  Value<String?> coverPath,
  Value<String?> coverSourceUrl,
  Value<String?> sourceProvider,
  Value<String?> sourceId,
  Value<String?> sourceUrl,
  Value<String?> releaseDate,
  Value<String?> creators,
  required String createdAt,
  required String updatedAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});
typedef $$WorksTableUpdateCompanionBuilder = WorksCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> title,
  Value<String?> originalTitle,
  Value<String?> aliases,
  Value<String?> summary,
  Value<String?> coverPath,
  Value<String?> coverSourceUrl,
  Value<String?> sourceProvider,
  Value<String?> sourceId,
  Value<String?> sourceUrl,
  Value<String?> releaseDate,
  Value<String?> creators,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});

final class $$WorksTableReferences
    extends BaseReferences<_$AppDatabase, $WorksTable, Work> {
  $$WorksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecordEntriesTable, List<RecordEntry>>
      _recordEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recordEntries,
              aliasName: 'works__id__records__work_id');

  $$RecordEntriesTableProcessedTableManager get recordEntriesRefs {
    final manager = $$RecordEntriesTableTableManager($_db, $_db.recordEntries)
        .filter((f) => f.workId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recordEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AttachmentsTable, List<Attachment>>
      _attachmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.attachments,
              aliasName: 'works__id__attachments__work_id');

  $$AttachmentsTableProcessedTableManager get attachmentsRefs {
    final manager = $$AttachmentsTableTableManager($_db, $_db.attachments)
        .filter((f) => f.workId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_attachmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorksTableFilterComposer extends Composer<_$AppDatabase, $WorksTable> {
  $$WorksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get originalTitle => $composableBuilder(
      column: $table.originalTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aliases => $composableBuilder(
      column: $table.aliases, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverPath => $composableBuilder(
      column: $table.coverPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverSourceUrl => $composableBuilder(
      column: $table.coverSourceUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceProvider => $composableBuilder(
      column: $table.sourceProvider,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get creators => $composableBuilder(
      column: $table.creators, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> recordEntriesRefs(
      Expression<bool> Function($$RecordEntriesTableFilterComposer f) f) {
    final $$RecordEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.workId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableFilterComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> attachmentsRefs(
      Expression<bool> Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.workId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableFilterComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorksTableOrderingComposer
    extends Composer<_$AppDatabase, $WorksTable> {
  $$WorksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get originalTitle => $composableBuilder(
      column: $table.originalTitle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aliases => $composableBuilder(
      column: $table.aliases, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverPath => $composableBuilder(
      column: $table.coverPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverSourceUrl => $composableBuilder(
      column: $table.coverSourceUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceProvider => $composableBuilder(
      column: $table.sourceProvider,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceId => $composableBuilder(
      column: $table.sourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get creators => $composableBuilder(
      column: $table.creators, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$WorksTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorksTable> {
  $$WorksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get originalTitle => $composableBuilder(
      column: $table.originalTitle, builder: (column) => column);

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get coverPath =>
      $composableBuilder(column: $table.coverPath, builder: (column) => column);

  GeneratedColumn<String> get coverSourceUrl => $composableBuilder(
      column: $table.coverSourceUrl, builder: (column) => column);

  GeneratedColumn<String> get sourceProvider => $composableBuilder(
      column: $table.sourceProvider, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<String> get creators =>
      $composableBuilder(column: $table.creators, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> recordEntriesRefs<T extends Object>(
      Expression<T> Function($$RecordEntriesTableAnnotationComposer a) f) {
    final $$RecordEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.workId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> attachmentsRefs<T extends Object>(
      Expression<T> Function($$AttachmentsTableAnnotationComposer a) f) {
    final $$AttachmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.workId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorksTable,
    Work,
    $$WorksTableFilterComposer,
    $$WorksTableOrderingComposer,
    $$WorksTableAnnotationComposer,
    $$WorksTableCreateCompanionBuilder,
    $$WorksTableUpdateCompanionBuilder,
    (Work, $$WorksTableReferences),
    Work,
    PrefetchHooks Function({bool recordEntriesRefs, bool attachmentsRefs})> {
  $$WorksTableTableManager(_$AppDatabase db, $WorksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> originalTitle = const Value.absent(),
            Value<String?> aliases = const Value.absent(),
            Value<String?> summary = const Value.absent(),
            Value<String?> coverPath = const Value.absent(),
            Value<String?> coverSourceUrl = const Value.absent(),
            Value<String?> sourceProvider = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> sourceUrl = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<String?> creators = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorksCompanion(
            id: id,
            type: type,
            title: title,
            originalTitle: originalTitle,
            aliases: aliases,
            summary: summary,
            coverPath: coverPath,
            coverSourceUrl: coverSourceUrl,
            sourceProvider: sourceProvider,
            sourceId: sourceId,
            sourceUrl: sourceUrl,
            releaseDate: releaseDate,
            creators: creators,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String title,
            Value<String?> originalTitle = const Value.absent(),
            Value<String?> aliases = const Value.absent(),
            Value<String?> summary = const Value.absent(),
            Value<String?> coverPath = const Value.absent(),
            Value<String?> coverSourceUrl = const Value.absent(),
            Value<String?> sourceProvider = const Value.absent(),
            Value<String?> sourceId = const Value.absent(),
            Value<String?> sourceUrl = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<String?> creators = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorksCompanion.insert(
            id: id,
            type: type,
            title: title,
            originalTitle: originalTitle,
            aliases: aliases,
            summary: summary,
            coverPath: coverPath,
            coverSourceUrl: coverSourceUrl,
            sourceProvider: sourceProvider,
            sourceId: sourceId,
            sourceUrl: sourceUrl,
            releaseDate: releaseDate,
            creators: creators,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$WorksTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {recordEntriesRefs = false, attachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recordEntriesRefs) db.recordEntries,
                if (attachmentsRefs) db.attachments
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recordEntriesRefs)
                    await $_getPrefetchedData<Work, $WorksTable, RecordEntry>(
                        currentTable: table,
                        referencedTable:
                            $$WorksTableReferences._recordEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorksTableReferences(db, table, p0)
                                .recordEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.workId == item.id),
                        typedResults: items),
                  if (attachmentsRefs)
                    await $_getPrefetchedData<Work, $WorksTable, Attachment>(
                        currentTable: table,
                        referencedTable:
                            $$WorksTableReferences._attachmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorksTableReferences(db, table, p0)
                                .attachmentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.workId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorksTable,
    Work,
    $$WorksTableFilterComposer,
    $$WorksTableOrderingComposer,
    $$WorksTableAnnotationComposer,
    $$WorksTableCreateCompanionBuilder,
    $$WorksTableUpdateCompanionBuilder,
    (Work, $$WorksTableReferences),
    Work,
    PrefetchHooks Function({bool recordEntriesRefs, bool attachmentsRefs})>;
typedef $$RecordEntriesTableCreateCompanionBuilder = RecordEntriesCompanion
    Function({
  required String id,
  required String workId,
  required String status,
  Value<double?> rating,
  Value<String?> shortComment,
  Value<String?> review,
  Value<String?> spoilerReview,
  Value<String?> startDate,
  Value<String?> finishDate,
  Value<String?> progress,
  Value<String?> platform,
  Value<int?> favoriteLevel,
  required String createdAt,
  required String updatedAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});
typedef $$RecordEntriesTableUpdateCompanionBuilder = RecordEntriesCompanion
    Function({
  Value<String> id,
  Value<String> workId,
  Value<String> status,
  Value<double?> rating,
  Value<String?> shortComment,
  Value<String?> review,
  Value<String?> spoilerReview,
  Value<String?> startDate,
  Value<String?> finishDate,
  Value<String?> progress,
  Value<String?> platform,
  Value<int?> favoriteLevel,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});

final class $$RecordEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $RecordEntriesTable, RecordEntry> {
  $$RecordEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorksTable _workIdTable(_$AppDatabase db) =>
      db.works.createAlias('records__work_id__works__id');

  $$WorksTableProcessedTableManager get workId {
    final $_column = $_itemColumn<String>('work_id')!;

    final manager = $$WorksTableTableManager($_db, $_db.works)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RecordTagsTable, List<RecordTag>>
      _recordTagsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recordTags,
              aliasName: 'records__id__record_tags__record_id');

  $$RecordTagsTableProcessedTableManager get recordTagsRefs {
    final manager = $$RecordTagsTableTableManager($_db, $_db.recordTags)
        .filter((f) => f.recordId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recordTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AttachmentsTable, List<Attachment>>
      _attachmentsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.attachments,
              aliasName: 'records__id__attachments__record_id');

  $$AttachmentsTableProcessedTableManager get attachmentsRefs {
    final manager = $$AttachmentsTableTableManager($_db, $_db.attachments)
        .filter((f) => f.recordId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_attachmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RecordEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $RecordEntriesTable> {
  $$RecordEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortComment => $composableBuilder(
      column: $table.shortComment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get review => $composableBuilder(
      column: $table.review, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get spoilerReview => $composableBuilder(
      column: $table.spoilerReview, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get favoriteLevel => $composableBuilder(
      column: $table.favoriteLevel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$WorksTableFilterComposer get workId {
    final $$WorksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorksTableFilterComposer(
              $db: $db,
              $table: $db.works,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> recordTagsRefs(
      Expression<bool> Function($$RecordTagsTableFilterComposer f) f) {
    final $$RecordTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recordTags,
        getReferencedColumn: (t) => t.recordId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordTagsTableFilterComposer(
              $db: $db,
              $table: $db.recordTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> attachmentsRefs(
      Expression<bool> Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.recordId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableFilterComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecordEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $RecordEntriesTable> {
  $$RecordEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortComment => $composableBuilder(
      column: $table.shortComment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get review => $composableBuilder(
      column: $table.review, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get spoilerReview => $composableBuilder(
      column: $table.spoilerReview,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get platform => $composableBuilder(
      column: $table.platform, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get favoriteLevel => $composableBuilder(
      column: $table.favoriteLevel,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$WorksTableOrderingComposer get workId {
    final $$WorksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorksTableOrderingComposer(
              $db: $db,
              $table: $db.works,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecordEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecordEntriesTable> {
  $$RecordEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get shortComment => $composableBuilder(
      column: $table.shortComment, builder: (column) => column);

  GeneratedColumn<String> get review =>
      $composableBuilder(column: $table.review, builder: (column) => column);

  GeneratedColumn<String> get spoilerReview => $composableBuilder(
      column: $table.spoilerReview, builder: (column) => column);

  GeneratedColumn<String> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get finishDate => $composableBuilder(
      column: $table.finishDate, builder: (column) => column);

  GeneratedColumn<String> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get platform =>
      $composableBuilder(column: $table.platform, builder: (column) => column);

  GeneratedColumn<int> get favoriteLevel => $composableBuilder(
      column: $table.favoriteLevel, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$WorksTableAnnotationComposer get workId {
    final $$WorksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorksTableAnnotationComposer(
              $db: $db,
              $table: $db.works,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> recordTagsRefs<T extends Object>(
      Expression<T> Function($$RecordTagsTableAnnotationComposer a) f) {
    final $$RecordTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recordTags,
        getReferencedColumn: (t) => t.recordId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.recordTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> attachmentsRefs<T extends Object>(
      Expression<T> Function($$AttachmentsTableAnnotationComposer a) f) {
    final $$AttachmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.attachments,
        getReferencedColumn: (t) => t.recordId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttachmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.attachments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecordEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecordEntriesTable,
    RecordEntry,
    $$RecordEntriesTableFilterComposer,
    $$RecordEntriesTableOrderingComposer,
    $$RecordEntriesTableAnnotationComposer,
    $$RecordEntriesTableCreateCompanionBuilder,
    $$RecordEntriesTableUpdateCompanionBuilder,
    (RecordEntry, $$RecordEntriesTableReferences),
    RecordEntry,
    PrefetchHooks Function(
        {bool workId, bool recordTagsRefs, bool attachmentsRefs})> {
  $$RecordEntriesTableTableManager(_$AppDatabase db, $RecordEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> workId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double?> rating = const Value.absent(),
            Value<String?> shortComment = const Value.absent(),
            Value<String?> review = const Value.absent(),
            Value<String?> spoilerReview = const Value.absent(),
            Value<String?> startDate = const Value.absent(),
            Value<String?> finishDate = const Value.absent(),
            Value<String?> progress = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<int?> favoriteLevel = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordEntriesCompanion(
            id: id,
            workId: workId,
            status: status,
            rating: rating,
            shortComment: shortComment,
            review: review,
            spoilerReview: spoilerReview,
            startDate: startDate,
            finishDate: finishDate,
            progress: progress,
            platform: platform,
            favoriteLevel: favoriteLevel,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String workId,
            required String status,
            Value<double?> rating = const Value.absent(),
            Value<String?> shortComment = const Value.absent(),
            Value<String?> review = const Value.absent(),
            Value<String?> spoilerReview = const Value.absent(),
            Value<String?> startDate = const Value.absent(),
            Value<String?> finishDate = const Value.absent(),
            Value<String?> progress = const Value.absent(),
            Value<String?> platform = const Value.absent(),
            Value<int?> favoriteLevel = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordEntriesCompanion.insert(
            id: id,
            workId: workId,
            status: status,
            rating: rating,
            shortComment: shortComment,
            review: review,
            spoilerReview: spoilerReview,
            startDate: startDate,
            finishDate: finishDate,
            progress: progress,
            platform: platform,
            favoriteLevel: favoriteLevel,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecordEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workId = false,
              recordTagsRefs = false,
              attachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recordTagsRefs) db.recordTags,
                if (attachmentsRefs) db.attachments
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workId,
                    referencedTable:
                        $$RecordEntriesTableReferences._workIdTable(db),
                    referencedColumn:
                        $$RecordEntriesTableReferences._workIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recordTagsRefs)
                    await $_getPrefetchedData<RecordEntry, $RecordEntriesTable,
                            RecordTag>(
                        currentTable: table,
                        referencedTable: $$RecordEntriesTableReferences
                            ._recordTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecordEntriesTableReferences(db, table, p0)
                                .recordTagsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.recordId == item.id),
                        typedResults: items),
                  if (attachmentsRefs)
                    await $_getPrefetchedData<RecordEntry, $RecordEntriesTable,
                            Attachment>(
                        currentTable: table,
                        referencedTable: $$RecordEntriesTableReferences
                            ._attachmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecordEntriesTableReferences(db, table, p0)
                                .attachmentsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.recordId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RecordEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecordEntriesTable,
    RecordEntry,
    $$RecordEntriesTableFilterComposer,
    $$RecordEntriesTableOrderingComposer,
    $$RecordEntriesTableAnnotationComposer,
    $$RecordEntriesTableCreateCompanionBuilder,
    $$RecordEntriesTableUpdateCompanionBuilder,
    (RecordEntry, $$RecordEntriesTableReferences),
    RecordEntry,
    PrefetchHooks Function(
        {bool workId, bool recordTagsRefs, bool attachmentsRefs})>;
typedef $$TagsTableCreateCompanionBuilder = TagsCompanion Function({
  required String id,
  required String name,
  Value<String?> color,
  required String createdAt,
  required String updatedAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});
typedef $$TagsTableUpdateCompanionBuilder = TagsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> color,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecordTagsTable, List<RecordTag>>
      _recordTagsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recordTags,
              aliasName: 'tags__id__record_tags__tag_id');

  $$RecordTagsTableProcessedTableManager get recordTagsRefs {
    final manager = $$RecordTagsTableTableManager($_db, $_db.recordTags)
        .filter((f) => f.tagId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_recordTagsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> recordTagsRefs(
      Expression<bool> Function($$RecordTagsTableFilterComposer f) f) {
    final $$RecordTagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recordTags,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordTagsTableFilterComposer(
              $db: $db,
              $table: $db.recordTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> recordTagsRefs<T extends Object>(
      Expression<T> Function($$RecordTagsTableAnnotationComposer a) f) {
    final $$RecordTagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recordTags,
        getReferencedColumn: (t) => t.tagId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordTagsTableAnnotationComposer(
              $db: $db,
              $table: $db.recordTags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool recordTagsRefs})> {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsCompanion(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> color = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TagsCompanion.insert(
            id: id,
            name: name,
            color: color,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TagsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({recordTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (recordTagsRefs) db.recordTags],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recordTagsRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, RecordTag>(
                        currentTable: table,
                        referencedTable:
                            $$TagsTableReferences._recordTagsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TagsTableReferences(db, table, p0).recordTagsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.tagId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TagsTable,
    Tag,
    $$TagsTableFilterComposer,
    $$TagsTableOrderingComposer,
    $$TagsTableAnnotationComposer,
    $$TagsTableCreateCompanionBuilder,
    $$TagsTableUpdateCompanionBuilder,
    (Tag, $$TagsTableReferences),
    Tag,
    PrefetchHooks Function({bool recordTagsRefs})>;
typedef $$RecordTagsTableCreateCompanionBuilder = RecordTagsCompanion Function({
  required String recordId,
  required String tagId,
  Value<int> rowid,
});
typedef $$RecordTagsTableUpdateCompanionBuilder = RecordTagsCompanion Function({
  Value<String> recordId,
  Value<String> tagId,
  Value<int> rowid,
});

final class $$RecordTagsTableReferences
    extends BaseReferences<_$AppDatabase, $RecordTagsTable, RecordTag> {
  $$RecordTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecordEntriesTable _recordIdTable(_$AppDatabase db) =>
      db.recordEntries.createAlias('record_tags__record_id__records__id');

  $$RecordEntriesTableProcessedTableManager get recordId {
    final $_column = $_itemColumn<String>('record_id')!;

    final manager = $$RecordEntriesTableTableManager($_db, $_db.recordEntries)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TagsTable _tagIdTable(_$AppDatabase db) =>
      db.tags.createAlias('record_tags__tag_id__tags__id');

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<String>('tag_id')!;

    final manager = $$TagsTableTableManager($_db, $_db.tags)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RecordTagsTableFilterComposer
    extends Composer<_$AppDatabase, $RecordTagsTable> {
  $$RecordTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecordEntriesTableFilterComposer get recordId {
    final $$RecordEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recordId,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableFilterComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableFilterComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecordTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecordTagsTable> {
  $$RecordTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecordEntriesTableOrderingComposer get recordId {
    final $$RecordEntriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recordId,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableOrderingComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableOrderingComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecordTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecordTagsTable> {
  $$RecordTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecordEntriesTableAnnotationComposer get recordId {
    final $$RecordEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recordId,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.tagId,
        referencedTable: $db.tags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TagsTableAnnotationComposer(
              $db: $db,
              $table: $db.tags,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecordTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecordTagsTable,
    RecordTag,
    $$RecordTagsTableFilterComposer,
    $$RecordTagsTableOrderingComposer,
    $$RecordTagsTableAnnotationComposer,
    $$RecordTagsTableCreateCompanionBuilder,
    $$RecordTagsTableUpdateCompanionBuilder,
    (RecordTag, $$RecordTagsTableReferences),
    RecordTag,
    PrefetchHooks Function({bool recordId, bool tagId})> {
  $$RecordTagsTableTableManager(_$AppDatabase db, $RecordTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> recordId = const Value.absent(),
            Value<String> tagId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordTagsCompanion(
            recordId: recordId,
            tagId: tagId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String recordId,
            required String tagId,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordTagsCompanion.insert(
            recordId: recordId,
            tagId: tagId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecordTagsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recordId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (recordId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recordId,
                    referencedTable:
                        $$RecordTagsTableReferences._recordIdTable(db),
                    referencedColumn:
                        $$RecordTagsTableReferences._recordIdTable(db).id,
                  ) as T;
                }
                if (tagId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.tagId,
                    referencedTable:
                        $$RecordTagsTableReferences._tagIdTable(db),
                    referencedColumn:
                        $$RecordTagsTableReferences._tagIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RecordTagsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecordTagsTable,
    RecordTag,
    $$RecordTagsTableFilterComposer,
    $$RecordTagsTableOrderingComposer,
    $$RecordTagsTableAnnotationComposer,
    $$RecordTagsTableCreateCompanionBuilder,
    $$RecordTagsTableUpdateCompanionBuilder,
    (RecordTag, $$RecordTagsTableReferences),
    RecordTag,
    PrefetchHooks Function({bool recordId, bool tagId})>;
typedef $$AttachmentsTableCreateCompanionBuilder = AttachmentsCompanion
    Function({
  required String id,
  Value<String?> workId,
  Value<String?> recordId,
  required String type,
  required String localPath,
  Value<String?> sourceUrl,
  required String createdAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});
typedef $$AttachmentsTableUpdateCompanionBuilder = AttachmentsCompanion
    Function({
  Value<String> id,
  Value<String?> workId,
  Value<String?> recordId,
  Value<String> type,
  Value<String> localPath,
  Value<String?> sourceUrl,
  Value<String> createdAt,
  Value<String?> deletedAt,
  Value<int> rowid,
});

final class $$AttachmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AttachmentsTable, Attachment> {
  $$AttachmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $WorksTable _workIdTable(_$AppDatabase db) =>
      db.works.createAlias('attachments__work_id__works__id');

  $$WorksTableProcessedTableManager? get workId {
    final $_column = $_itemColumn<String>('work_id');
    if ($_column == null) return null;
    final manager = $$WorksTableTableManager($_db, $_db.works)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RecordEntriesTable _recordIdTable(_$AppDatabase db) =>
      db.recordEntries.createAlias('attachments__record_id__records__id');

  $$RecordEntriesTableProcessedTableManager? get recordId {
    final $_column = $_itemColumn<String>('record_id');
    if ($_column == null) return null;
    final manager = $$RecordEntriesTableTableManager($_db, $_db.recordEntries)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recordIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$WorksTableFilterComposer get workId {
    final $$WorksTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorksTableFilterComposer(
              $db: $db,
              $table: $db.works,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecordEntriesTableFilterComposer get recordId {
    final $$RecordEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recordId,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableFilterComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localPath => $composableBuilder(
      column: $table.localPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
      column: $table.sourceUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$WorksTableOrderingComposer get workId {
    final $$WorksTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorksTableOrderingComposer(
              $db: $db,
              $table: $db.works,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecordEntriesTableOrderingComposer get recordId {
    final $$RecordEntriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recordId,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableOrderingComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$WorksTableAnnotationComposer get workId {
    final $$WorksTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorksTableAnnotationComposer(
              $db: $db,
              $table: $db.works,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecordEntriesTableAnnotationComposer get recordId {
    final $$RecordEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recordId,
        referencedTable: $db.recordEntries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecordEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.recordEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttachmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableAnnotationComposer,
    $$AttachmentsTableCreateCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder,
    (Attachment, $$AttachmentsTableReferences),
    Attachment,
    PrefetchHooks Function({bool workId, bool recordId})> {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> workId = const Value.absent(),
            Value<String?> recordId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> localPath = const Value.absent(),
            Value<String?> sourceUrl = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentsCompanion(
            id: id,
            workId: workId,
            recordId: recordId,
            type: type,
            localPath: localPath,
            sourceUrl: sourceUrl,
            createdAt: createdAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> workId = const Value.absent(),
            Value<String?> recordId = const Value.absent(),
            required String type,
            required String localPath,
            Value<String?> sourceUrl = const Value.absent(),
            required String createdAt,
            Value<String?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentsCompanion.insert(
            id: id,
            workId: workId,
            recordId: recordId,
            type: type,
            localPath: localPath,
            sourceUrl: sourceUrl,
            createdAt: createdAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AttachmentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({workId = false, recordId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workId,
                    referencedTable:
                        $$AttachmentsTableReferences._workIdTable(db),
                    referencedColumn:
                        $$AttachmentsTableReferences._workIdTable(db).id,
                  ) as T;
                }
                if (recordId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recordId,
                    referencedTable:
                        $$AttachmentsTableReferences._recordIdTable(db),
                    referencedColumn:
                        $$AttachmentsTableReferences._recordIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AttachmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableAnnotationComposer,
    $$AttachmentsTableCreateCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder,
    (Attachment, $$AttachmentsTableReferences),
    Attachment,
    PrefetchHooks Function({bool workId, bool recordId})>;
typedef $$ExternalCachesTableCreateCompanionBuilder = ExternalCachesCompanion
    Function({
  required String id,
  required String provider,
  required String query,
  Value<String?> type,
  required String responseJson,
  required String cachedAt,
  Value<int> rowid,
});
typedef $$ExternalCachesTableUpdateCompanionBuilder = ExternalCachesCompanion
    Function({
  Value<String> id,
  Value<String> provider,
  Value<String> query,
  Value<String?> type,
  Value<String> responseJson,
  Value<String> cachedAt,
  Value<int> rowid,
});

class $$ExternalCachesTableFilterComposer
    extends Composer<_$AppDatabase, $ExternalCachesTable> {
  $$ExternalCachesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get provider => $composableBuilder(
      column: $table.provider, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get responseJson => $composableBuilder(
      column: $table.responseJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$ExternalCachesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExternalCachesTable> {
  $$ExternalCachesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get provider => $composableBuilder(
      column: $table.provider, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get responseJson => $composableBuilder(
      column: $table.responseJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$ExternalCachesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExternalCachesTable> {
  $$ExternalCachesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get provider =>
      $composableBuilder(column: $table.provider, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get responseJson => $composableBuilder(
      column: $table.responseJson, builder: (column) => column);

  GeneratedColumn<String> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$ExternalCachesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExternalCachesTable,
    ExternalCache,
    $$ExternalCachesTableFilterComposer,
    $$ExternalCachesTableOrderingComposer,
    $$ExternalCachesTableAnnotationComposer,
    $$ExternalCachesTableCreateCompanionBuilder,
    $$ExternalCachesTableUpdateCompanionBuilder,
    (
      ExternalCache,
      BaseReferences<_$AppDatabase, $ExternalCachesTable, ExternalCache>
    ),
    ExternalCache,
    PrefetchHooks Function()> {
  $$ExternalCachesTableTableManager(
      _$AppDatabase db, $ExternalCachesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExternalCachesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExternalCachesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExternalCachesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> provider = const Value.absent(),
            Value<String> query = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String> responseJson = const Value.absent(),
            Value<String> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExternalCachesCompanion(
            id: id,
            provider: provider,
            query: query,
            type: type,
            responseJson: responseJson,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String provider,
            required String query,
            Value<String?> type = const Value.absent(),
            required String responseJson,
            required String cachedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExternalCachesCompanion.insert(
            id: id,
            provider: provider,
            query: query,
            type: type,
            responseJson: responseJson,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExternalCachesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExternalCachesTable,
    ExternalCache,
    $$ExternalCachesTableFilterComposer,
    $$ExternalCachesTableOrderingComposer,
    $$ExternalCachesTableAnnotationComposer,
    $$ExternalCachesTableCreateCompanionBuilder,
    $$ExternalCachesTableUpdateCompanionBuilder,
    (
      ExternalCache,
      BaseReferences<_$AppDatabase, $ExternalCachesTable, ExternalCache>
    ),
    ExternalCache,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorksTableTableManager get works =>
      $$WorksTableTableManager(_db, _db.works);
  $$RecordEntriesTableTableManager get recordEntries =>
      $$RecordEntriesTableTableManager(_db, _db.recordEntries);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$RecordTagsTableTableManager get recordTags =>
      $$RecordTagsTableTableManager(_db, _db.recordTags);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$ExternalCachesTableTableManager get externalCaches =>
      $$ExternalCachesTableTableManager(_db, _db.externalCaches);
}
