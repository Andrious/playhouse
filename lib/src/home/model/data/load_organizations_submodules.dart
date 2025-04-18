// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadOrganizationsSubmodulesDB(Database db) async {
  //
  /*
* 1
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id,
  next_submodule_id
  ) VALUES (
  1,
  1,
  2)
  ''');

  /*
* 2
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id,
  next_submodule_id
  ) VALUES (
  1,
  2,
  3)
  ''');

  /*
* 3
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id,
  next_submodule_id
  ) VALUES (
  1,
  3,
  4)
  ''');

  /*
* 4
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id) VALUES (
  1,
  4)
  ''');

  /*
* 5
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id,
  next_submodule_id
  ) VALUES (
  1,
  5,
  6)
  ''');

  /*
* 6
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id,
  next_submodule_id
  ) VALUES (
  1,
  6,
  7)
  ''');

  /*
*7
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id,
  first_locked,
  next_submodule_id) VALUES (
  1,
  7,
  1,
  8)
  ''');

  /*
* 8
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_SUBMODULES} (
  organization_id,
  submodule_id,
  first_locked) VALUES (
  1,
  8,
  1)
  ''');
}
