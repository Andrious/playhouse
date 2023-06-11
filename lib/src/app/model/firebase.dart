// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dbutils/firebase_db.dart' as f;
import 'package:flutter/widgets.dart' show AppLifecycleState;

import 'package:playhouse/src/model.dart';
import 'package:playhouse/src/controller.dart' show App, AppController;

class FirebaseUser with FirebaseOperations {
  factory FirebaseUser() => _this ??= FirebaseUser._();
  FirebaseUser._() {
    _table = FireStoreCollection('users');
  }
  static FirebaseUser? _this;

  @override
  Future<bool> initAsync() async {
    final init = await super.initAsync();
    if (init && _data.isEmpty) {
      _data = _addUserData();
    }
    return init;
  }

  CollectionReference? _anonymousUser;
  DocumentReference get devices => UserDevices()._reference;
  CollectionReference? _anonymousDeviceRef;

  void removeAnonymous() {
    // if (_anonymousUser == null) {
    //   //     _anonymousUser = userRef;
    //   _anonymousDeviceRef = yourDevicesRef;
    // } else {
    //   deleteRef(_anonymousUser);
    //   deleteRef(_anonymousDeviceRef);
    // }
  }

  Future<bool> deleteRef(CollectionReference ref) async {
    bool delete = false;
    // if (ref != null) {
    //   try {
    //     await ref.set(null);
    //     delete = true;
    //   } catch (ex) {
    //     delete = false;
    //   }
    // }
    return delete;
  }

  Future<bool> userStamp() => Future.value(true);
//      updateRef(_table.collection.doc(appCon.uid), {'timestamp': timeStamp});

  Map<String, dynamic> _addUserData() {
    //
    final _data = <String, dynamic>{
      // 'email': appCon.email,
      // 'name': appCon.name,
      // 'provider': appCon.provider,
      // 'isAnonymous': appCon.isAnonymous,
      // 'photo': appCon.photo,
      // 'tokenId': appCon.tokenId,
      // 'timestamp': timeStamp,
    };

    /// Update and insert if not there.
    update(_data, insert: true);

    return _data;
  }
}

class UserDevices with FirebaseOperations {
  factory UserDevices() => _this ??= UserDevices._();
  UserDevices._() {
    _table = FireStoreCollection('devices');
  }
  static UserDevices? _this;

  // Map<String, dynamic> _addUserData() {
  //   //
  //   final id = appCon.uid;
  //   final _data = {App.installNum: timeStamp};
  //
  //   _table.collection.doc(id).set(_data);
  //
  //   return _data;
  // }
}

mixin FirebaseOperations {
  //
  late FireStoreCollection _table;
  final appCon = AppController();
  late DocumentReference _reference;
  late Map<String, dynamic> _data;

  Future<bool> initAsync() async {
    bool init;
    try {
      await _collectUserData();
      init = true;
    } catch (ex) {
      init = false;
    }
    return init;
  }

  Future<void> _collectUserData() async {
    //
    // String id = appCon.uid;
    //
    // if (id == null || id.trim().isEmpty) {
    //   id = null;
    // } else {
    //   id = id.trim();
    // }
    //
    // if (id != null) {
    //   //
    //   final DocumentSnapshot snapshot = await _table.collection?.doc(id)?.get();
    //
    //   _reference = snapshot.reference;
    //
    //   if (snapshot != null && snapshot.exists) {
    //     _data = snapshot.data();
    //   } else {
    //     _data = {};
    //   }
    // }
  }

  // Set the timeStamp this program was last run.
  int get timeStamp => DateTime.now().millisecondsSinceEpoch ~/ 1000;

  /// Update an existing record or create a new one if indicated.
  Future<bool> update(Map<String, dynamic> data, {bool insert = false}) =>
      updateRef(_reference, data, insert: insert);

  /// Update an existing record or create a new one.
  Future<bool> set(Map<String, dynamic> data) =>
      updateRef(_reference, data, insert: true);

  /// Update or insert data by the specified reference.
  Future<bool> updateRef(DocumentReference ref, Map<String, dynamic> data,
      {bool insert = false}) async {
    bool update = false;

    final DocumentSnapshot snapshot = await ref.get();

    if (snapshot.exists) {
      /// Update an existing document.
      await ref.update(data);
      update = true;
    } else {
      if (insert) {
        try {
          /// Attempt to create the document instead.
          await ref.set(data);
          update = true;
        } catch (ex) {
          update = false;
          appCon.getError(ex);
        }
      }
    }
    return update;
  }
}
