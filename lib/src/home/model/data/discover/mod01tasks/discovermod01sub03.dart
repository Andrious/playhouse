// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadDiscoverMod01Sub03Tasks(Database db) async {
/*
*
*
*
* Sub-module 1.3
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
       35,
       'Task 1.3.1',
       'matching game',
       '',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.2',
       'take three photos',
       'Users should take three photos of spaces that lines emphasize on three of design principals given by the app. We can include other tasks for shapes, colors, forms, textures, light and shadow, pattern, etc. As I mentioned we can also add some psychological tests here.
I have many ideas about tasks of this submodule that are really exciting. I will refer to my teaching documents and provide you with details. I will also include some personality type tests related to the colors, forms, shapes, music, etc.
',
'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.3',
       'matching game',
       '',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.5',
       'matching game',
       '',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.4',
       'take three photos',
       'Users should take three photos of spaces that lines emphasize on three of design principals given by the app. We can include other tasks for shapes, colors, forms, textures, light and shadow, pattern, etc. As I mentioned we can also add some psychological tests here.
I have many ideas about tasks of this submodule that are really exciting. I will refer to my teaching documents and provide you with details. I will also include some personality type tests related to the colors, forms, shapes, music, etc.
',
'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.6',
       'take three photos',
       'Users should take three photos of spaces that lines emphasize on three of design principals given by the app. We can include other tasks for shapes, colors, forms, textures, light and shadow, pattern, etc. As I mentioned we can also add some psychological tests here.
I have many ideas about tasks of this submodule that are really exciting. I will refer to my teaching documents and provide you with details. I will also include some personality type tests related to the colors, forms, shapes, music, etc.
',
'movieCamera02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.7',
       'matching game',
       '',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.8',
       'take three photos',
       'Users should take three photos of spaces that lines emphasize on three of design principals given by the app. We can include other tasks for shapes, colors, forms, textures, light and shadow, pattern, etc. As I mentioned we can also add some psychological tests here.
I have many ideas about tasks of this submodule that are really exciting. I will refer to my teaching documents and provide you with details. I will also include some personality type tests related to the colors, forms, shapes, music, etc.
',
'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.9',
       'matching game',
       '',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.11',
       'matching game',
       '',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.10',
       'take three photos',
       'Users should take three photos of spaces that lines emphasize on three of design principals given by the app. We can include other tasks for shapes, colors, forms, textures, light and shadow, pattern, etc. As I mentioned we can also add some psychological tests here.
I have many ideas about tasks of this submodule that are really exciting. I will refer to my teaching documents and provide you with details. I will also include some personality type tests related to the colors, forms, shapes, music, etc.
',
'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       35,
       'Task 1.3.12',
       'take three photos',
       'Users should take three photos of spaces that lines emphasize on three of design principals given by the app. We can include other tasks for shapes, colors, forms, textures, light and shadow, pattern, etc. As I mentioned we can also add some psychological tests here.
I have many ideas about tasks of this submodule that are really exciting. I will refer to my teaching documents and provide you with details. I will also include some personality type tests related to the colors, forms, shapes, music, etc.
',
'movieCamera02.jpg')
    ''');
}
