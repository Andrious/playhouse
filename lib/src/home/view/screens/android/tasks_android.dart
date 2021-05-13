// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

/// Look to the mixin ScrapbookFields for the actual listing.
class TasksListAndroid extends ScrapbookListScreen<TasksList, TasksFields>
    with ScrapbookFields {
  TasksListAndroid() : super(I10n.s('Task'));

  @override
  TasksFields get fields => TasksFields();

  /// Flags indicating which fields are actually displayed.
  /// Note, flags are implemented in the mixin ScrapbookFields
  @override
  bool rowid = true;
  @override
  bool useModuleType = false;
  @override
  bool useLocked = false;
  @override
  bool useName = true;
  @override
  bool useDescription = true;
  @override
  bool useKeyArt = false;
  @override
  bool useTimeStamp = false;
  @override
  bool useEmail = false;
  @override
  bool usePhone = false;
  @override
  bool useCompleted = false;
  @override
  bool useDeleted = false;
  @override
  bool useLockedFirst = true;
  @override
  bool useNextId = true;

  /// Supply the widgets to 'list' the record.
  @override
  List<Widget> addedWidgets(
    Map<String, FieldWidgets<PlayHouseFields>> record,
    VoidCallback onTap,
  ) {
    final module = record['submodule_id'];
    module.label = 'Submodule Id';
    final locked = record['lockedFirst'];
    locked.label = 'First Locked';
    final next = record['next_task_id'];
    next.label = 'Next Task';
    return [
      module.onListTile(tap: onTap),
      locked.onListTile(tap: onTap),
      next.onListTile(tap: onTap),
    ];
  }

  /// Supply the fields required to 'edit' the current record.
  @override
  List<Widget> editWidgets(
    Map<String, FieldWidgets<PlayHouseFields>> record,
  ) {
    final moduleId = record['submodule_id'];
    moduleId.label = 'Submodule Id';
    final next = record['next_task_id'];
    return [
      record['rowid'].onListTile(enabled: false),
      moduleId.onListItems(
          onChanged: (String v) {
            con.setState(() {
              moduleId.value = int.parse(v);
            });
          },
          dropItems: _parentModule(moduleId)),
      record['name'].textFormField,
      record['short_description'].textFormField,
      record['long_description'].textFormField,
      next.onListItems(
          onChanged: (String v) {
            con.setState(() {
              moduleId.value = int.parse(v);
            });
          },
          dropItems: _moduleItems(record)),
    ];
  }

  /// List the parent modules
  List<String> _parentModule(FieldWidgets<PlayHouseFields> record) =>
      SubmoduleFields().table.idList;

  /// List the next task
  List<String> _moduleItems(Map<String, FieldWidgets<PlayHouseFields>> record) {
    final rowid = record['rowid'].value.toString();
    return fields.table.idList.where((id) => id != rowid).toList();
  }

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      fields.field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields<SQLiteTable>>> newRecord() =>
      fields.getNewRecord();
}
