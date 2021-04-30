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

class UsersFields extends PlayHouseFields<UsersTable> {
  factory UsersFields() => _this ??= UsersFields._();
  UsersFields._() {
    table = s.UsersTable();
  }
  static UsersFields _this;
}

class OrganizationsFields extends PlayHouseFields<OrganizationsTable> {
  factory OrganizationsFields() => _this ??= OrganizationsFields._();
  OrganizationsFields._() {
    table = s.OrganizationsTable();
  }
  static OrganizationsFields _this;
}

@mustCallSuper
class PlayHouseFields<T extends SQLiteTable> extends DataFields<PlayHouseFields>
    with FormKeyState {
  T table;

  Future<bool> initAsync() async {
    bool init = true;
    try {
      //
      final _query = await query();

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
  Future<List<Map<String, dynamic>>> retrieve() => table.list;

  @override
  Future<bool> add(Map<String, dynamic> rec) async => false;

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    //
    bool save = await super.save(rec);
    //
    //
    // final Map<String, dynamic> record = rec.map((key, value) {
    //   final test = value.value;
    //   final fld = (value as FieldWidgets<OrganizationsTable>).value;
    //   return
    // });
    if (save) {
      save =
          await table.save(rec.map((key, value) => MapEntry(key, value.value)));
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
    final save = _formKey.currentState.validate();
    if (save) {
      _formKey.currentState.save();

      /// todo This might have to be in the child routine to be accurate.
      _inForm = false;
    }
    return save;
  }
}