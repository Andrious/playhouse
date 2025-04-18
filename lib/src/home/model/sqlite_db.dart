// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

///
class PlayhouseSQLiteDB extends SQLiteDB {
  ///
  factory PlayhouseSQLiteDB() => _this ??= PlayhouseSQLiteDB._();
  PlayhouseSQLiteDB._();
  static PlayhouseSQLiteDB? _this;

  /// Name of the whole Database
  @override
  String get name => 'playhouse_scrapbook';

  /*
  Database version history
   1: Initial
   2:
   3:
   4: New ModuleType: Discover
  */
  @override
  int get version => 4;

  ///
  static const MODULES = 'modules';

  ///
  static const SUBMODULES = 'submodules';

  ///
  static const TASKS = 'tasks';

  ///
  static const USERS_TASKS = 'users_tasks';

  ///
  static const USERS_SCRAPBOOK = 'users_scrapbook';

  ///
  static const USERS = 'users';

  ///
  static const USERS_MODULES_UNLOCKED = 'user_modules_unlocked';

  ///
  static const USERS_SUBMODULES_UNLOCKED = 'user_submodules_unlocked';

  ///
  static const USERS_TASKS_UNLOCKED = 'user_tasks_unlocked';

  ///
  static const ORGANIZATIONS = 'organizations';

  ///
  static const ORGANIZATIONS_MODULES = 'organizations_modules';

  ///
  static const ORGANIZATIONS_SUBMODULES = 'organizations_submodules';

  ///
  static const ORGANIZATIONS_TASKS = 'organizations_tasks';

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
  Future<void> onCreate(Database db, int version) => _onCreate(db);

