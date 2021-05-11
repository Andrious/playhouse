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
      OrganizationsFields().field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      OrganizationsFields().getNewRecord();
}

class OrganizationsModuleAndroid
    extends ScrapbookListScreen<OrganizationsModuleList, OrganizationsModuleFields>
    with ScrapbookFields {
  OrganizationsModuleAndroid() : super(I10n.s('Organizations Module'));

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
      OrganizationsModuleFields().field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      OrganizationsModuleFields().getNewRecord();
}

class OrganizationsSubmoduleAndroid
    extends ScrapbookListScreen<OrganizationsSubmoduleList, OrganizationsSubmoduleFields>
    with ScrapbookFields {
  OrganizationsSubmoduleAndroid() : super(I10n.s('Organizations Submodule'));

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
      OrganizationsSubmoduleFields().field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      OrganizationsSubmoduleFields().getNewRecord();
}

class OrganizationsTaskAndroid
    extends ScrapbookListScreen<OrganizationsTaskList, OrganizationsTaskFields>
    with ScrapbookFields {
  OrganizationsTaskAndroid() : super(I10n.s('Organizations Task'));

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
      OrganizationsTaskFields().field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields>> newRecord() =>
      OrganizationsTaskFields().getNewRecord();
}