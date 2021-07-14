// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadDiscoverMod03Sub02Tasks(Database db) async {
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       42,
       'Task 3.2.1',
       'Brainstorm a List of Program Spaces and/or things you would like',
       'Users are asked to think about how this structure can accommodate their uses and desires. By listing a series of programs and things to include, it helps to narrow down the building’s typology from something very broad to something that is much more specific and easy to imagine.',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       42,
       'Task 3.2.2',
       'Create a Bubble Diagram',
       'Bubble diagrams are useful in teasing out the relationships between different programs and spaces. Users are encouraged to consider things such as separations, adjacencies, thresholds, and hierarchy of spaces, etc. The bubble diagram can start to become an extremely abstract plan drawing. All of these might not necessarily translate into the built structure, but I think that they are nonetheless important to consider. 
Pen-and-paper: This is normally drawn on paper and colourized. 
App: can we integrate some sort of tool that allows users to place lines, dots, and other geometric shapes onto a virtual canvas with the ability to edit and resize them? This could be an easy way for users to resize and move about the program bubbles to experiment with different configurations.
AR: Maybe these bubble forms can be imposed onto the 3D terrain to have the programmatic layout more closely related to the context.
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
       42,
       'Task 3.2.3',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.5',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.4',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.6',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.7',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.8',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.9',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.11',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.10',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
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
       42,
       'Task 3.2.12',
       'What do you imagine the space to feel like?',
       'This part would get users to think about and discuss the experiential quality of the spaces.
// this is a really great connector thread with the two-eyed seeing excercises as one space for one person may feel totally different to another.
Pen-and-paper: users can write down/sketch some keywords or notes about how they imagine each program to feel like by describing the atmosphere.
App: Have users type in their ideas in input prompts on each program
AR: Similar to the app, their ideas can be inputted into the 3d terrain with the bubble diagram.
',
       'movieCamera02.jpg')
    ''');
}
