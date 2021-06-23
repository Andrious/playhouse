// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadBuildMod01Sub02Tasks(Database db) async {
  /*
*
*
*
* Sub-module 1.2
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
       18,
       'Task 1.2.1',
       'In a dark room with a paper and pen',
       'The user should sit in a dark room with a paper and pen in hand. The app randomly gives the user 5 images from a simple shape image to a more complicated image. The user should draw what he sees without taking a look at the paper in a predefined time. Then scan and upload what he drew to get the score. The intent is that the user should exercise to look at objects carefully and to adopt his eyes, with his mind and hand.',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.2',
       'Listen To Your Music',
       'The user should listen to her favorite music with closed eyes and paper and pen in hand. Select 10 seconds of the music which impresses her the most, while listening to that 10 seconds, let her hand to draw what she hears and feels freely. The result might be something similar to Audio visualizer.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.3',
       'About Five Feelings',
       'Users should write about their feelings about five materials that they touch by their hands and feet at their home.',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.4',
       'Upload Your Perception',
       'Users should upload some images that reflect their perception of the spaces through each of their six senses. They should also tell the story behind each. Other users/ app instructors score the images/ stories.',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.5',
       'In a dark room with a paper and pen',
       'The user should sit in a dark room with a paper and pen in hand. The app randomly gives the user 5 images from a simple shape image to a more complicated image. The user should draw what he sees without taking a look at the paper in a predefined time. Then scan and upload what he drew to get the score. The intent is that the user should exercise to look at objects carefully and to adopt his eyes, with his mind and hand.',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.6',
       'Listen To Your Music',
       'The user should listen to her favorite music with closed eyes and paper and pen in hand. Select 10 seconds of the music which impresses her the most, while listening to that 10 seconds, let her hand to draw what she hears and feels freely. The result might be something similar to Audio visualizer.',
       'movieCamera02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.7',
       'About Five Feelings',
       'Users should write about their feelings about five materials that they touch by their hands and feet at their home.',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.8',
       'Upload Your Perception',
       'Users should upload some images that reflect their perception of the spaces through each of their six senses. They should also tell the story behind each. Other users/ app instructors score the images/ stories.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.9',
       'In a dark room with a paper and pen',
       'The user should sit in a dark room with a paper and pen in hand. The app randomly gives the user 5 images from a simple shape image to a more complicated image. The user should draw what he sees without taking a look at the paper in a predefined time. Then scan and upload what he drew to get the score. The intent is that the user should exercise to look at objects carefully and to adopt his eyes, with his mind and hand.',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.10',
       'Listen To Your Music',
       'The user should listen to her favorite music with closed eyes and paper and pen in hand. Select 10 seconds of the music which impresses her the most, while listening to that 10 seconds, let her hand to draw what she hears and feels freely. The result might be something similar to Audio visualizer.',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.11',
       'About Five Feelings',
       'Users should write about their feelings about five materials that they touch by their hands and feet at their home.',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       18,
       'Task 1.2.12',
       'Upload Your Perception',
       'Users should upload some images that reflect their perception of the spaces through each of their six senses. They should also tell the story behind each. Other users/ app instructors score the images/ stories.',
       'movieCamera02.jpg')
    ''');
}
