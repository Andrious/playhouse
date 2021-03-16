// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

///todo: place this as an export in dbUtil's FireStoreDB
///todo:  _ex = ex as Exception in dbUtils in a try-catch
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayhouseDB {
  FireStoreDB db;

  void createDB() {
    bool createDB = true;

    db = FireStoreDB('Modules');

    if (db.uid.isEmpty) {
      return;
    }

    final _timeStamp = FieldValue.serverTimestamp();

    // final module = <String, dynamic>{};
    // module['type'] = 'Design';
    // module['nextMod'] = '';
    // module['name'] = 'Mod01';
    // module['short'] = 'A short description.';
    // module['long'] = 'A much longer description with more detail.';
    // module['complete'] = false;
    // module['timestamp'] = _timeStamp;
    //
    // var ref = db.collection.doc();
    //
    // ref.set(module).onError((error, stackTrace) {
    //   createDB = false;
    //   db.getError(error);
    // });
    //
    // if (!createDB) {
    //   return;
    // }

    final submodule = <String, dynamic>{};
//    submodule['moduleId'] = 'PvBT1E1l1IAttClPpXXU';
    submodule['nextSubId'] = '';
    submodule['name'] = 'Sub01';
    submodule['short'] = 'A short description.';
    submodule['long'] = 'A much longer description with more detail.';
    submodule['locked'] = false;
    submodule['complete'] = false;
    submodule['keyArt'] = infoIcon;
    submodule['timestamp'] = _timeStamp;

// Modules/P6YXgJLmhQyxmExsXvn2
    var ref = FireStoreDB('Modules/PvBT1E1l1IAttClPpXXU/Submodules').collection.doc();

    ref.set(submodule).onError((error, stackTrace) {
      createDB = false;
      db.getError(error);
    });

    if (!createDB) {
      return;
    }

    final task = <String, dynamic>{};
//    task['submoduleId'] = ref.id;
    task['name'] = 'Task01';
    task['short'] = 'A short description.';
    task['long'] = 'A much longer description with more detail.';
    task['type'] = 'DeviceImage';
    task['locked'] = false;
    task['complete'] = false;
    task['keyArt'] = rocket;
    task['timestamp'] = _timeStamp;

    ref = FireStoreDB('${ref.path}/Tasks').collection.doc();

    ref.set(task).onError((error, stackTrace) {
      createDB = false;
      db.getError(error);
    });
  }
}

class Module {
  Module({
    @required this.type,
    @required this.nextModId,
    @required this.name,
    @required this.short,
    @required this.long,
    @required this.complete,
  });

  final String type; // Design | Build
  final String nextModId;
  final String name;
  final String short;
  final String long;
  final bool complete;
}

class Submodule {
  Submodule({
    @required this.moduleId,
    @required this.nextSubId,
    @required this.name,
    @required this.short,
    @required this.long,
    @required this.locked,
    @required this.complete,
    @required this.keyArt,
  });

  final String moduleId;
  final String nextSubId;
  final String name;
  final String short;
  final String long;
  final bool locked;
  final bool complete;
  final String keyArt;
}

class Task {
  Task({
    @required this.submoduleId,
    @required this.name,
    @required this.short,
    @required this.long,
    @required this.type,
    @required this.locked,
    @required this.complete,
    @required this.keyArt,
  });

  final String submoduleId;
  final String name;
  final String short;
  final String long;
  final String type; // NetworkedImage|NetworkedVideo|DeviceImage|Question
  final bool locked;
  final bool complete;
  final String keyArt;
}
