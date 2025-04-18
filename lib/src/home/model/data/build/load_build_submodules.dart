// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadBuildSubmodulesDB(Database db) async {
  /*
*
*
*
* Sub-module 1.1
*
*
*
* */

/*
* 17
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Sub-module 1.1',
       'Feeling of things',
       'Through this sub-module users dig into how their outer environment affects their inner feelings.',
       'Build_Final Budget_Exterior Design 01.jpg')
    ''');

  /*
* 18
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Sub-module 1.2',
       'Crafting an Experience',
       "Through this sub-module users consciously see how their six senses (vision, hearing, touch, taste, smell, and Proprioception: the body's ability to perceive its own position in space) build their experience of the environment around them. They also pay attention to the role of environments in their memories.",
        'Build_Final Budget_Exterior Design 02.jpg')
    ''');

  /*
* 19
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Sub-module 1.3',
       'Design Principles and Elements',
       'The elements, or principles, of visual design include Contrast, Balance, Emphasis, Movement, White Space, Proportion, Hierarchy, Repetition, Rhythm, Pattern, Unity, and Variety. Through this sub-module, the users learn about the importance of theses principles and elements in their environmental perception.',
       'Build_Final Budget_Exterior Design 03.jpg')
    ''');

  /*
* 20
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Sub Module 1.4',
       'Sun Exposure',
       '',
       'Build_Final Budget_Exterior Design 04.jpg')
    ''');

  /*
*
*
*  Module 2: Identity
*
*
*
*
* */

  /*
* 21
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       6,
       'Submodule/Floater 2.1',
       'Family Connection',
       '',
       'Build_Final Budget_Interior Design 01.jpg')
    ''');

  /*
* 22
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       6,
       'Submodule/Floater 2.2',
       'Cultural Connection',
       '',
       'Build_Final Budget_Interior Design 02.jpg')
    ''');

  /*
* 23
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       6,
       'Submodule/Floater 2.3',
       'Self-Reflection',
       '',
       'Build_Final Budget_Interior Design 03.jpg')
    ''');

  /*
* 24
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       6,
       'Sub Module 2.4',
       'Families or Groups',
       '',
       'Build_Final Budget_Interior Design 04.jpg')
    ''');

  /*
*
*
* Module 3:
*
*
*
*
* */

  /*
* 25
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       7,
       'Sub Module 3.1',
       'Identify Scope and Constraints',
       'This part of the process should start with some exercises showing how storytelling and site analysis weaves with the functional program. It is important to consider the constraints of the project identified in the site analysis portion. The goal of this part is to get the users to reflect on things that they usually would not think about. These questions can then be used later to guide some of the design decisions. I think that these resistances should be presented as opportunities for creativity rather than restrictions.',
       'Build_Final Budget_Landscape Design 01.jpg')
    ''');

  /*
* 26
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       7,
       'Sub Module 3.2',
       'What are the Programs',
       'After setting the scope and constraints of the project, the users can begin to define the program of the structure, an accounting of the spaces/rooms, wants, desires, dreams, and things that excite you. At this point there should be no limitations to your ideas of ‘what’ you want in your playhouse. These items will start to paint the picture and tell the story of the problem you need to solve.',
       'Build_Final Budget_Landscape Design 02.jpg')
    ''');

  /*
* 27
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       7,
       'Submodule 3.3',
       'Be Inspired',
       'Looking at precedents or inspirations can be very helpful in developing a design idea. Doing these exercises can also help users make connections and be inspired by things that they have never previously thought of.',
       'Build_Final Budget_Landscape Design 03.jpg')
    ''');

  /*
* 28
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       7,
       'Submodule 3.4',
       'Lorem ipsum dolor sit amet',
       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
       'Build_Final Budget_Landscape Design 04.jpg')
    ''');

  /*
*
*
* Module 4: Vegetation and Soil
*
*
*
*
* */

  /*
* 29
* */

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       8,
       '4.1: Soil and Grading Assessment',
       'Surface and Soil Identification',
       '',
       'street_intersection02.jpg')
    ''');

  /*
* 30
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       8,
       'Submodule 4.2',
       'Identifying Vegetation',
       '',
       'country_waterfall02.jpg')
    ''');

/*
* 31
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       8,
       'Submodule 4.3',
       'Material Selection',
       '',
       'city_park02.jpg')
    ''');

/*
* 32
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       8,
       'Submodule 4.4',
       'Surface and Soil Identification',
       '',
       'riverbrook_pinktree02.jpg')
    ''');
}
