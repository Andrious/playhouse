// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadBuildMod03Sub04Tasks(Database db) async {
  //
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       28,
       'Task 3.4.1',
       'Find Inspirations',
       'Ask the users to go on the internet (maybe through an in-app browser), flip through some magazines or just explore their surroundings and collect some precedents or things they like. I think they do not necessarily all need to be buildings because inspiration can be found anywhere. I think 5-10 images would be good. This asks people who have a clear idea to explore a little bit more without making it too tedious, but also giving those who do not a chance to browse and take in some precedents.
Pen-and-paper: cut out of magazines and printing out the images from the internet.
App/AR: Would it be possible to have the user save images off the internet and have them directly added to a virtual pin-up/inspiration board? This is also where they would upload photographs of magazine pages or things they found in real life on to the virtual board.
',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       28,
       'Task 3.4.2',
       'Reflection on your inspirations.',
       'Users would be asked to reflect on their findings to “distill” the inspiration and precedents. Going through them one by one, they can type in why they chose a particular image and highlight what makes this interesting or relevant to what they are trying to do.
Pen-and-paper: Users can take some trace paper or markers to draw over their image and annotate below each one about why they find this example interesting.
App/AR: I imagine this functioning similar to something like conceptboard or mural mentioned in task 1. Maybe we can also have a simple drawing and cut-out function similar to what snapchat has, allowing users to quickly circle, roughly trace over and highlight interesting parts of an inspiration image they chose.
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
       28,
       'Task 3.4.3',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       28,
       'Task 3.4.4',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
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
       28,
       'Task 3.4.5',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       28,
       'Task 3.4.6',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
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
       28,
       'Task 3.4.7',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       28,
       'Task 3.4.8',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
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
       28,
       'Task 3.4.9',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       28,
       'Task 3.4.10',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
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
       28,
       'Task 3.4.11',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       28,
       'Task 3.4.12',
       'Collage',
       'I think collages are quick, fun and allow people to work roughly, these quick creations are very open-ended and can accidentally reveal and inspire someone subconsciously.
Pen-and-paper: We can provide some magazines for people to flip through and cut-out and make collages along with the images that they printed out.
App/AR: Using the cut-out function, I thought it might be interesting to have users cut out parts of images of buildings, structures, or anything really and collage to create something new. Here, maybe we can also provide a modest collection of cut-outs or backgrounds for people to use. 
',
       'movieCamera02.jpg')
    ''');
}
