// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadDesignMod04Sub01Tasks(Database db) async {
  /*
*
*
* Module 4: Vegetation and Soil
*
* 4.1: Soil and Grading Assessment
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
       13,
       'Task 4.1.1',
       'Identify five of each',
       'For this first task, we will get you to identify five local plant species, five local shrub species, and five local tree species found within your local region. Please use either online or printed sources to help with your research. Once you’ve identified your local vegetation species, please list the name of that species (Bur Oak), the vegetation type (Tree), and include a photograph or sketch of the species.',
       'questionMark02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.2',
       'Provide now more detail',
       'Once you have completed your initial list of 15 local vegetation species, you will now begin to provide a bit more detail. Please provide the following information for each species you’ve identified: Hardiness Zone, Mature Size, Sun Preference, and Soil Preference. Please use either online or printed sources for your research. This information will help you understand why certain species grow in certain areas and what factors influence their growth.',
       'abc02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.3',
       'Make a list',
       'Now, you will explore your yard or local area and document all the various types of vegetation species you see. Using your previous research, begin to create a list and use a combination of photography, sketching, and text to provide the following information: an image, species name, species type, where it was located, hardiness zone, mature size, sun preference and soil preference. This task will teach you how to effectively identify and use your previous research information to understand the local vegetation found within your area.',
       'AR02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.5',
       'Provide now more detail',
       'Once you have completed your initial list of 15 local vegetation species, you will now begin to provide a bit more detail. Please provide the following information for each species you’ve identified: Hardiness Zone, Mature Size, Sun Preference, and Soil Preference. Please use either online or printed sources for your research. This information will help you understand why certain species grow in certain areas and what factors influence their growth.',
       'pencil02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.4',
       'Identify five of each',
       'For this first task, we will get you to identify five local plant species, five local shrub species, and five local tree species found within your local region. Please use either online or printed sources to help with your research. Once you’ve identified your local vegetation species, please list the name of that species (Bur Oak), the vegetation type (Tree), and include a photograph or sketch of the species.',
       'picture02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.6',
       'Make a list',
       'Now, you will explore your yard or local area and document all the various types of vegetation species you see. Using your previous research, begin to create a list and use a combination of photography, sketching, and text to provide the following information: an image, species name, species type, where it was located, hardiness zone, mature size, sun preference and soil preference. This task will teach you how to effectively identify and use your previous research information to understand the local vegetation found within your area.',
       'movieCamera02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.7',
       'Identify five of each',
       'For this first task, we will get you to identify five local plant species, five local shrub species, and five local tree species found within your local region. Please use either online or printed sources to help with your research. Once you’ve identified your local vegetation species, please list the name of that species (Bur Oak), the vegetation type (Tree), and include a photograph or sketch of the species.',
       'questionMark02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.8',
       'Provide now more detail',
       'Once you have completed your initial list of 15 local vegetation species, you will now begin to provide a bit more detail. Please provide the following information for each species you’ve identified: Hardiness Zone, Mature Size, Sun Preference, and Soil Preference. Please use either online or printed sources for your research. This information will help you understand why certain species grow in certain areas and what factors influence their growth.',
       'abc02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.9',
       'Make a list',
       'Now, you will explore your yard or local area and document all the various types of vegetation species you see. Using your previous research, begin to create a list and use a combination of photography, sketching, and text to provide the following information: an image, species name, species type, where it was located, hardiness zone, mature size, sun preference and soil preference. This task will teach you how to effectively identify and use your previous research information to understand the local vegetation found within your area.',
       'AR02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.11',
       'Provide now more detail',
       'Once you have completed your initial list of 15 local vegetation species, you will now begin to provide a bit more detail. Please provide the following information for each species you’ve identified: Hardiness Zone, Mature Size, Sun Preference, and Soil Preference. Please use either online or printed sources for your research. This information will help you understand why certain species grow in certain areas and what factors influence their growth.',
       'pencil02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.10',
       'Identify five of each',
       'For this first task, we will get you to identify five local plant species, five local shrub species, and five local tree species found within your local region. Please use either online or printed sources to help with your research. Once you’ve identified your local vegetation species, please list the name of that species (Bur Oak), the vegetation type (Tree), and include a photograph or sketch of the species.',
       'picture02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       13,
       'Task 4.1.12',
       'Make a list',
       'Now, you will explore your yard or local area and document all the various types of vegetation species you see. Using your previous research, begin to create a list and use a combination of photography, sketching, and text to provide the following information: an image, species name, species type, where it was located, hardiness zone, mature size, sun preference and soil preference. This task will teach you how to effectively identify and use your previous research information to understand the local vegetation found within your area.',
       'movieCamera02.jpg')
       ''');
}
