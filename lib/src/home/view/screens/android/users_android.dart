// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

/// Look to the mixin ScrapbookFields for the actual listing.
class UsersListAndroid extends ScrapbookListScreen<UsersList, UsersFields>
    with ScrapbookFields {
  UsersListAndroid() : super(I10n.s('User'));

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
  bool useLockedFirst = false;
  @override
  bool useNextId = false;
  @override
  bool useCompleted = false;
  @override
  bool useDeleted = false;

  /// Supply the widgets to 'list' the record.
  @override
  List<Widget> addedWidgets(
    Map<String, FieldWidgets<PlayHouseFields>> record,
    VoidCallback onTap,
  ) {
    final name = record['organization_name'];
    name.label = 'Organization';
    final short = record['organization_short'];
    short.label = 'Summary';
    final long = record['organization_long'];
    long.label = 'Description';
    return [
      name.onListTile(tap: onTap),
      short.onListTile(tap: onTap),
      long.onListTile(tap: onTap),
    ];
  }

  /// Supply the fields required to 'edit' the current record.
  @override
  List<Widget> editWidgets(
    Map<String, FieldWidgets<PlayHouseFields>> record,
  ) {
    final org = record['organization_id'];
    final widgets = [
      record['rowid'].onListTile(enabled: false),
      record['name'].textFormField,
      record['short_description'].textFormField,
      record['long_description'].textFormField,
      record['email_address'].textFormField,
      record['phone_number'].textFormField,
      org.onListItems(dropItems: _organizations(org)),
    ];
    /// There may be additional 'organization' fields.
    if (record['organization_name'] != null) {
      widgets.addAll([
        record['organization_name'].onListTile(enabled: false),
        record['organization_short'].onListTile(enabled: false),
        record['organization_long'].onListTile(enabled: false),
      ]);
    }
    return widgets;
  }

  /// List the next submodules
  List<String> _organizations(FieldWidgets<PlayHouseFields> record) {
    return [''];
  }

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      UsersFields().field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields<SQLiteTable>>> newRecord() =>
      UsersFields().getNewRecord();
}
