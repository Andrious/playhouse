// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

class UsersListAndroid extends ScrapbookListScreen<UsersList, UsersFields>
    with ScrapbookFields {
  UsersListAndroid() : super(I10n.s('User'));

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
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      UsersFields().field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields<SQLiteTable>>> newRecord() =>
      UsersFields().getNewRecord();
}
