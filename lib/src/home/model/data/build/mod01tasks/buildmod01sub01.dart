// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadBuildMod01Sub01Tasks(Database db) async {
/*
*
*
*
* Sub-module 1.1
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
       17,
       'Task 1.1.1',
       'Gaming Phase',
       'We can include some multiple answer questions showing some objects/images/ places/ describing some experiences, etc., and ask the users to match them with different feelings. The intent is that the users exercise how to link their feelings into objects.
There are many scientifically proven Social Emotional Learning Games. We can include one of the existing games in our app (with reference). We should also look for an environmental one or develop one if the game is not available. One keyword could be emotional architecture, emotional design, emotional impact of architecture',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.2',
       'Upload Three Images',
       'Users should upload images of three places/ objects that reflect three emotions that randomly would be given by the app (similar ‘digital cards’).. They might do internet research, refer to their old pics or even take new photos. They should upload the photos into their profile album, describe the reasons that they link these images with that emotions (texture, color, material, design, memory, etc.) and share that with other users/ app instructors to be judged. Based on the other users’ rank to each photo, we can save the images in the app images pool to be used for task 1.1.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.3',
       'Gaming Phase',
       'We can include some multiple answer questions showing some objects/images/ places/ describing some experiences, etc., and ask the users to match them with different feelings. The intent is that the users exercise how to link their feelings into objects.
There are many scientifically proven Social Emotional Learning Games. We can include one of the existing games in our app (with reference). We should also look for an environmental one or develop one if the game is not available. One keyword could be emotional architecture, emotional design, emotional impact of architecture',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.4',
       'Upload Three Images',
       'Users should upload images of three places/ objects that reflect three emotions that randomly would be given by the app (similar ‘digital cards’).. They might do internet research, refer to their old pics or even take new photos. They should upload the photos into their profile album, describe the reasons that they link these images with that emotions (texture, color, material, design, memory, etc.) and share that with other users/ app instructors to be judged. Based on the other users’ rank to each photo, we can save the images in the app images pool to be used for task 1.1.',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.5',
       'Gaming Phase',
       'We can include some multiple answer questions showing some objects/images/ places/ describing some experiences, etc., and ask the users to match them with different feelings. The intent is that the users exercise how to link their feelings into objects.
There are many scientifically proven Social Emotional Learning Games. We can include one of the existing games in our app (with reference). We should also look for an environmental one or develop one if the game is not available. One keyword could be emotional architecture, emotional design, emotional impact of architecture',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.6',
       'Upload Three Images',
       'Users should upload images of three places/ objects that reflect three emotions that randomly would be given by the app (similar ‘digital cards’).. They might do internet research, refer to their old pics or even take new photos. They should upload the photos into their profile album, describe the reasons that they link these images with that emotions (texture, color, material, design, memory, etc.) and share that with other users/ app instructors to be judged. Based on the other users’ rank to each photo, we can save the images in the app images pool to be used for task 1.1.',
       'movieCamera02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.7',
       'Gaming Phase',
       'We can include some multiple answer questions showing some objects/images/ places/ describing some experiences, etc., and ask the users to match them with different feelings. The intent is that the users exercise how to link their feelings into objects.
There are many scientifically proven Social Emotional Learning Games. We can include one of the existing games in our app (with reference). We should also look for an environmental one or develop one if the game is not available. One keyword could be emotional architecture, emotional design, emotional impact of architecture',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.8',
       'Upload Three Images',
       'Users should upload images of three places/ objects that reflect three emotions that randomly would be given by the app (similar ‘digital cards’).. They might do internet research, refer to their old pics or even take new photos. They should upload the photos into their profile album, describe the reasons that they link these images with that emotions (texture, color, material, design, memory, etc.) and share that with other users/ app instructors to be judged. Based on the other users’ rank to each photo, we can save the images in the app images pool to be used for task 1.1.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.9',
       'Gaming Phase',
       'We can include some multiple answer questions showing some objects/images/ places/ describing some experiences, etc., and ask the users to match them with different feelings. The intent is that the users exercise how to link their feelings into objects.
There are many scientifically proven Social Emotional Learning Games. We can include one of the existing games in our app (with reference). We should also look for an environmental one or develop one if the game is not available. One keyword could be emotional architecture, emotional design, emotional impact of architecture',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.10',
       'Upload Three Images',
       'Users should upload images of three places/ objects that reflect three emotions that randomly would be given by the app (similar ‘digital cards’).. They might do internet research, refer to their old pics or even take new photos. They should upload the photos into their profile album, describe the reasons that they link these images with that emotions (texture, color, material, design, memory, etc.) and share that with other users/ app instructors to be judged. Based on the other users’ rank to each photo, we can save the images in the app images pool to be used for task 1.1.',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.11',
       'Gaming Phase',
       'We can include some multiple answer questions showing some objects/images/ places/ describing some experiences, etc., and ask the users to match them with different feelings. The intent is that the users exercise how to link their feelings into objects.
There are many scientifically proven Social Emotional Learning Games. We can include one of the existing games in our app (with reference). We should also look for an environmental one or develop one if the game is not available. One keyword could be emotional architecture, emotional design, emotional impact of architecture',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       17,
       'Task 1.1.12',
       'Upload Three Images',
       'Users should upload images of three places/ objects that reflect three emotions that randomly would be given by the app (similar ‘digital cards’).. They might do internet research, refer to their old pics or even take new photos. They should upload the photos into their profile album, describe the reasons that they link these images with that emotions (texture, color, material, design, memory, etc.) and share that with other users/ app instructors to be judged. Based on the other users’ rank to each photo, we can save the images in the app images pool to be used for task 1.1.',
       'movieCamera02.jpg')
    ''');
}
