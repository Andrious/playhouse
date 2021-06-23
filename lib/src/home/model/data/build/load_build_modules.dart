// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadBuildModulesDB(Database db) async {
  /*
* 5
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Creativity',
       'Creativity Stimulation',
       '',
       'Build')
    ''');

  /*
* 6
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Identity',
       'Identity',
       '',
       'Build')
    ''');

  /*
* 7
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Storytelling',
       'Storytelling and 4 Pillars',
       '',
       'Build')
    ''');

/*
* 8
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Vegetation and Soil',
       'Grading Assessment & Materials Assessment',
       '',
       'Build')
    ''');
}
