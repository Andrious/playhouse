// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

/// Look to the mixin ScrapbookFields for the actual listing.
class ModulesListAndroid extends ScrapbookListScreen<ModulesList, ModuleFields>
    with ScrapbookFields {
  ModulesListAndroid() : super(L10n.s('Module'));

  @override
  ModuleFields get fields => ModuleFields();

  /// Flags indicating which fields are actually displayed.
  /// Note, flags are implemented in the mixin ScrapbookFields
  @override
  bool useModuleType = false;
  @override
  bool useLocked = false;

  @override
  bool useKeyArt = false;

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
    final type = record['module_type'];
    type!.label = 'Type';
    final locked = record['first_locked'];
    locked!.label = 'First Locked';
    final next = record['next_module_id'];
    next!.label = 'Next Module';
    return [
      type.onListTile(tap: onTap),
      locked.onListTile(tap: onTap),
      next.onListTile(tap: onTap),
    ];
  }

  /// Supply the fields required to 'edit' the current record.
  @override
  List<Widget> editWidgets(
    Map<String, FieldWidgets<PlayHouseFields>> record,
  ) {
    return [
      record['rowid']!.onListTile(enabled: false),
      record['module_type']!.onListItems(dropItems: ['Design', 'Build']),
      record['name']!.textFormField,
      record['short_description']!.textFormField,
      record['long_description']!.textFormField,
      record['next_module_id']!.onListItems(dropItems: _moduleItems(record))
    ];
  }

  List<String> _moduleItems(Map<String, FieldWidgets<PlayHouseFields>> record) {
    final rowid = record['rowid']!.value.toString();
    return fields.table.idList.where((id) => id != rowid).toList();
  }

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      fields.field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields<SQLiteTable>>> newRecord() =>
      fields.getNewRecord();
}
