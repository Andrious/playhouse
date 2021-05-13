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
  bool useTimeStamp = true;
  @override
  bool useEmail = false;
  @override
  bool usePhone = false;
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
  bool useTimeStamp = true;
  @override
  bool useEmail = false;
  @override
  bool usePhone = false;
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

class OrganizationsSubmoduleAndroid
    extends ScrapbookListScreen<OrganizationsSubmoduleList, OrganizationsSubmoduleFields>
    with ScrapbookFields {
  OrganizationsSubmoduleAndroid() : super(I10n.s('Organizations Submodule'));

  @override
  OrganizationsSubmoduleFields get fields => OrganizationsSubmoduleFields();

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
  bool useTimeStamp = true;
  @override
  bool useEmail = false;
  @override
  bool usePhone = false;
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
  bool useTimeStamp = true;
  @override
  bool useEmail = false;
  @override
  bool usePhone = false;
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