// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadDesignMod04Sub02Tasks(Database db) async {
  /*
*
*
*
* Submodule 4.2
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
       14,
       'Task 4.2.1',
       'Explore a site',
       'For this first task, you will choose a single site or area to explore. Once your site is chosen, please begin to photograph or sketch five different construction materials. These construction materials can be whatever you see (a deck made out of wood, or a brick sidewalk, or the stucco siding of a house). When taking a photograph or sketching your material, please also include the pattern of the material. Once your photos or sketches are completed, you will also label the image with the name of the material and application of the material. For example, material type = wood, material application = exterior deck.',
       'questionMark02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.2',
       'Document the area',
       'For this task, go back to your chosen site and document the natural materials found within or around the area. These natural materials can exist in the form of trees, shrubs, plants, rocks, soil, sand, etc. Please photograph or sketch each individual natural material and begin to compile a list that includes a photo or sketch image, name of material and where it was found.',
       'abc02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.3',
       'Compare materials',
       'For this task, you will use both of your construction and natural material lists to compare if the construction materials found are similar or different than the existing natural materials found. The point of this exercise is to question where we are getting are materials from. Please compare your two material lists and discover potential matches, and if none exist, please substitute the construction material with a local, natural material instead.',
       'AR02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.5',
       'Document the area',
       'For this task, go back to your chosen site and document the natural materials found within or around the area. These natural materials can exist in the form of trees, shrubs, plants, rocks, soil, sand, etc. Please photograph or sketch each individual natural material and begin to compile a list that includes a photo or sketch image, name of material and where it was found.',
       'pencil02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.4',
       'Explore a site',
       'For this first task, you will choose a single site or area to explore. Once your site is chosen, please begin to photograph or sketch five different construction materials. These construction materials can be whatever you see (a deck made out of wood, or a brick sidewalk, or the stucco siding of a house). When taking a photograph or sketching your material, please also include the pattern of the material. Once your photos or sketches are completed, you will also label the image with the name of the material and application of the material. For example, material type = wood, material application = exterior deck.',
       'picture02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.6',
       'Compare materials',
       'For this task, you will use both of your construction and natural material lists to compare if the construction materials found are similar or different than the existing natural materials found. The point of this exercise is to question where we are getting are materials from. Please compare your two material lists and discover potential matches, and if none exist, please substitute the construction material with a local, natural material instead.',
       'movieCamera02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.7',
       'Explore a site',
       'For this first task, you will choose a single site or area to explore. Once your site is chosen, please begin to photograph or sketch five different construction materials. These construction materials can be whatever you see (a deck made out of wood, or a brick sidewalk, or the stucco siding of a house). When taking a photograph or sketching your material, please also include the pattern of the material. Once your photos or sketches are completed, you will also label the image with the name of the material and application of the material. For example, material type = wood, material application = exterior deck.',
       'questionMark02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.8',
       'Document the area',
       'For this task, go back to your chosen site and document the natural materials found within or around the area. These natural materials can exist in the form of trees, shrubs, plants, rocks, soil, sand, etc. Please photograph or sketch each individual natural material and begin to compile a list that includes a photo or sketch image, name of material and where it was found.',
       'abc02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.9',
       'Compare materials',
       'For this task, you will use both of your construction and natural material lists to compare if the construction materials found are similar or different than the existing natural materials found. The point of this exercise is to question where we are getting are materials from. Please compare your two material lists and discover potential matches, and if none exist, please substitute the construction material with a local, natural material instead.',
       'AR02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.11',
       'Document the area',
       'For this task, go back to your chosen site and document the natural materials found within or around the area. These natural materials can exist in the form of trees, shrubs, plants, rocks, soil, sand, etc. Please photograph or sketch each individual natural material and begin to compile a list that includes a photo or sketch image, name of material and where it was found.',
       'pencil02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.10',
       'Explore a site',
       'For this first task, you will choose a single site or area to explore. Once your site is chosen, please begin to photograph or sketch five different construction materials. These construction materials can be whatever you see (a deck made out of wood, or a brick sidewalk, or the stucco siding of a house). When taking a photograph or sketching your material, please also include the pattern of the material. Once your photos or sketches are completed, you will also label the image with the name of the material and application of the material. For example, material type = wood, material application = exterior deck.',
       'picture02.jpg')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       14,
       'Task 4.2.12',
       'Compare materials',
       'For this task, you will use both of your construction and natural material lists to compare if the construction materials found are similar or different than the existing natural materials found. The point of this exercise is to question where we are getting are materials from. Please compare your two material lists and discover potential matches, and if none exist, please substitute the construction material with a local, natural material instead.',
       'movieCamera02.jpg')
       ''');
}
