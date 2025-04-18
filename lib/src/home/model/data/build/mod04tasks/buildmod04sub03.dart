// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadBuildMod04Sub03Tasks(Database db) async {
  /*
*
*
*
* Submodule 4.3
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
       31,
       'Task 4.3.1',
       'Identify different surfaces',
       'For this task, please explore your local area or neighborhood and locate five different types of ground surfaces (sand, soil, rock, etc.). Document your findings using photographs or sketches and collect a small sample of each surface. Please also label the name of the surface, describe where it is was located, and what it was used for. This task is meant to expose you to multiple types of ground surfaces out there and how they are applied in design and construction.',
       'questionMark02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.2',
       'Describe them',
       'For this task, please begin to research and briefly describe the characteristics of the following soil types in two or three sentences: clay, sandy, silty, peaty, chalky and loamy. This research will help familiarize you with the most common types of soils that are found and how they are different from one another.',
       'abc02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.3',
       'Dig a hole',
       'For this task, you will select a specific site. On this site, you will dig a small hole and remove the intact soil. Document your process using photos and sketches and identify the following soil layers in your sample: organic layer, top soil layer, and sub soil layer. Please label each layer and its thickness using a measuring tape. This soil test will highlight the few basic layers that make up a typical soil profile. When designing structure, locating and identifying the multiple layers of the soil is critical in determining your foundation type.',
       'AR02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.4',
       'Explore our app',
       'For this task, our users will explore our pre-defined polygon terrain environment within the app. Each polygon or group of polygon sections of the 3D terrain will have its own soil profile attached. The user will have to find and identify all the different soil profiles found within our terrain polygon environment. This will teach users about the different types of soils typically found within their region in a fun and interactive game approach.',
       'picture02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.5',
       'Identify different surfaces',
       'For this task, please explore your local area or neighborhood and locate five different types of ground surfaces (sand, soil, rock, etc.). Document your findings using photographs or sketches and collect a small sample of each surface. Please also label the name of the surface, describe where it is was located, and what it was used for. This task is meant to expose you to multiple types of ground surfaces out there and how they are applied in design and construction.',
       'pencil02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.6',
       'Describe them',
       'For this task, please begin to research and briefly describe the characteristics of the following soil types in two or three sentences: clay, sandy, silty, peaty, chalky and loamy. This research will help familiarize you with the most common types of soils that are found and how they are different from one another.',
       'movieCamera02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.7',
       'Dig a hole',
       'For this task, you will select a specific site. On this site, you will dig a small hole and remove the intact soil. Document your process using photos and sketches and identify the following soil layers in your sample: organic layer, top soil layer, and sub soil layer. Please label each layer and its thickness using a measuring tape. This soil test will highlight the few basic layers that make up a typical soil profile. When designing structure, locating and identifying the multiple layers of the soil is critical in determining your foundation type.',
       'questionMark02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.8',
       'Explore our app',
       'For this task, our users will explore our pre-defined polygon terrain environment within the app. Each polygon or group of polygon sections of the 3D terrain will have its own soil profile attached. The user will have to find and identify all the different soil profiles found within our terrain polygon environment. This will teach users about the different types of soils typically found within their region in a fun and interactive game approach.',
       'abc02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.9',
       'Identify different surfaces',
       'For this task, please explore your local area or neighborhood and locate five different types of ground surfaces (sand, soil, rock, etc.). Document your findings using photographs or sketches and collect a small sample of each surface. Please also label the name of the surface, describe where it is was located, and what it was used for. This task is meant to expose you to multiple types of ground surfaces out there and how they are applied in design and construction.',
       'AR02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.10',
       'Describe them',
       'For this task, please begin to research and briefly describe the characteristics of the following soil types in two or three sentences: clay, sandy, silty, peaty, chalky and loamy. This research will help familiarize you with the most common types of soils that are found and how they are different from one another.',
       'picture02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.11',
       'Dig a hole',
       'For this task, you will select a specific site. On this site, you will dig a small hole and remove the intact soil. Document your process using photos and sketches and identify the following soil layers in your sample: organic layer, top soil layer, and sub soil layer. Please label each layer and its thickness using a measuring tape. This soil test will highlight the few basic layers that make up a typical soil profile. When designing structure, locating and identifying the multiple layers of the soil is critical in determining your foundation type.',
       'pencil02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       31,
       'Task 4.3.12',
       'Explore our app',
       'For this task, our users will explore our pre-defined polygon terrain environment within the app. Each polygon or group of polygon sections of the 3D terrain will have its own soil profile attached. The user will have to find and identify all the different soil profiles found within our terrain polygon environment. This will teach users about the different types of soils typically found within their region in a fun and interactive game approach.',
       'movieCamera02.jpg')
       ''');
}
