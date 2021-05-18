// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

/// Look to the mixin ScrapbookFields for the actual listing.
class SubmodulesListAndroid
    extends ScrapbookListScreen<SubmodulesList, SubmoduleFields>
    with ScrapbookFields {
  SubmodulesListAndroid() : super(I10n.s('Submodule'));

  @override
  SubmoduleFields get fields => SubmoduleFields();

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
    final module = record['module_id'];
    module.label = 'Module Id';
    final locked = record['lockedFirst'];
    locked.label = 'First Locked';
    final next = record['next_submodule_id'];
    next.label = 'Next Submodule';
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
    final moduleId = record['module_id'];
    moduleId.label = 'Module Id';
    final next = record['next_submodule_id'];
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
              next.value = int.parse(v);
            });
          },
          dropItems: _moduleItems(record)),
    ];
  }

  /// List the parent modules
  List<String> _parentModule(FieldWidgets<PlayHouseFields> record) =>
      ModuleFields().table.idList;

  /// List the next submodules
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
