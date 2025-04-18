// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadDiscoverModulesDB(Database db) async {
/*
* 9
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
       'Discover')
    ''');

  /*
* 10
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
       'Discover')
    ''');

  /*
* 11
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Storytelling',
       'Storytelling and 4 Pillars',
       'This module focuses on the initial phase of the design process. A lot of the tasks outlined require the users to reflect upon and record their ideas. I think this module should be kept relatively open-ended since too linear of a process can restrict creativity. I imagine the users can use the ideas/writing and sketches that are compiled in this module to inform their design further down the line. In the app or AR version of this, I think it would be interesting to have the software compile the information collected from the various input prompts in a graphically-interesting layout for the user to reference and revise as needed.',
       'Discover')
    ''');

/*
* 12
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
       'Discover')
    ''');
}
