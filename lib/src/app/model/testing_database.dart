// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

///todo: place this as an export in dbUtil's FireStoreDB
///todo:  _ex = ex as Exception in dbUtils in a try-catch
import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, FieldValue;

import 'package:playhouse/src/model.dart'
    show FireStoreCollection, infoIcon, required, rocket;

import 'package:playhouse/src/controller.dart' show Auth;

class DatabaseTest {
  factory DatabaseTest() => _this ??= DatabaseTest._();
  DatabaseTest._() : _auth = Auth() {
    // Assign when this record was created.
    _timeStamp = FieldValue.serverTimestamp();
    userId = _auth.uid;
  }
  static DatabaseTest _this;
  //
  FireStoreCollection _table;
  dynamic _timeStamp;
  final Auth _auth;
  String userId;

  /// Create a 'test' database
  ///
  bool createModules() {
    if (userId.isEmpty) {
      return false;
    }
    bool createDB = true;

    final modRef = FireStoreCollection('Modules').collection.doc();

    createDB = createModule(
      modRef,
      name: 'Mod01',
      timestamp: _timeStamp,
    );

    if (!createDB) {
      return createDB;
    }

    final DocumentReference sub01Ref =
        FireStoreCollection('${modRef.path}/Submodules').collection.doc();

    final String sub01Id = sub01Ref.id;

    createSubmodule(
      sub01Ref,
      nextSubId: '',
      name: 'Sub01',
      keyArt: infoIcon,
      timestamp: _timeStamp,
    );

    if (!createDB) {
      return createDB;
    }

    final DocumentReference sub02Ref =
        FireStoreCollection('${modRef.path}/Submodules').collection.doc();

    final String sub02Id = sub02Ref.id;

    createSubmodule(
      sub02Ref,
      nextSubId: '',
      name: 'Sub02',
      keyArt: infoIcon,
      timestamp: _timeStamp,
    );

    createNTasks(doc: sub01Ref, id: sub01Id);

    createNTasks(doc: sub02Ref, id: sub02Id);

    return createDB;
  }

  /// Create a 'Module' record.
  ///
  bool createModule(
    DocumentReference doc, {
    String type = 'Design',
    String nextModId = '',
    @required String name,
    String short = 'A short description.',
    String long = 'A much longer description with more detail.',
    bool complete = false,
    @required dynamic timestamp,
  }) {
    //
    final data = <String, dynamic>{};

    data['type'] = type;
    data['nextModId'] = nextModId;
    data['name'] = name;
    data['short'] = short;
    data['long'] = long;
    data['complete'] = complete;
    data['timestamp'] = timestamp;

    // insert the record
    return createRecord(doc, data);
  }

  /// Create a 'Submodule' record.
  bool createSubmodule(
    DocumentReference doc, {
    @required String nextSubId,
    @required String name,
    String short = 'A short description.',
    String long = 'A much longer description with more detail.',
    bool locked = false,
    bool complete = false,
    @required String keyArt,
    @required dynamic timestamp,
  }) {
    //
    final data = <String, dynamic>{};

    data['nextSubId'] = nextSubId;
    data['name'] = name;
    data['short'] = short;
    data['long'] = long;
    data['locked'] = locked;
    data['complete'] = complete;
    data['keyArt'] = keyArt;
    data['timestamp'] = timestamp;
    // insert the record
    return createRecord(doc, data);
  }

  bool createNTasks({
    DocumentReference doc,
    String id,
    int count = 3,
  }) {
    //
    bool created = true;

    final table = FireStoreCollection('${doc.path}/Tasks').collection;

    for (int cnt = 0; cnt < count; cnt++) {
      //
      created = createTask(
        table.doc(),
        submoduleId: id,
        name: 'Task0${cnt + 1}',
        type: 'DeviceImage',
        keyArt: rocket,
        timestamp: _timeStamp,
      );

      if (!created) {
        break;
      }
    }
    return created;
  }

  /// Create a 'Task' record.
  bool createTask(
    DocumentReference doc, {
    @required String submoduleId,
    @required String name,
    String short = 'A short description.',
    String long = 'A much longer description with more detail.',
    @required String type, // NetworkedImage|NetworkedVideo|DeviceImage|Question
    bool locked = false,
    bool complete = false,
    @required String keyArt,
    @required dynamic timestamp,
  }) {
    //
    final data = <String, dynamic>{};

    data['submoduleId'] = submoduleId;
    data['name'] = name;
    data['short'] = short;
    data['long'] = long;
    data['type'] = 'DeviceImage';
    data['locked'] = locked;
    data['complete'] = complete;
    data['keyArt'] = keyArt;
    data['timestamp'] = timestamp;

    // insert the record
    return createRecord(doc, data);
  }

  /// Insert the record
  /// Return false if there's an error.
  bool createRecord(DocumentReference doc, Map<String, dynamic> data) {
    var create = true;

    // It may not have a userId yet.
    if (userId != null && userId.isNotEmpty) {
      // Each record of course is associated with a particular user.
      data['userId'] = userId;
    }

    doc.set(data).onError((error, stackTrace) {
      create = false;
      _table.getError(error);
    });
    return create;
  }

  /// Create some sample users.
  void createUsers() {}

  /// Create an individual 'user' Firestore record.
  bool createUserRecord(DocumentReference doc, Map<String, dynamic> data) {
    var create = true;
    return create;
  }
}
