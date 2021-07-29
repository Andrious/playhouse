// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadDesignSubmodulesDB(Database db) async {
  /*
*
*
*
* Sub-module 1.1 for Module 1: Creativity
*
*
*
* */

/*
* 1
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       1,
       'Sub-module 1.1',
       'Feeling of things',
       'Through this sub-module users dig into how their outer environment affects their inner feelings.',
       'Design_Conceptual Sketching_ Preliminary Sketch 01.jpg')
    ''');

  /*
* 2
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       1,
       'Sub-module 1.2',
       'Crafting an Experience',
       "Through this sub-module users consciously see how their six senses (vision, hearing, touch, taste, smell, and Proprioception: the body's ability to perceive its own position in space) build their experience of the environment around them. They also pay attention to the role of environments in their memories.",
        'Design_Conceptual Sketching_ Preliminary Sketch 02.jpg')
    ''');

  /*
* 3
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       1,
       'Sub-module 1.3',
       'Design Principles and Elements',
       'The elements, or principles, of visual design include Contrast, Balance, Emphasis, Movement, White Space, Proportion, Hierarchy, Repetition, Rhythm, Pattern, Unity, and Variety. Through this sub-module, the users learn about the importance of theses principles and elements in their environmental perception.',
       'Design_Conceptual Sketching_Bubble Diagram 01.jpg')
    ''');

  /*
* 4
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       1,
       'Sub Module 1.4',
       'Sun Exposure',
       '',
       'Design_Conceptual Sketching_Bubble Diagram 02.jpg')
    ''');

  /*
*
*
*  Sub-module 2.1 for Module 2: Identity
*
*
*
*
* */

  /*
* 5
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       2,
       'Submodule/Floater 2.1',
       'Family Connection',
       '',
       'Design_Conceptual Sketching_Sun, Light, Wind _ Sound 01.jpg')
    ''');

  /*
* 6
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       2,
       'Submodule/Floater 2.2',
       'Cultural Connection',
       '',
       'Design_Plan, Section _ Elevation_Elevation 01.jpg')
    ''');

  /*
* 7
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       2,
       'Submodule/Floater 2.3',
       'Self-Reflection',
       '',
       'Design_Plan, Section _ Elevation_Elevation 02.jpg')
    ''');

  /*
* 8
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       2,
       'Sub Module 2.4',
       'Families or Groups',
       '',
       'Design_Plan, Section _ Elevation_Elevation 03.jpg')
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
* 9
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       3,
       'Sub Module 3.1',
       'Identify Scope and Constraints',
       'This part of the process should start with some exercises showing how storytelling and site analysis weaves with the functional program. It is important to consider the constraints of the project identified in the site analysis portion. The goal of this part is to get the users to reflect on things that they usually would not think about. These questions can then be used later to guide some of the design decisions. I think that these resistances should be presented as opportunities for creativity rather than restrictions.',
       'Design_Plan, Section _ Elevation_Elevation 04.jpg')
    ''');

  /*
* 10
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       3,
       'Sub Module 3.2',
       'What are the Programs',
       'After setting the scope and constraints of the project, the users can begin to define the program of the structure, an accounting of the spaces/rooms, wants, desires, dreams, and things that excite you. At this point there should be no limitations to your ideas of ‘what’ you want in your playhouse. These items will start to paint the picture and tell the story of the problem you need to solve.',
       'Design_Plan, Section _ Elevation_Plan 01.jpg')
    ''');

  /*
* 11
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       3,
       'Submodule 3.3',
       'Be Inspired',
       'Looking at precedents or inspirations can be very helpful in developing a design idea. Doing these exercises can also help users make connections and be inspired by things that they have never previously thought of.',
       'Design_Plan, Section _ Elevation_Plan 02.jpg')
    ''');

  /*
* 12
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       3,
       'Submodule 3.4',
       'Lorem ipsum dolor sit amet',
       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
       'Design_Plan, Section _ Elevation_Plan 03.jpg')
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
* 13
* */

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       4,
       '4.1: Soil and Grading Assessment',
       'Surface and Soil Identification',
       '',
       'Design_Plan, Section _ Elevation_Plan 04.jpg')
    ''');

  /*
* 14
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       4,
       'Submodule 4.2',
       'Identifying Vegetation',
       '',
       'Design_Plan, Section _ Elevation_Section 01.jpg')
    ''');

/*
* 15
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       4,
       'Submodule 4.3',
       'Material Selection',
       '',
       'Design_Plan, Section _ Elevation_Section 02.jpg')
    ''');

/*
* 16
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       4,
       'Submodule 4.4',
       'Surface and Soil Identification',
       '',
       'Design_Plan, Section _ Elevation_Section 03.jpg')
    ''');
}
