// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

/// Look to the mixin ScrapbookFields for the actual listing.
class OrganizationsAndroid
    extends ScrapbookListScreen<OrganizationsList, OrganizationsFields>
    with ScrapbookFields {
  OrganizationsAndroid() : super(I10n.s('Organizations'));

  @override
  OrganizationsFields get fields => OrganizationsFields();

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
  bool useLockedFirst = false;
  @override
  bool useNextId = false;

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      fields.field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      fields.getNewRecord();
}

class OrganizationsModuleAndroid
    extends ScrapbookListScreen<OrganizationsModuleList, OrganizationsModuleFields>
    with ScrapbookFields {
  OrganizationsModuleAndroid() : super(I10n.s('Organizations Module'));

  @override
  OrganizationsModuleFields get fields => OrganizationsModuleFields();

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
  bool useLockedFirst = false;
  @override
  bool useNextId = true;

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      fields.field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      fields.getNewRecord();

  @override
  List<Widget> addedWidgets(Map<String, FieldWidgets<PlayHouseFields>> record,
      VoidCallback onTap) {
    final rowid = record['rowid'];
    rowid.label = 'Id';
    final organization = record['organization_id'];
    organization.label = 'Organization Id';
    final module = record['module_id'];
    module.label = 'Module Id';
    final locked = record['lockedFirst'];
    locked.label = 'First Locked';
    final next = record['next_module_id'];
    next.label = 'Next Module';
    return [
      rowid.onListTile(enabled: false, tap: onTap),
      organization.onListTile(enabled: false, tap: onTap),
      module.onListTile(enabled: false, tap: onTap),
      locked.onListTile(enabled: false, tap: onTap),
      next.onListTile(enabled: false, tap: onTap),
    ];
  }
}

class OrganizationsSubmoduleAndroid
    extends ScrapbookListScreen<OrganizationsSubmoduleList, OrganizationsSubmoduleFields>
    with ScrapbookFields {
  OrganizationsSubmoduleAndroid() : super(I10n.s('Organizations Submodule'));

  @override
  OrganizationsSubmoduleFields get fields => OrganizationsSubmoduleFields();

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
  bool useLockedFirst = false;
  @override
  bool useNextId = false;

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      fields.field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      fields.getNewRecord();
}

class OrganizationsTaskAndroid
    extends ScrapbookListScreen<OrganizationsTaskList, OrganizationsTaskFields>
    with ScrapbookFields {
  OrganizationsTaskAndroid() : super(I10n.s('Organizations Task'));

  @override
  OrganizationsTaskFields get fields => OrganizationsTaskFields();

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
  bool useLockedFirst = false;
  @override
  bool useNextId = false;

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      fields.field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      fields.getNewRecord();
}