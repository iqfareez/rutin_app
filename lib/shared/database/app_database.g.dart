// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HabitItemsTable extends HabitItems
    with TableInfo<$HabitItemsTable, HabitItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    tag,
    color,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HabitItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $HabitItemsTable createAlias(String alias) {
    return $HabitItemsTable(attachedDatabase, alias);
  }
}

class HabitItem extends DataClass implements Insertable<HabitItem> {
  final String id;
  final String title;
  final String description;
  final String tag;
  final int color;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const HabitItem({
    required this.id,
    required this.title,
    required this.description,
    required this.tag,
    required this.color,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['tag'] = Variable<String>(tag);
    map['color'] = Variable<int>(color);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  HabitItemsCompanion toCompanion(bool nullToAbsent) {
    return HabitItemsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      tag: Value(tag),
      color: Value(color),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory HabitItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitItem(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      tag: serializer.fromJson<String>(json['tag']),
      color: serializer.fromJson<int>(json['color']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'tag': serializer.toJson<String>(tag),
      'color': serializer.toJson<int>(color),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  HabitItem copyWith({
    String? id,
    String? title,
    String? description,
    String? tag,
    int? color,
    Value<DateTime?> createdAt = const Value.absent(),
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => HabitItem(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    tag: tag ?? this.tag,
    color: color ?? this.color,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  HabitItem copyWithCompanion(HabitItemsCompanion data) {
    return HabitItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      tag: data.tag.present ? data.tag.value : this.tag,
      color: data.color.present ? data.color.value : this.color,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('tag: $tag, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, tag, color, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.tag == this.tag &&
          other.color == this.color &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class HabitItemsCompanion extends UpdateCompanion<HabitItem> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> tag;
  final Value<int> color;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const HabitItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.tag = const Value.absent(),
    this.color = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required String tag,
    required int color,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : title = Value(title),
       description = Value(description),
       tag = Value(tag),
       color = Value(color);
  static Insertable<HabitItem> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? tag,
    Expression<int>? color,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (tag != null) 'tag': tag,
      if (color != null) 'color': color,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? description,
    Value<String>? tag,
    Value<int>? color,
    Value<DateTime?>? createdAt,
    Value<DateTime?>? updatedAt,
    Value<int>? rowid,
  }) {
    return HabitItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      tag: tag ?? this.tag,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('tag: $tag, ')
          ..write('color: $color, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HabitStreakItemsTable extends HabitStreakItems
    with TableInfo<$HabitStreakItemsTable, HabitStreakItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitStreakItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => Uuid().v7(),
  );
  static const VerificationMeta _markedDoneAtMeta = const VerificationMeta(
    'markedDoneAt',
  );
  @override
  late final GeneratedColumn<DateTime> markedDoneAt = GeneratedColumn<DateTime>(
    'marked_done_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, markedDoneAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_streak_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<HabitStreakItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('marked_done_at')) {
      context.handle(
        _markedDoneAtMeta,
        markedDoneAt.isAcceptableOrUnknown(
          data['marked_done_at']!,
          _markedDoneAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HabitStreakItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitStreakItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      markedDoneAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}marked_done_at'],
      ),
    );
  }

  @override
  $HabitStreakItemsTable createAlias(String alias) {
    return $HabitStreakItemsTable(attachedDatabase, alias);
  }
}

class HabitStreakItem extends DataClass implements Insertable<HabitStreakItem> {
  final String id;
  final DateTime? markedDoneAt;
  const HabitStreakItem({required this.id, this.markedDoneAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || markedDoneAt != null) {
      map['marked_done_at'] = Variable<DateTime>(markedDoneAt);
    }
    return map;
  }

  HabitStreakItemsCompanion toCompanion(bool nullToAbsent) {
    return HabitStreakItemsCompanion(
      id: Value(id),
      markedDoneAt: markedDoneAt == null && nullToAbsent
          ? const Value.absent()
          : Value(markedDoneAt),
    );
  }

  factory HabitStreakItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitStreakItem(
      id: serializer.fromJson<String>(json['id']),
      markedDoneAt: serializer.fromJson<DateTime?>(json['markedDoneAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'markedDoneAt': serializer.toJson<DateTime?>(markedDoneAt),
    };
  }

  HabitStreakItem copyWith({
    String? id,
    Value<DateTime?> markedDoneAt = const Value.absent(),
  }) => HabitStreakItem(
    id: id ?? this.id,
    markedDoneAt: markedDoneAt.present ? markedDoneAt.value : this.markedDoneAt,
  );
  HabitStreakItem copyWithCompanion(HabitStreakItemsCompanion data) {
    return HabitStreakItem(
      id: data.id.present ? data.id.value : this.id,
      markedDoneAt: data.markedDoneAt.present
          ? data.markedDoneAt.value
          : this.markedDoneAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitStreakItem(')
          ..write('id: $id, ')
          ..write('markedDoneAt: $markedDoneAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, markedDoneAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitStreakItem &&
          other.id == this.id &&
          other.markedDoneAt == this.markedDoneAt);
}

class HabitStreakItemsCompanion extends UpdateCompanion<HabitStreakItem> {
  final Value<String> id;
  final Value<DateTime?> markedDoneAt;
  final Value<int> rowid;
  const HabitStreakItemsCompanion({
    this.id = const Value.absent(),
    this.markedDoneAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HabitStreakItemsCompanion.insert({
    this.id = const Value.absent(),
    this.markedDoneAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<HabitStreakItem> custom({
    Expression<String>? id,
    Expression<DateTime>? markedDoneAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (markedDoneAt != null) 'marked_done_at': markedDoneAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HabitStreakItemsCompanion copyWith({
    Value<String>? id,
    Value<DateTime?>? markedDoneAt,
    Value<int>? rowid,
  }) {
    return HabitStreakItemsCompanion(
      id: id ?? this.id,
      markedDoneAt: markedDoneAt ?? this.markedDoneAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (markedDoneAt.present) {
      map['marked_done_at'] = Variable<DateTime>(markedDoneAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitStreakItemsCompanion(')
          ..write('id: $id, ')
          ..write('markedDoneAt: $markedDoneAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabitItemsTable habitItems = $HabitItemsTable(this);
  late final $HabitStreakItemsTable habitStreakItems = $HabitStreakItemsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    habitItems,
    habitStreakItems,
  ];
}

typedef $$HabitItemsTableCreateCompanionBuilder =
    HabitItemsCompanion Function({
      Value<String> id,
      required String title,
      required String description,
      required String tag,
      required int color,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });
typedef $$HabitItemsTableUpdateCompanionBuilder =
    HabitItemsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> description,
      Value<String> tag,
      Value<int> color,
      Value<DateTime?> createdAt,
      Value<DateTime?> updatedAt,
      Value<int> rowid,
    });

class $$HabitItemsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitItemsTable> {
  $$HabitItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HabitItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitItemsTable> {
  $$HabitItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitItemsTable> {
  $$HabitItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$HabitItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitItemsTable,
          HabitItem,
          $$HabitItemsTableFilterComposer,
          $$HabitItemsTableOrderingComposer,
          $$HabitItemsTableAnnotationComposer,
          $$HabitItemsTableCreateCompanionBuilder,
          $$HabitItemsTableUpdateCompanionBuilder,
          (
            HabitItem,
            BaseReferences<_$AppDatabase, $HabitItemsTable, HabitItem>,
          ),
          HabitItem,
          PrefetchHooks Function()
        > {
  $$HabitItemsTableTableManager(_$AppDatabase db, $HabitItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> tag = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitItemsCompanion(
                id: id,
                title: title,
                description: description,
                tag: tag,
                color: color,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String title,
                required String description,
                required String tag,
                required int color,
                Value<DateTime?> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitItemsCompanion.insert(
                id: id,
                title: title,
                description: description,
                tag: tag,
                color: color,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HabitItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitItemsTable,
      HabitItem,
      $$HabitItemsTableFilterComposer,
      $$HabitItemsTableOrderingComposer,
      $$HabitItemsTableAnnotationComposer,
      $$HabitItemsTableCreateCompanionBuilder,
      $$HabitItemsTableUpdateCompanionBuilder,
      (HabitItem, BaseReferences<_$AppDatabase, $HabitItemsTable, HabitItem>),
      HabitItem,
      PrefetchHooks Function()
    >;
typedef $$HabitStreakItemsTableCreateCompanionBuilder =
    HabitStreakItemsCompanion Function({
      Value<String> id,
      Value<DateTime?> markedDoneAt,
      Value<int> rowid,
    });
typedef $$HabitStreakItemsTableUpdateCompanionBuilder =
    HabitStreakItemsCompanion Function({
      Value<String> id,
      Value<DateTime?> markedDoneAt,
      Value<int> rowid,
    });

class $$HabitStreakItemsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitStreakItemsTable> {
  $$HabitStreakItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get markedDoneAt => $composableBuilder(
    column: $table.markedDoneAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HabitStreakItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitStreakItemsTable> {
  $$HabitStreakItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get markedDoneAt => $composableBuilder(
    column: $table.markedDoneAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitStreakItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitStreakItemsTable> {
  $$HabitStreakItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get markedDoneAt => $composableBuilder(
    column: $table.markedDoneAt,
    builder: (column) => column,
  );
}

class $$HabitStreakItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitStreakItemsTable,
          HabitStreakItem,
          $$HabitStreakItemsTableFilterComposer,
          $$HabitStreakItemsTableOrderingComposer,
          $$HabitStreakItemsTableAnnotationComposer,
          $$HabitStreakItemsTableCreateCompanionBuilder,
          $$HabitStreakItemsTableUpdateCompanionBuilder,
          (
            HabitStreakItem,
            BaseReferences<
              _$AppDatabase,
              $HabitStreakItemsTable,
              HabitStreakItem
            >,
          ),
          HabitStreakItem,
          PrefetchHooks Function()
        > {
  $$HabitStreakItemsTableTableManager(
    _$AppDatabase db,
    $HabitStreakItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitStreakItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitStreakItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitStreakItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime?> markedDoneAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitStreakItemsCompanion(
                id: id,
                markedDoneAt: markedDoneAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime?> markedDoneAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HabitStreakItemsCompanion.insert(
                id: id,
                markedDoneAt: markedDoneAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HabitStreakItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitStreakItemsTable,
      HabitStreakItem,
      $$HabitStreakItemsTableFilterComposer,
      $$HabitStreakItemsTableOrderingComposer,
      $$HabitStreakItemsTableAnnotationComposer,
      $$HabitStreakItemsTableCreateCompanionBuilder,
      $$HabitStreakItemsTableUpdateCompanionBuilder,
      (
        HabitStreakItem,
        BaseReferences<_$AppDatabase, $HabitStreakItemsTable, HabitStreakItem>,
      ),
      HabitStreakItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabitItemsTableTableManager get habitItems =>
      $$HabitItemsTableTableManager(_db, _db.habitItems);
  $$HabitStreakItemsTableTableManager get habitStreakItems =>
      $$HabitStreakItemsTableTableManager(_db, _db.habitStreakItems);
}
