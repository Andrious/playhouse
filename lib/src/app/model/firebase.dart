// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dbutils/firebase_db.dart' as f;
import 'package:flutter/widgets.dart' show AppLifecycleState;

import 'package:playhouse/src/model.dart';
import 'package:playhouse/src/controller.dart' show App, AppController;

class Firebase {
  factory Firebase() => _this ??= Firebase._();
  Firebase._() : auth = FirebaseAuth.instance;
  static Firebase _this;

  final FirebaseAuth auth;
  DatabaseReference _reference;

  DatabaseReference get userRef => databaseReference('users');

  DatabaseReference databaseReference(String path) {
//
    if (path == null || path.trim().isEmpty) {
      path = '';
    } else {
      path = path.trim();
    }

    // infinite loop if instantiated in constructor.
    String id = AppController().uid;

    if (id == null || id.trim().isEmpty) {
      id = null;
    } else {
      id = id.trim();
    }
    DatabaseReference ref;

    if (path.isEmpty) {
      ref = reference().child('dummy');
    } else if (id == null) {
      // Important to provide a reference that is not likely there in case called by deletion routine.
      ref = reference().child(path).child('dummy');
    } else {
      ref = reference().child(path).child(id);
    }
    return ref;
  }

  DatabaseReference reference() => _reference;
  DatabaseReference _anonymousUser;
  DatabaseReference get yourDeviceRef => yourDevicesRef.child(App.installNum);
  DatabaseReference _anonymousDeviceRef;

  DatabaseReference get yourDevicesRef => databaseReference('devices');

  void removeAnonymous() {
    if (_anonymousUser == null) {
      _anonymousUser = userRef;
      _anonymousDeviceRef = yourDevicesRef;
    } else {
      deleteRef(_anonymousUser);
      deleteRef(_anonymousDeviceRef);
    }
  }

  Future<bool> deleteRef(DatabaseReference ref) async {
    bool delete = false;
    if (ref != null) {
      try {
        await ref.set(null);
        delete = true;
      } catch (ex) {
        delete = false;
      }
    }
    return delete;
  }

  bool userStamp() {
    bool stamp = true;
    final con = AppController();
    try {
      final DatabaseReference dbRef = userRef.child('profile');
      dbRef.child('name').set(con.name);
      dbRef.child('isAnonymous').set(con.isAnonymous);
      dbRef.child('provider').set(con.provider);
      dbRef.child('new user').set(con.isNewUser);
      dbRef.child('photo').set(con.photo);
    } catch (ex) {
      stamp = false;
      con.getError(ex);
    }
    return stamp;
  }
}
