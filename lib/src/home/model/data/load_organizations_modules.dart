// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadOrganizationsModulesDB(Database db) async {
  //

  /*
* 1
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       module_id,
       next_module_id) VALUES (
       1,
       1,
       2)
  ''');

  /*
* 2
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       module_id,
       next_module_id) VALUES (
       1,
       2,
       3)
  ''');

  /*
* 3
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       module_id) VALUES (
       1,
       3,
       4)
  ''');

  /*
* 4
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       module_id) VALUES (
       1,
       4)
  ''');

  /*
* 5
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       module_id,
       first_locked,
       next_module_id) VALUES (
       1,
       5,
       1,
       6)
  ''');

  /*
* 6
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       module_id,
       first_locked,
       next_module_id) VALUES (
       1,
       6,
       1,
       7)
  ''');

  /*
* 7
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       first_locked,
       module_id) VALUES (
       1,
       7,
       1,
       8)
  ''');

  /*
* 8
* */
  await db.execute('''
  INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS_MODULES} (
       organization_id,
       module_id,
       first_locked) VALUES (
       1,
       8,
       1)
  ''');
}