  @override
  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) {
    _onDelete(db);
    return _onCreate(db);
  }

  @override
  Future<void> onDowngrade(Database db, int oldVersion, int newVersion) {
    return Future.value();
  }

  Future<void> _onDelete(Database db) async {
    //
    await db.execute('''
    DROP TABLE IF EXISTS `$MODULES`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$SUBMODULES`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$TASKS`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$USERS`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$USERS_TASKS`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$USERS_SCRAPBOOK`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$USERS_MODULES_UNLOCKED`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$USERS_SUBMODULES_UNLOCKED`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$USERS_TASKS_UNLOCKED`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$ORGANIZATIONS`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$ORGANIZATIONS_MODULES`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$ORGANIZATIONS_SUBMODULES`
    ''');

    await db.execute('''
    DROP TABLE IF EXISTS `$ORGANIZATIONS_TASKS`
    ''');
  }

  Future<void> _onCreate(Database db) async {
    // NOTE:
    // Each table has a rowid field supplied by SQLite as the PRIMARY field
    // Other Tables will reference this field as a FOREIGN key field by another name.

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $MODULES(
       name VARCHAR NOT NULL,
       short_description VARCHAR NOT NULL,
       long_description VARCHAR NOT NULL,
       key_art_file VARCHAR DEFAULT '',
       module_type VARCHAR NOT NULL,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $SUBMODULES(
       module_id INTEGER,
       name VARCHAR NOT NULL,
       short_description VARCHAR NOT NULL,
       long_description VARCHAR NOT NULL,
       key_art_file VARCHAR DEFAULT '',
       submodule_type VARCHAR NOT NULL DEFAULT '',
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $TASKS(
       submodule_id INTEGER DEFAULT 0,
       name VARCHAR NOT NULL,
       short_description VARCHAR NOT NULL,
       long_description VARCHAR NOT NULL,
       task_type VARCHAR NOT NULL DEFAULT '',
       key_art_file VARCHAR DEFAULT '',
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS(
       name VARCHAR NOT NULL,
       short_description VARCHAR NOT NULL,
       long_description VARCHAR NOT NULL,
       email_address VARCHAR NOT NULL,
       phone_number VARCHAR NOT NULL,
       organization_id INTEGER DEFAULT 0,
       key_art_file VARCHAR DEFAULT '',
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS_TASKS(
       user_id INTEGER NOT NULL,
       task_id INTEGER NOT NULL,
       name VARCHAR NOT NULL,
       short_description VARCHAR NOT NULL,
       long_description VARCHAR NOT NULL,
       key_art_file VARCHAR DEFAULT '',
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $USERS_SCRAPBOOK(
       user_id INTEGER NOT NULL,
       task_id INTEGER NOT NULL DEFAULT 0,
       name VARCHAR NOT NULL,
       short_description VARCHAR NOT NULL,
       long_description VARCHAR NOT NULL,
       key_art_file VARCHAR DEFAULT '',
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
       name VARCHAR NOT NULL,
       short_description VARCHAR NOT NULL,
       long_description VARCHAR NOT NULL,
       key_art_file VARCHAR DEFAULT '',
       time_stamp INTEGER,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $ORGANIZATIONS_MODULES(
       organization_id INTEGER NOT NULL,
       module_id INTEGER NOT NULL,
       first_locked INTEGER DEFAULT 0,
       next_module_id INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $ORGANIZATIONS_SUBMODULES(
       organization_id INTEGER NOT NULL,
       submodule_id INTEGER NOT NULL,
       first_locked INTEGER DEFAULT 0,
       next_submodule_id INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $ORGANIZATIONS_TASKS(
       organization_id INTEGER NOT NULL,
       task_id INTEGER NOT NULL,
       first_locked INTEGER DEFAULT 0,
       next_task_id INTEGER DEFAULT 0,
       deleted INTEGER DEFAULT 0)
    ''');

    await loadScrapBookDatabase(db);
  }
}

/// The Modules of this app.
/// A particular Module will have one or more Submodules.
class ModulesTable extends SQLiteTable {
  ///
  factory ModulesTable() => _this ??= ModulesTable._();
  ModulesTable._() : super(tableName: PlayhouseSQLiteDB.MODULES);
  static ModulesTable? _this;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async {
    const sqlStmt = '''
    SELECT A.rowid 
    , A.*
    , B.first_locked
    , B.next_module_id
    FROM ${PlayhouseSQLiteDB.MODULES} A 
    LEFT JOIN ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} B 
    ON A.rowid = B.module_id
    ''';
    return primaryList(await db.rawQuery(sqlStmt));
  }

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    final Map<String, dynamic> newRec =
        await db.saveMap(PlayhouseSQLiteDB.MODULES, rec);
    return newRec.isNotEmpty;
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async {
    bool delete;
    final Database _db = db.db!;
    try {
      //
      delete = await _db.transaction<bool>((Transaction txn) async {
        //

        final moduleId = rec['rowid'].value;

        await _db.rawQuery(
          'DELETE FROM ${PlayhouseSQLiteDB.MODULES} WHERE rowid = ?',
          [moduleId],
        );

        /// Release any and all Submodules from this now deleted Module.
        final count = await _db.rawUpdate(
            'UPDATE ${PlayhouseSQLiteDB.SUBMODULES} SET module_id = ?', [null]);

        return count > 0;
      }, exclusive: true);
    } catch (e) {
      delete = false;
    } finally {
      // clean up dummy transaction
//      db.openTransaction = null;
    }
    return delete;
  }
}

/// The Submodules of this app.
/// A particular Submodule will have one or more Tasks.
class SubmodulesTable extends SQLiteTable {
  ///
  factory SubmodulesTable() => _this ??= SubmodulesTable._();
  SubmodulesTable._() : super(tableName: PlayhouseSQLiteDB.SUBMODULES);
  static SubmodulesTable? _this;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async {
    const sqlStmt = '''
    SELECT A.rowid 
    , A.*
    , B.first_locked
    , B.next_submodule_id
    FROM ${PlayhouseSQLiteDB.SUBMODULES} A 
    LEFT JOIN ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} B 
    ON A.rowid = B.submodule_id
    ''';
    return primaryList(await db.rawQuery(sqlStmt));
  }

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    final Map<String, dynamic> newRec =
        await db.saveMap(PlayhouseSQLiteDB.SUBMODULES, rec);
    return newRec.isNotEmpty;
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async {
    bool delete;
    final Database _db = db.db!;
    try {
      //
      delete = await _db.transaction<bool>((Transaction txn) async {
        //

        final submoduleId = rec['rowid'].value;

        await _db.rawQuery(
          'DELETE FROM ${PlayhouseSQLiteDB.SUBMODULES} WHERE rowid = ?',
          [submoduleId],
        );

        /// Release any and all Tasks from this now deleted Submodule.
        final count = await _db.rawUpdate(
            'UPDATE ${PlayhouseSQLiteDB.TASKS} SET submodule_id = ?', [null]);

        return count > 0;
      }, exclusive: true);
    } catch (e) {
      delete = false;
    } finally {
      // clean up dummy transaction
//      db.openTransaction = null;
    }
    return delete;
  }
}

/// The Tasks contained in this app.
/// Each task is assigned to a particular Submodule.
class TasksTable extends SQLiteTable {
  ///
  factory TasksTable() => _this ??= TasksTable._();
  TasksTable._() : super(tableName: PlayhouseSQLiteDB.TASKS);
  static TasksTable? _this;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async {
    const sqlStmt = '''
    SELECT A.rowid 
    , A.*
    , B.first_locked
    , B.next_task_id
    FROM ${PlayhouseSQLiteDB.TASKS} A 
    LEFT JOIN ${PlayhouseSQLiteDB.ORGANIZATIONS_TASKS} B 
    ON A.rowid = B.task_id
    ''';
    return primaryList(await db.rawQuery(sqlStmt));
  }

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    final Map<String, dynamic> newRec =
        await db.saveMap(PlayhouseSQLiteDB.TASKS, rec);
    return newRec.isNotEmpty;
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async {
    bool delete;
    final Database _db = db.db!;
    try {
      //
      delete = await _db.transaction<bool>((Transaction txn) async {
        //
        int count = 0;

        final rowId = rec['rowid'].value;

        /// If not a valid record id.
        if (rowId == null || rowId <= 0) {
          return false;
        }

        /// Has this task been performed already by users?
        final list = await _db.rawQuery(
          'SELECT rowid FROM ${PlayhouseSQLiteDB.USERS_TASKS} WHERE task_id = ?',
          [rowId],
        );

        /// Continue to delete the task only if it has not been used yet.
        if (list.isNotEmpty) {
          //
          /// Notify the user this record cannot be deleted yet.
        } else {
          //
          count = await _db.rawDelete(
              'DELETE FROM ${PlayhouseSQLiteDB.TASKS} WHERE rowid = ?',
              [rowId]);
        }
        return count > 0;
      }, exclusive: true);
    } catch (e) {
      delete = false;
    } finally {
      // clean up dummy transaction
//      db.openTransaction = null;
    }
    return delete;
  }
}

/// The Task worked on by a particular User.
/// A particular task can be worked on by more than one user.
class UsersTasksTable extends SQLiteTable {
  ///
  factory UsersTasksTable() => _this ??= UsersTasksTable._();
  UsersTasksTable._() : super(tableName: PlayhouseSQLiteDB.USERS_TASKS);
  static UsersTasksTable? _this;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async {
    const sqlStmt = '''
    SELECT A.rowid 
    , A.*
    FROM ${PlayhouseSQLiteDB.USERS_TASKS} A 
    INNER JOIN ${PlayhouseSQLiteDB.USERS} B 
    ON A.user_id = B.rowid
    ''';
    return primaryList(await db.rawQuery(sqlStmt));
  }

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.USERS_TASKS, rec);
    return savedRec.isNotEmpty;
  }
}

/// The Scrapbook used by a particular User.
/// Each could be associated with a Task or not.
class UsersScrapbookTable extends SQLiteTable {
  ///
  factory UsersScrapbookTable() => _this ??= UsersScrapbookTable._();
  UsersScrapbookTable._() : super(tableName: PlayhouseSQLiteDB.USERS_SCRAPBOOK);
  static UsersScrapbookTable? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.USERS_SCRAPBOOK, rec);
    return savedRec.isNotEmpty;
  }
}

/// A user of this app.
/// More than one user can be on this app.
class UsersTable extends SQLiteTable {
  ///
  factory UsersTable() => _this ??= UsersTable._();
  UsersTable._() : super(tableName: PlayhouseSQLiteDB.USERS);
  static UsersTable? _this;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async {
    const sqlStmt = '''
    SELECT A.rowid 
    , A.*
    , B.name as organization_name
    , B.short_description as organization_short
    , B.long_description as organization_long
    FROM ${PlayhouseSQLiteDB.USERS} A 
    LEFT JOIN ${PlayhouseSQLiteDB.ORGANIZATIONS} B
    ON A.organization_id = B.rowid
    ''';
    return primaryList(await db.rawQuery(sqlStmt));
  }

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.USERS, rec);
    return savedRec.isNotEmpty;
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async {
    bool delete;
    final Database _db = db.db!;
    try {
      //
      delete = await _db.transaction<bool>((Transaction txn) async {
        //
        await _db.rawQuery(
          'DELETE FROM ${PlayhouseSQLiteDB.USERS} WHERE user_id = ?',
          [rec['user_id'].value],
        );

        final count = await _db.rawDelete(
          'DELETE FROM ${PlayhouseSQLiteDB.USERS_TASKS} WHERE user_id = ?',
          [rec['user_id'].value],
        );

        await _db.rawDelete(
          'DELETE FROM ${PlayhouseSQLiteDB.USERS_TASKS_UNLOCKED} WHERE user_id = ?',
          [rec['user_id'].value],
        );

        await _db.rawDelete(
          'DELETE FROM ${PlayhouseSQLiteDB.USERS_SUBMODULES_UNLOCKED} WHERE user_id = ?',
          [rec['user_id'].value],
        );

        await _db.rawDelete(
          'DELETE FROM ${PlayhouseSQLiteDB.USERS_MODULES_UNLOCKED} WHERE user_id = ?',
          [rec['user_id'].value],
        );

        return count > 0;
      }, exclusive: true);
    } catch (e) {
      delete = false;
    } finally {
      // clean up dummy transaction
//      db.openTransaction = null;
    }
    return delete;
  }
}

/// Modules unlocked for and or completed by a particular user.
/// A particular module can be unlocked and or completed by more than one user.
class UserModulesUnlocked extends SQLiteTable {
  ///
  factory UserModulesUnlocked() => _this ??= UserModulesUnlocked._();
  UserModulesUnlocked._()
      : super(tableName: PlayhouseSQLiteDB.USERS_MODULES_UNLOCKED);
  static UserModulesUnlocked? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.USERS_MODULES_UNLOCKED, rec);
    return savedRec.isNotEmpty;
  }
}

/// Submodules unlocked for and or completed by a particular user.
/// A particular submodule can be unlocked and or completed by more than one user.
class UserSubmodulesUnlocked extends SQLiteTable {
  ///
  factory UserSubmodulesUnlocked() => _this ??= UserSubmodulesUnlocked._();
  UserSubmodulesUnlocked._()
      : super(tableName: PlayhouseSQLiteDB.USERS_SUBMODULES_UNLOCKED);
  static UserSubmodulesUnlocked? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec =
        await db.saveMap(PlayhouseSQLiteDB.USERS_SUBMODULES_UNLOCKED, rec);
    return savedRec.isNotEmpty;
  }
}

/// Tasks unlocked for and or completed by a particular user.
/// A particular task can be unlocked and or completed by more than one user.
class UserTasksUnlocked extends SQLiteTable {
  ///
  factory UserTasksUnlocked() => _this ??= UserTasksUnlocked._();
  UserTasksUnlocked._()
      : super(tableName: PlayhouseSQLiteDB.USERS_TASKS_UNLOCKED);
  static UserTasksUnlocked? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.USERS_TASKS_UNLOCKED, rec);
    return savedRec.isNotEmpty;
  }
}

/// The Organization associated to a particular user.
///
class OrganizationsTable extends SQLiteTable {
  ///
  factory OrganizationsTable() => _this ??= OrganizationsTable._();
  OrganizationsTable._() : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS);
  static OrganizationsTable? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.ORGANIZATIONS, rec);
    return savedRec.isNotEmpty;
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async {
    bool delete = false;
    final Database _db = db.db!;
    try {
      //
      delete = await _db.transaction<bool>((Transaction txn) async {
        //
        /// Count the number of records deleted if any.
        var count = 0;

        final rowId = rec['rowid'].value;

        /// Test for a valid record id.
        if (rowId == null || rowId <= 0) {
          return false;
        }

        /// Are there still some users under the Organization.
        final list = await _db.rawQuery(
          'SELECT rowid FROM ${PlayhouseSQLiteDB.USERS} WHERE organization_id = ?',
          [rowId],
        );

        /// Continue to delete the organization only if there are no users.
        if (list.isNotEmpty) {
          //
          /// Notify the user this record cannot be deleted yet.
        } else {
          //
          count = await _db.rawDelete(
            'DELETE FROM ${PlayhouseSQLiteDB.ORGANIZATIONS} WHERE rowid = ?',
            [rowId],
          );

          await _db.rawDelete(
            'DELETE FROM ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} WHERE organization_id = ?',
            [rowId],
          );

          await _db.rawDelete(
            'DELETE FROM ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} WHERE organization_id = ?',
            [rowId],
          );

          await _db.rawDelete(
            'DELETE FROM ${PlayhouseSQLiteDB.ORGANIZATIONS_TASKS} WHERE organization_id = ?',
            [rowId],
          );
        }
        return count > 0;
      }, exclusive: true);
    } catch (e) {
      delete = false;
    } finally {
      // clean up dummy transaction
//      db.openTransaction = null;
    }
    return delete;
  }
}

/// The Modules associated with a particular Organization
/// A particular Module can be assigned to more than one Organization.
class OrganizationsModules extends SQLiteTable {
  ///
  factory OrganizationsModules() => _this ??= OrganizationsModules._();
  OrganizationsModules._()
      : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS_MODULES);
  static OrganizationsModules? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.ORGANIZATIONS_MODULES, rec);
    return savedRec.isNotEmpty;
  }
}

/// The Submodule associated with a particular Organization
/// A particular Submodule can be assigned to more than one Organization.
class OrganizationsSubmodules extends SQLiteTable {
  ///
  factory OrganizationsSubmodules() => _this ??= OrganizationsSubmodules._();
  OrganizationsSubmodules._()
      : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES);
  static OrganizationsSubmodules? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec =
        await db.saveMap(PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES, rec);
    return savedRec.isNotEmpty;
  }
}

/// The Tasks associated with a particular Organization
/// A particular Task can be assigned to more than one Organization.
class OrganizationsTasks extends SQLiteTable {
  ///
  factory OrganizationsTasks() => _this ??= OrganizationsTasks._();
  OrganizationsTasks._()
      : super(tableName: PlayhouseSQLiteDB.ORGANIZATIONS_TASKS);
  static OrganizationsTasks? _this;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    savedRec = await db.saveMap(PlayhouseSQLiteDB.ORGANIZATIONS_TASKS, rec);
    return savedRec.isNotEmpty;
  }
}

///
class SQLiteTable {
  /// extends DataFields<Map<String, dynamic>> {
  SQLiteTable({required this.tableName}) : db = PlayhouseSQLiteDB();

  ///
  final PlayhouseSQLiteDB db;
//  final List<Map<String, dynamic>> data = [];
  ///
  TextEditingController? controller;

  ///
  Future<bool> initAsync() async {
    //
    _keyFld = await db.keyField(tableName);

    final init = _keyFld != null && _keyFld!.isNotEmpty;

    if (!init) {
      _keyFld = 'rowid';
    }

    _selectAll = 'SELECT $_keyFld, * FROM $tableName';

    _selectNotDeleted = 'SELECT $_keyFld, * FROM $tableName WHERE deleted = 0';

    _selectDeleted = 'SELECT $_keyFld, * FROM $tableName WHERE deleted = 1';

    _selectAll = 'SELECT $_keyFld, * FROM $tableName';

    return init;
  }

  /// Return a new 'empty' record.
  Map<String, dynamic> get newRecord => db.newRec(tableName);

  /// Simply a list of the records
  List<Map<String, dynamic>> get list => _list;
  List<Map<String, dynamic>> _list = [];

  ///
  Future<List<Map<String, dynamic>>> get listAll => db.getTable(tableName);

  /// The list of primary keys from the table.
  List<String> get idList => _idList;
  List<String> _idList = [];

  /// Produce a list of primary id's
  List<Map<String, dynamic>> primaryList(List<Map<String, dynamic>> records) {
    if (records.isNotEmpty) {
      _idList = [];
      for (final rec in records) {
        _idList.add(rec['rowid'].toString());
      }
      _list = records;
    }
    return records;
  }

  ///
  String tableName = '';
  String? _keyFld = '';

  ///
  String get selectAll => _selectAll;
  String _selectAll = '';

  ///
  String get selectNotDeleted => _selectNotDeleted;
  String _selectNotDeleted = '';

  ///
  String get selectDeleted => _selectDeleted;
  String _selectDeleted = '';

  ///
  Future<List<Map<String, dynamic>>> retrieve() async {
    List<Map<String, dynamic>> list =
        await db.getTable(tableName, where: 'deleted = ?', whereArgs: [0]);
    if (list.isEmpty) {
      list = [newRecord];
    } else {
      // Define a list of primary id's
      primaryList(list);
    }
    return _list = list;
  }

  /// Returns a 'saved' record if any. Implement it in add() and save().
  late Map<String, dynamic> savedRec;

  ///
  Future<bool> add(Map<String, dynamic> rec) async => false;

  ///
  Future<bool> save(Map<String, dynamic> rec) async => false;

  ///
  Future<bool> delete(Map<String, dynamic> rec) async => false;

  ///
  Future<bool> undo(Map<String, dynamic> rec) async => false;

  /// Gets the exception if any.
  Exception? get exception => db.error;

  /// Get the error message
  String get message => db.message;

  /// There was just now an error
  bool get inError => db.inError;

  /// Has an error.
  bool get hasError => db.inError;

  /// There was no error
  bool get noError => db.noError;
}
