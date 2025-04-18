// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadDesignMod02Sub04Tasks(Database db) async {
  /*
*
*
*
* Sub Module 2.4
*
*
*
* */

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       8,
       'Task 2.4.1',
       'Task 2.4.1',
       'Families/groups should make up a totally new story where each person adds a word until you reach 30 words. Each time someone has to add a word, they need to frame it under the umbrella of either ‘Environmental, Economic, Cultural, Social’ depending on which one they are on. Afterwards, they reorganize the story in one minute for it to make the most sense.',
       'questionMark02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       8,
       'Task 2.4.2',
       'Task 2.4.2',
       'A picture is worth a 1000 words is often what we’re told. Well in this case, we’re going to say 250 words. Using either images provided by us or self-provided images, or perhaps they can snap a photo through the app and upload it. Each user will then imagine and create a fictional story based on that single image.',
       'abc02.jpg')
    ''');
}
