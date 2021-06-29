// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart' hide User;

/// SQLite database
import 'package:playhouse/src/home/model/sqlite_db.dart' as s;

/// The Fields consolidated Class
//export 'package:playhouse/src/home/model/database_class.dart';

class ModuleFields extends PlayHouseFields<ModulesTable> {
  factory ModuleFields() => _this ??= ModuleFields._();
  ModuleFields._() {
    table = s.ModulesTable();
  }
  static ModuleFields _this;
}

class SubmoduleFields extends PlayHouseFields<SubmodulesTable> {
  factory SubmoduleFields() => _this ??= SubmoduleFields._();
  SubmoduleFields._() {
    table = s.SubmodulesTable();
  }
  static SubmoduleFields _this;
}

class TasksFields extends PlayHouseFields<TasksTable> {
  factory TasksFields() => _this ??= TasksFields._();
  TasksFields._() {
    table = s.TasksTable();
  }
  static TasksFields _this;
}

class UsersTasksFields extends PlayHouseFields<UsersTasksTable> {
  factory UsersTasksFields() => _this ??= UsersTasksFields._();
  UsersTasksFields._() {
    table = s.UsersTasksTable();
  }
  static UsersTasksFields _this;
}

class UsersScrapbookFields extends PlayHouseFields<UsersScrapbookTable> {
  factory UsersScrapbookFields() => _this ??= UsersScrapbookFields._();
  UsersScrapbookFields._() {
    table = s.UsersScrapbookTable();
  }
  static UsersScrapbookFields _this;
}

class UsersFields extends PlayHouseFields<UsersTable> {
  factory UsersFields() => _this ??= UsersFields._();
  UsersFields._() {
    table = s.UsersTable();
  }
  static UsersFields _this;

  @override
  Future<bool> initAsync() async {
    //
    final init = await super.initAsync();

    if (init) {
      // Create a user if there isn't one at the moment.
      if (table.list.isEmpty) {
        await table.save({'name': 'Your Name'});
        await super.initAsync();
      }
    }
    return init;
  }
}

class UserModulesUnlockedFields extends PlayHouseFields<UserModulesUnlocked> {
  factory UserModulesUnlockedFields() =>
      _this ??= UserModulesUnlockedFields._();
  UserModulesUnlockedFields._() {
    table = s.UserModulesUnlocked();
  }
  static UserModulesUnlockedFields _this;
}

class UserSubmodulesUnlockedFields
    extends PlayHouseFields<UserSubmodulesUnlocked> {
  factory UserSubmodulesUnlockedFields() =>
      _this ??= UserSubmodulesUnlockedFields._();
  UserSubmodulesUnlockedFields._() {
    table = s.UserSubmodulesUnlocked();
  }
  static UserSubmodulesUnlockedFields _this;
}

class UserTasksUnlockedFields extends PlayHouseFields<UserTasksUnlocked> {
  factory UserTasksUnlockedFields() => _this ??= UserTasksUnlockedFields._();
  UserTasksUnlockedFields._() {
    table = s.UserTasksUnlocked();
  }
  static UserTasksUnlockedFields _this;
}

class OrganizationsFields extends PlayHouseFields<OrganizationsTable> {
  factory OrganizationsFields() => _this ??= OrganizationsFields._();
  OrganizationsFields._() {
    table = s.OrganizationsTable();
  }
  static OrganizationsFields _this;

  @override
  Future<bool> delete(Map<String, dynamic> rec) => table.delete(rec);
}

class OrganizationsModuleFields extends PlayHouseFields<OrganizationsModules> {
  factory OrganizationsModuleFields() =>
      _this ??= OrganizationsModuleFields._();
  OrganizationsModuleFields._() {
    table = s.OrganizationsModules();
  }
  static OrganizationsModuleFields _this;

  @override
  Future<bool> delete(Map<String, dynamic> rec) => table.delete(rec);
}

class OrganizationsSubmoduleFields
    extends PlayHouseFields<OrganizationsSubmodules> {
  factory OrganizationsSubmoduleFields() =>
      _this ??= OrganizationsSubmoduleFields._();
  OrganizationsSubmoduleFields._() {
    table = s.OrganizationsSubmodules();
  }
  static OrganizationsSubmoduleFields _this;

  @override
  Future<bool> delete(Map<String, dynamic> rec) => table.delete(rec);
}

class OrganizationsTaskFields extends PlayHouseFields<OrganizationsTasks> {
  factory OrganizationsTaskFields() => _this ??= OrganizationsTaskFields._();
  OrganizationsTaskFields._() {
    table = s.OrganizationsTasks();
  }
  static OrganizationsTaskFields _this;

  @override
  Future<bool> delete(Map<String, dynamic> rec) => table.delete(rec);
}

