// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadOrganizationsDB(Database db) async {
  //
  final timeStamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  /*
* 1
* */
  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS} (
       name,
       short_description,
       long_description,
       time_stamp) VALUES ('General Public',
       'Default Organization',
       'Default Organization if not associated to a particular company or organization.',
       $timeStamp)
    ''');
}
