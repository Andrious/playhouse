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
    final locked = record['lockedFirst'];
    locked.label = 'First Locked';
    final next = record['next_submodule_id'];
    next.label = 'Next Submodule';
    return [
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
      moduleId.onListItems(dropItems: _parentModule(moduleId)),
      record['name'].textFormField,
      record['short_description'].textFormField,
      record['long_description'].textFormField,
      next.onListItems(dropItems: _moduleItems(next)),
    ];
  }

  /// List the parent modules
  List<String> _parentModule(FieldWidgets<PlayHouseFields> record) {
    return [''];
  }

  /// List the next submodules
  List<String> _moduleItems(FieldWidgets<PlayHouseFields> record) {
    return [''];
  }


  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      SubmoduleFields().field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields<SQLiteTable>>> newRecord() =>
      SubmoduleFields().getNewRecord();
}
