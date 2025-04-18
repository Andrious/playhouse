// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadBuildMod03Sub01Tasks(Database db) async {
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       25,
       'Task 3.1.1',
       'Find meaning',
       'Identify items in the previous exercises that provoked meaning and emotion to yourself, and write a sentence or two in story form describing why they are important. Feel free to sketch, make, etc at this stage as this is the time where there are no rules yet.',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       25,
       'Task 3.1.2',
       'Understanding zoning regulations and by-laws',
       'Users have to determine what type of structures can be built legally on their property. We can make a step by step guide to determining the property class of the lot. Then we can present some of the information about what is legal and if permits are required for several of the lot types that the users might have, but mentioning that they should always read the documentation provided by local authorities. This information can help them make some decisions on the size and function of the structure before diving deeper into the design process. 
Pen-and-paper: Users will be provided a guide from us about how to determine the information mentioned above.
App: This could be a step-by-step progression-tree type of process in which the users tap to unlock the information that is relevant to their situation. 
AR: I am uncertain about whether Augmented reality can enhance this experience. Perhaps here they can add a layer of zoning information into the AR terrain
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
       25,
       'Task 3.1.3',
       'Consider the Site and Local Climate Conditions',
       'This section asks the users to analyse the information collected from the site information and think about how a potential structure will interact with the various elements. How it will affect and be affected by things such as the sun, shade, temperature, local vegetation and animals (ecology) as well as neighbours and the greater community. Users will be guided to examine each of the findings from the site assessment and write down some reminders so that their design down the line can attempt to address these things.
Pen-and-paper: Note down their finding on paper and illustrate some ideas with sketches.
App: Type their thoughts onto the app.
AR: Users can begin to populate the terrain with some of their findings and add annotations in appropriate places.
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
       25,
       '3.1.4',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.5',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.6',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.7',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.8',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.9',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.10',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.11',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
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
       25,
       '3.1.12',
       'Assessing Materials',
       'Users are asked to think about what types of material can be used to construct their structures. This can tie back to the earlier discussions about sustainability and life-cycle thinking, and we can offer some examples of unique and easy-to-manage materials such as cork, so that users do not default to wood without thinking. They will also assess their own capabilities in terms of technical knowhow and equipment. (for example, construction experience, design/art background, 3D modeling, etc). I think this can encourage and empower users to create unique and interesting structures from their unique personal background and skills.
Pen-and-paper: We can provide them with some examples of materials and have them write down some of their findings regarding material availability, sustainability as well as their own capacities.

App: This would be similar to the pen-and-paper process but the user will type in their thoughts into the app at specific inputs prompts
AR: This is more of a reflective process and I do not think AR is needed. I think some type of input prompts would work well to record the user’s thoughts
',
       'movieCamera02.jpg')
    ''');
}
