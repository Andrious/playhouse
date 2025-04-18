// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadDiscoverSubmodulesDB(Database db) async {
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
* 33
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       9,
       'Sub-module 1.1',
       'Feeling of things',
       'Through this sub-module users dig into how their outer environment affects their inner feelings.',
       'Discover_Drawing _ Drafting_Advanced Techniques 01.jpg')
    ''');

  /*
* 33
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       9,
       'Sub-module 1.2',
       'Crafting an Experience',
       "Through this sub-module users consciously see how their six senses (vision, hearing, touch, taste, smell, and Proprioception: the body's ability to perceive its own position in space) build their experience of the environment around them. They also pay attention to the role of environments in their memories.",
        'Discover_Drawing _ Drafting_Advanced Techniques 02.jpg')
    ''');

  /*
* 35
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       9,
       'Sub-module 1.3',
       'Design Principles and Elements',
       'The elements, or principles, of visual design include Contrast, Balance, Emphasis, Movement, White Space, Proportion, Hierarchy, Repetition, Rhythm, Pattern, Unity, and Variety. Through this sub-module, the users learn about the importance of theses principles and elements in their environmental perception.',
       'Discover_Drawing _ Drafting_Intro to Drawing 01.jpg')
    ''');

  /*
* 36
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       9,
       'Sub Module 1.4',
       'Sun Exposure',
       '',
       'Discover_Drawing _ Drafting_Intro to Drawing 02.jpg')
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
* 37
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       10,
       'Submodule/Floater 2.1',
       'Family Connection',
       '',
       'Discover_Drawing _ Drafting_Intro to SketchUp 01.jpg')
    ''');

  /*
* 38
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       10,
       'Submodule/Floater 2.2',
       'Cultural Connection',
       '',
       'Discover_Drawing _ Drafting_Intro to SketchUp 02.jpg')
    ''');

  /*
* 39
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       10,
       'Submodule/Floater 2.3',
       'Self-Reflection',
       '',
       'Discover_Drawing _ Drafting_Intro to SketchUp 03.jpg')
    ''');

  /*
* 40
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       10,
       'Sub Module 2.4',
       'Families or Groups',
       '',
       'Discover_Drawing _ Drafting_Intro to SketchUp 04.jpg')
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
* 41
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       11,
       'Sub Module 3.1',
       'Identify Scope and Constraints',
       'This part of the process should start with some exercises showing how storytelling and site analysis weaves with the functional program. It is important to consider the constraints of the project identified in the site analysis portion. The goal of this part is to get the users to reflect on things that they usually would not think about. These questions can then be used later to guide some of the design decisions. I think that these resistances should be presented as opportunities for creativity rather than restrictions.',
       'Discover_Site Selection_Soil, Slope _ Drainage 01.jpg')
    ''');

  /*
* 42
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       11,
       'Sub Module 3.2',
       'What are the Programs',
       'After setting the scope and constraints of the project, the users can begin to define the program of the structure, an accounting of the spaces/rooms, wants, desires, dreams, and things that excite you. At this point there should be no limitations to your ideas of ‘what’ you want in your playhouse. These items will start to paint the picture and tell the story of the problem you need to solve.',
       'Discover_Site Selection_Soil, Slope _ Drainage 02.jpg')
    ''');

  /*
* 43
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       11,
       'Submodule 3.3',
       'Be Inspired',
       'Looking at precedents or inspirations can be very helpful in developing a design idea. Doing these exercises can also help users make connections and be inspired by things that they have never previously thought of.',
       'Discover_Site Selection_Spirit of Place 01.jpg')
    ''');

  /*
* 44
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       11,
       'Submodule 3.4',
       'Lorem ipsum dolor sit amet',
       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
       'Discover_Site Selection_Spirit of Place 02.jpg')
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
* 45
* */

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       12,
       '4.1: Soil and Grading Assessment',
       'Surface and Soil Identification',
       '',
       'Discover_Site Selection_Spirit of Place 03.jpg')
    ''');

  /*
* 46
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       12,
       'Submodule 4.2',
       'Identifying Vegetation',
       '',
       'Discover_Site Selection_Sun 01.jpg')
    ''');

/*
* 47
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       12,
       'Submodule 4.3',
       'Material Selection',
       '',
       'Discover_Site Selection_Sun 02.jpg')
    ''');

/*
* 48
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       12,
       'Submodule 4.4',
       'Surface and Soil Identification',
       '',
       'Discover_Site Selection_Wind _ Weather 01.jpg')
    ''');
}