@mustCallSuper
class PlayHouseFields<T extends SQLiteTable> extends DataFields<PlayHouseFields>
    with FormKeyState {
  T table;

  Future<bool> initAsync() async {
    bool init = true;
    try {
      //
      await query();

      // Throw any exceptions that may result from the query.
      if (table.hasError) {
        throw table.exception;
      }

      // Populate the field variables properly.
      populateFieldWidgets();

      // for (final Map<String, dynamic> map in _query) {
      //   //
      //   final _organization = Organization(record: map);
      //
      //   organizationList.add(_organization);
      // }
    } catch (e) {
      init = false;
      rethrow;
    }
    return init;
  }

  /// Get a new record
  Map<String, dynamic> getNewRecord() {
    fillRecords([table.newRecord]);
    // Populate the field variables properly.
    return populateFieldWidgets();
  }

  @override
  Future<List<Map<String, dynamic>>> retrieve() => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => false;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    bool save = await super.save(rec);

    if (save) {
      save = await table.save(rec.map((key, value) => MapEntry(key, value)));
      await query();
    }
    return save;
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => false;

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => false;

  /// The 'field' property is assigned specific properties.
  Map<String, FieldWidgets<PlayHouseFields>> populateFieldWidgets() {
    final fieldsMap = <String, FieldWidgets<PlayHouseFields>>{};
    for (final field in field.values) {
      field.forEach((String field, FieldWidgets<PlayHouseFields> widget) {
        fieldsMap[field] = widget;
        widget.object = this;
        switch (field) {
          case 'deleted':
            widget.label = 'Deleted';
            widget.keyboardType = TextInputType.number;
            break;
          case 'time_stamp':
            widget.label = 'Time Stamp';
            widget.keyboardType = TextInputType.number;
            break;
          case 'key_art':
            widget.label = 'Key Art';
            break;
          case 'email_address':
            widget.label = 'Email Address';
            widget.inputDecoration = const InputDecoration(labelText: 'Email');
            widget.keyboardType = TextInputType.emailAddress;
            break;
          case 'phone_number':
            widget.label = 'Phone Number';
            widget.inputDecoration = const InputDecoration(labelText: 'Phone');
            widget.keyboardType = TextInputType.phone;
            break;
          case 'login_provider':
            widget.label = 'Login Provider';
            widget.keyboardType = TextInputType.name;
            break;
          case 'long_description':
            widget.label = 'Long Description';
            widget.keyboardType = TextInputType.name;
            widget.validator = notEmpty;
            widget.maxLines = 3;
            break;
          case 'short_description':
            widget.label = 'Short Description';
            widget.keyboardType = TextInputType.name;
            widget.validator = notEmpty;
            break;
          case 'name':
            widget.label = 'Name';
            widget.keyboardType = TextInputType.name;
            widget.validator = notEmpty;
            break;
          case 'completed':
            widget.label = 'Completed';
            widget.keyboardType = TextInputType.number;
            break;
          case 'module_type':
            widget.label = 'Module Type';
            widget.keyboardType = TextInputType.name;
            widget.validator = notEmpty;
            break;
          case 'task_id':
            widget.label = 'Id';
            widget.validator = notEmpty;
            widget.keyboardType = TextInputType.number;
            break;
          case 'submodule_id':
            widget.label = 'Id';
            widget.validator = notEmpty;
            widget.keyboardType = TextInputType.number;
            break;
          case 'module_id':
            widget.label = 'Id';
            widget.validator = notEmpty;
            widget.keyboardType = TextInputType.number;
            break;
          case 'user_id':
            widget.label = 'Id';
            widget.validator = notEmpty;
            widget.keyboardType = TextInputType.number;
            break;
          case 'organization_id ':
            widget.label = 'Id';
            widget.validator = notEmpty;
            widget.keyboardType = TextInputType.number;
            break;
          case 'rowid':
            widget.label = 'Id';
            widget.validator = notEmpty;
            widget.keyboardType = TextInputType.number;
            break;
          default:
            // Likely a field to be used, but not to be displayed.
            break;
        }
      });
    }
    return fieldsMap;
  }
}

/// Fields used on a Form screen.
mixin FormKeyState {
  //
  bool _inForm = false;

  GlobalKey<FormState> get formKey {
    if (!_inForm) {
      _inForm = true;
    }
    return _formKey;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  @mustCallSuper
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    final formState = _formKey?.currentState;

    /// Not necessarily failed. There's simply no form!
    if (formState == null) {
      return true;
    }

    bool save;

    if (save) {
      save = formState.validate();
    }

    if (save) {
      //
      formState.save();

      /// todo This might have to be in the child routine to be accurate.
      _inForm = false;
    }
    return save;
  }
}
