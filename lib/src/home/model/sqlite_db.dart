// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

class PlayhouseSQLiteDB extends SQLiteDB {
  factory PlayhouseSQLiteDB() => _this ??= PlayhouseSQLiteDB._();
  PlayhouseSQLiteDB._();
  static PlayhouseSQLiteDB _this;

  static const MODULES = 'modules';
  static const SUBMODULES = 'submodules';
  static const TASKS = 'tasks';
  static const USERS_TASKS = 'users_tasks';
  static const USERS = 'users';

  static const USERS_MODULES_UNLOCKED = 'user_modules_unlocked';
  static const USERS_SUBMODULES_UNLOCKED = 'user_submodules_unlocked';
  static const USERS_TASKS_UNLOCKED = 'user_tasks_unlocked';

  static const ORGANIZATIONS = 'organizations';
  static const ORGANIZATIONS_MODULES = 'organizations_modules';
  static const ORGANIZATIONS_SUBMODULES = 'organizations_submodules';
  static const ORGANIZATIONS_TASKS = 'organizations_tasks';

  static const ORGANIZATIONS_USERS = 'organizations_users';

  bool _callInitAsync = false;

  /// Initialize the database
  Future<bool> initAsync({bool throwError = false}) async {
    // Don't call again.
    if (_callInitAsync) {
      return _callInitAsync;
    }

    _callInitAsync = true;

    final bool init = await super.init(throwError: throwError);

    if (init) {
      //   await db.execute('''
      //    CREATE VIEW IF NOT EXISTS $ORGANIZATIONS_USERS AS SELECT
      //    A.rowid AS organization_id,
      //    A.name,
      //    A.short_description,
      //    B.rowid AS user_id,
      //    B.name,
      //    B.email_address,
      //    B.phone_number,
      //    B.short_description AS description,
      //    FROM $ORGANIZATIONS A, $USERS B,
      //    WHERE A.deleted = 0
      //    AND B.deleted = 0
      //    AND A.rowid = B.organization_id
      // ''');
    }
    return init;
  }

  @override
  Future<void> onConfigure(Database db) {
    return db.execute('PRAGMA foreign_keys=ON;');

    // final version = await db.getVersion();
    //
    // if (version == 0) {}
    // return version;
  }

