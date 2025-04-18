// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///
Future<void> loadDiscoverMod01Sub04Tasks(Database db) async {
  /*
*
*
*
* Sub Module 1.4
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
       36,
       'Task 1.4.1',
       'Choose Your Site',
       'Choose a site within your yard, local neighborhood or area. Walk to your site three times a day. Once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Document what you see and feel during each visit using text, sketching, photography, and/or video. Are there lots of people or animals? Are there trees or no trees? Is it cold or warm?',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.2',
       'See Your Site',
       'Choose a site within your local neighborhood or area. On a sunny day, walk to your site once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Describe how the sunshine changes and impacts your site based on each visit. On a cloudy day, please do the exact same thing and describe any differences you notice between the sunny and cloudy days during each visit. Use either text, sketch, photography, and/or video.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.3',
       'Your Location Over Time',
       'Over a 3-hour time span during the day, go outside and while in the same position, locate the sun in the sky. Document its location either through photography, video, or sketch. Label the time of day and repeat every 30 minutes for 3-Hours. Summarize what you noticed about the suns positioning throughout the time span. Were you able to see it at all times or was it hidden?',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.5',
       'See Your Site',
       'Choose a site within your local neighborhood or area. On a sunny day, walk to your site once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Describe how the sunshine changes and impacts your site based on each visit. On a cloudy day, please do the exact same thing and describe any differences you notice between the sunny and cloudy days during each visit. Use either text, sketch, photography, and/or video.',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.4',
       'Choose Your Site',
       'Choose a site within your yard, local neighborhood or area. Walk to your site three times a day. Once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Document what you see and feel during each visit using text, sketching, photography, and/or video. Are there lots of people or animals? Are there trees or no trees? Is it cold or warm?',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.6',
       'Your Location Over Time',
       'Over a 3-hour time span during the day, go outside and while in the same position, locate the sun in the sky. Document its location either through photography, video, or sketch. Label the time of day and repeat every 30 minutes for 3-Hours. Summarize what you noticed about the suns positioning throughout the time span. Were you able to see it at all times or was it hidden?',
       'movieCamera02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.7',
       'Choose Your Site',
       'Choose a site within your yard, local neighborhood or area. Walk to your site three times a day. Once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Document what you see and feel during each visit using text, sketching, photography, and/or video. Are there lots of people or animals? Are there trees or no trees? Is it cold or warm?',
       'questionMark02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.8',
       'See Your Site',
       'Choose a site within your local neighborhood or area. On a sunny day, walk to your site once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Describe how the sunshine changes and impacts your site based on each visit. On a cloudy day, please do the exact same thing and describe any differences you notice between the sunny and cloudy days during each visit. Use either text, sketch, photography, and/or video.',
       'abc02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.9',
       'Your Location Over Time',
       'Over a 3-hour time span during the day, go outside and while in the same position, locate the sun in the sky. Document its location either through photography, video, or sketch. Label the time of day and repeat every 30 minutes for 3-Hours. Summarize what you noticed about the suns positioning throughout the time span. Were you able to see it at all times or was it hidden?',
       'AR02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.11',
       'See Your Site',
       'Choose a site within your local neighborhood or area. On a sunny day, walk to your site once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Describe how the sunshine changes and impacts your site based on each visit. On a cloudy day, please do the exact same thing and describe any differences you notice between the sunny and cloudy days during each visit. Use either text, sketch, photography, and/or video.',
       'pencil02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.10',
       'Choose Your Site',
       'Choose a site within your yard, local neighborhood or area. Walk to your site three times a day. Once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Document what you see and feel during each visit using text, sketching, photography, and/or video. Are there lots of people or animals? Are there trees or no trees? Is it cold or warm?',
       'picture02.jpg')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description,
       key_art_file) VALUES (
       36,
       'Task 1.4.12',
       'Your Location Over Time',
       'Over a 3-hour time span during the day, go outside and while in the same position, locate the sun in the sky. Document its location either through photography, video, or sketch. Label the time of day and repeat every 30 minutes for 3-Hours. Summarize what you noticed about the suns positioning throughout the time span. Were you able to see it at all times or was it hidden?',
       'movieCamera02.jpg')
    ''');
}
