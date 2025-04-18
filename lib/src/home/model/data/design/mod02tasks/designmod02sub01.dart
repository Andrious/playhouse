// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadDesignMod02Sub01Tasks(Database db) async {
/*
*
* Module 2: Identity
*
* Submodule/Floater 2.1
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
       'key_art_file') VALUES (
       5,
       'Task 2.1.1',
       'Those Closest To You',
       'For this task, please list and describe your closest family members or anyone that you feel is (or was) closest to you. Please include a fun sketch of them, their name, their relationship to you, and what traits/qualities you think best describes them.',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.2',
       'Your Family History',
       'For this task, you will now dive a bit deeper into your family history and coordinate a fun interview with each family member or person you included in your previous list. Please ask three questions about their personal history. These questions can be whatever you want and can change from person to person. An example question can be, what was your favorite place to visit as a child? Please use either text to document their answers and submit them into the app.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.3',
       'Assemble Your Team',
       'For this task, you will now look at everyone you interviewed and/or listed and begin to assemble a team that would help you with the construction and maintenance of your design-build structure. You will assign everyone you chose a specific role and describe what that role does and why you chose that person. For example, you can have a family member be an electrician or landscaper for your project because they are great at working with their hands and love fixing things. Please provide their name, their role, what that role does, why you chose them, and lastly provide a fun sketch of them in their role.',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.5',
       'Your Family History',
       'For this task, you will now dive a bit deeper into your family history and coordinate a fun interview with each family member or person you included in your previous list. Please ask three questions about their personal history. These questions can be whatever you want and can change from person to person. An example question can be, what was your favorite place to visit as a child? Please use either text to document their answers and submit them into the app.',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       'key_art_file') VALUES (
       5,
       'Task 2.1.4',
       'Those Closest To You',
       'For this task, please list and describe your closest family members or anyone that you feel is (or was) closest to you. Please include a fun sketch of them, their name, their relationship to you, and what traits/qualities you think best describes them.',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.6',
       'Assemble Your Team',
       'For this task, you will now look at everyone you interviewed and/or listed and begin to assemble a team that would help you with the construction and maintenance of your design-build structure. You will assign everyone you chose a specific role and describe what that role does and why you chose that person. For example, you can have a family member be an electrician or landscaper for your project because they are great at working with their hands and love fixing things. Please provide their name, their role, what that role does, why you chose them, and lastly provide a fun sketch of them in their role.',
       'movieCamera02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       'key_art_file') VALUES (
       5,
       'Task 2.1.7',
       'Those Closest To You',
       'For this task, please list and describe your closest family members or anyone that you feel is (or was) closest to you. Please include a fun sketch of them, their name, their relationship to you, and what traits/qualities you think best describes them.',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.8',
       'Your Family History',
       'For this task, you will now dive a bit deeper into your family history and coordinate a fun interview with each family member or person you included in your previous list. Please ask three questions about their personal history. These questions can be whatever you want and can change from person to person. An example question can be, what was your favorite place to visit as a child? Please use either text to document their answers and submit them into the app.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.9',
       'Assemble Your Team',
       'For this task, you will now look at everyone you interviewed and/or listed and begin to assemble a team that would help you with the construction and maintenance of your design-build structure. You will assign everyone you chose a specific role and describe what that role does and why you chose that person. For example, you can have a family member be an electrician or landscaper for your project because they are great at working with their hands and love fixing things. Please provide their name, their role, what that role does, why you chose them, and lastly provide a fun sketch of them in their role.',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.11',
       'Your Family History',
       'For this task, you will now dive a bit deeper into your family history and coordinate a fun interview with each family member or person you included in your previous list. Please ask three questions about their personal history. These questions can be whatever you want and can change from person to person. An example question can be, what was your favorite place to visit as a child? Please use either text to document their answers and submit them into the app.',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       'key_art_file') VALUES (
       5,
       'Task 2.1.10',
       'Those Closest To You',
       'For this task, please list and describe your closest family members or anyone that you feel is (or was) closest to you. Please include a fun sketch of them, their name, their relationship to you, and what traits/qualities you think best describes them.',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       5,
       'Task 2.1.12',
       'Assemble Your Team',
       'For this task, you will now look at everyone you interviewed and/or listed and begin to assemble a team that would help you with the construction and maintenance of your design-build structure. You will assign everyone you chose a specific role and describe what that role does and why you chose that person. For example, you can have a family member be an electrician or landscaper for your project because they are great at working with their hands and love fixing things. Please provide their name, their role, what that role does, why you chose them, and lastly provide a fun sketch of them in their role.',
       'movieCamera02.jpg')
    ''');
}