  @override
  Future<void> onCreate(Database db, int version) async {
    // NOTE:
    // Each table has a rowid field supplied by SQLite as the PRIMARY field
    // Other Tables will reference this field as a FOREIGN key field by another name.

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $MODULES(
       name VARCHAR,
       short_description VARCHAR,
       long_description VARCHAR,
       module_type VARCHAR,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $SUBMODULES(
       module_id INTEGER NOT NULL,
       name VARCHAR,
       short_description VARCHAR,
       long_description VARCHAR,
       key_art BLOB,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $TASKS(
       submodule_id INTEGER NOT NULL,
       name VARCHAR,
       short_description VARCHAR,
       long_description VARCHAR,
       key_art BLOB,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS(
       name VARCHAR,
       short_description VARCHAR,
       long_description VARCHAR,
       email_address VARCHAR,
       phone_number VARCHAR,
       key_art BLOB,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS_TASKS(
       user_id INTEGER NOT NULL,
       task_id INTEGER NOT NULL,
       name VARCHAR,
       short_description VARCHAR,
       long_description VARCHAR,
       key_art BLOB,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS_MODULES_UNLOCKED(
       user_id INTEGER NOT NULL,
       module_id INTEGER NOT NULL,
       completed INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS_SUBMODULES_UNLOCKED(
       user_id INTEGER NOT NULL,
       submodule_id INTEGER NOT NULL,
       completed INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS_TASKS_UNLOCKED(
       user_id INTEGER NOT NULL,
       task_id INTEGER NOT NULL,
       completed INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $ORGANIZATIONS(
       name VARCHAR,
       short_description VARCHAR,
       long_description VARCHAR,
       key_art BLOB,
       time_stamp INTEGER,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       INSERT INTO $ORGANIZATIONS (
       name,
       short_description,
       long_description) VALUES ('General Public',
       'Default Organization',
       'Default Organization if not associated to a particular company or organization.')
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $ORGANIZATIONS_MODULES(
       organization_id INTEGER NOT NULL,
       module_id INTEGER NOT NULL,
       locked INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $ORGANIZATIONS_SUBMODULES(
       organization_id INTEGER NOT NULL,
       submodules_id INTEGER NOT NULL,
       locked INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $ORGANIZATIONS_TASKS(
       organization_id INTEGER NOT NULL,
       task_id INTEGER NOT NULL,
       locked INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');
  }



  /// Name of the whole Database
  @override
  String get name => 'playhouse_scrapbook';

  @override
  int get version => 1;
}

class ModulesTable extends SQLiteTable {
  factory ModulesTable() => _this ??= ModulesTable._();
  ModulesTable._() : super(tableName: PlayhouseSQLiteDB.MODULES);
  static ModulesTable _this;
}

class SubmodulesTable extends SQLiteTable {
  factory SubmodulesTable() => _this ??= SubmodulesTable._();
  SubmodulesTable._() : super(tableName: PlayhouseSQLiteDB.SUBMODULES);
  static SubmodulesTable _this;
}

class TasksTable extends SQLiteTable {
  factory TasksTable() => _this ??= TasksTable._();
  TasksTable._() : super(tableName: PlayhouseSQLiteDB.TASKS);
  static TasksTable _this;
}

class UsersTasksTable extends SQLiteTable {
  factory UsersTasksTable() => _this ??= UsersTasksTable._();
  UsersTasksTable._() : super(tableName: PlayhouseSQLiteDB.USERS_TASKS);
  static UsersTasksTable _this;
}

class UsersTable extends SQLiteTable {
  factory UsersTable() => _this ??= UsersTable._();
  UsersTable._() : super(tableName: PlayhouseSQLiteDB.USERS);
  static UsersTable _this;
}

class UserModulesUnlocked extends SQLiteTable {
  factory UserModulesUnlocked() => _this ??= UserModulesUnlocked._();
  UserModulesUnlocked._()
      : super(tableName: PlayhouseSQLiteDB.USERS_MODULES_UNLOCKED);
  static UserModulesUnlocked _this;
}

class UserSubmodulesUnlocked extends SQLiteTable {
  factory UserSubmodulesUnlocked() => _this ??= UserSubmodulesUnlocked._();
  UserSubmodulesUnlocked._()
      : super(tableName: PlayhouseSQLiteDB.USERS_SUBMODULES_UNLOCKED);
  static UserSubmodulesUnlocked _this;
}

class UserTasksUnlocked extends SQLiteTable {
  factory UserTasksUnlocked() => _this ??= UserTasksUnlocked._();
  UserTasksUnlocked._()
      : super(tableName: PlayhouseSQLiteDB.USERS_TASKS_UNLOCKED);
  static UserTasksUnlocked _this;
}

class OrganizationsModules extends SQLiteTable {
  factory OrganizationsModules() => _this ??= OrganizationsModules._();
  OrganizationsModules._()
      : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS_MODULES);
  static OrganizationsModules _this;
}

class OrganizationsSubmodules extends SQLiteTable {
  factory OrganizationsSubmodules() => _this ??= OrganizationsSubmodules._();
  OrganizationsSubmodules._()
      : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES);
  static OrganizationsSubmodules _this;
}

class OrganizationsTasks extends SQLiteTable {
  factory OrganizationsTasks() => _this ??= OrganizationsTasks._();
  OrganizationsTasks._()
      : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS_TASKS);
  static OrganizationsTasks _this;
}

class OrganizationsUsers extends SQLiteTable {
  factory OrganizationsUsers() => _this ??= OrganizationsUsers._();
  OrganizationsUsers._()
      : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS_USERS);
  static OrganizationsUsers _this;
}

class OrganizationsTable extends SQLiteTable {
  factory OrganizationsTable() => _this ??= OrganizationsTable._();
  OrganizationsTable._() : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS);
  static OrganizationsTable _this;
}

class SQLiteTable extends DataFields<Map<String, dynamic>> {
  SQLiteTable({@required this.tableName}) : db = PlayhouseSQLiteDB();

  final PlayhouseSQLiteDB db;
//  final List<Map<String, dynamic>> data = [];

  TextEditingController controller;

  Future<bool> initAsync() async {
    //
    _keyFld = await db.keyField(tableName);

    final init = _keyFld != null && _keyFld.isNotEmpty;

    if (!init) {
      _keyFld = 'rowid';
    }

    _selectAll = 'SELECT $_keyFld, * FROM $tableName';

    _selectNotDeleted = 'SELECT $_keyFld, * FROM $tableName WHERE deleted = 0';

    _selectDeleted = 'SELECT $_keyFld, * FROM $tableName WHERE deleted = 1';

    _selectAll = 'SELECT $_keyFld, * FROM $tableName';

    return init;
  }

  Future<List<Map<String, dynamic>>> get list =>
      db.getTable(tableName, where: 'deleted = ?', whereArgs: [0]);

  Future<List<Map<String, dynamic>>> get listAll => db.getTable(tableName);

  String tableName = '';
  String _keyFld = '';

  String get selectAll => _selectAll;
  String _selectAll = '';

  String get selectNotDeleted => _selectNotDeleted;
  String _selectNotDeleted = '';

  String get selectDeleted => _selectDeleted;
  String _selectDeleted = '';
}
