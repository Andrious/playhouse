// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

///todo: place this as an export in dbUtil's FireStoreDB
///todo:  _ex = ex as Exception in dbUtils in a try-catch
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/controller.dart' show Auth;

class PlayhouseDB {
  factory PlayhouseDB() => _this ??= PlayhouseDB._();

  PlayhouseDB._()
      : _auth = Auth(),
        model = AppModel();
  static PlayhouseDB _this;

  //
  FireStoreCollection db;
  final AppModel model;
  final Auth _auth;

  Future<bool> downloadDB() {
    final table = FireStoreCollection('Modules');

    return _populateData(table.collection, 'Modules, Submodules, Tasks');
  }

  Future<bool> _populateData(
    CollectionReference collectionRef,
    String collections,
  ) async {
    //
    bool populated = true;

    if (collections == null || collections.isEmpty) {
      return populated;
    }

    /// Convert to a list
    final list = collections.split(',');

    // Determine the collection to process now.
    String collection;

    // If there's just one collection name in the String.
    if (list.isEmpty || list[0].isEmpty) {
      collection = collections.trim();
    } else {
      // Grab the fist element in the list.
      collection = list.first.trim();
      // Remove the first element from the list.
      list.removeAt(0);
    }

    // Return the list to a String
    if (list.isEmpty) {
      collections = '';
    } else if (list.length > 1) {
      collections = list.join(',');
    } else {
      collections = list[0];
    }

    final QuerySnapshot querySnapshot = await collectionRef.get();

    //
    for (final doc in querySnapshot.docs) {
      //
      final Map<String, dynamic> data = doc.data();

      // It may not have a userId yet.
      if (data['userId'] == null) {
        // Each record of course is associated with a particular user.
        data['userId'] = _auth.uid;
      }

      // Each record has a primary key.
      data['firebaseId'] = doc.id;

      switch (collection) {
        case 'Modules':
          model.populateModule(data);

          break;

        case 'Submodules':
          // Note the parent's primary key
          data['moduleId'] = collectionRef.parent.id;

          model.populateSubmodule(data);

          break;

        case 'Tasks':
          // Note the parent's primary key
          data['submoduleId'] = collectionRef.parent.id;

          model.populateTask(data);
          break;

        default:
          // Unknown 'collection' name??
          return populated;
      }

      // Recursive call to the 'next' collection.
      if (collections.isNotEmpty) {
        populated = await _populateData(
            doc.reference.collection(list[0].trim()), collections);
      }
    }
    return populated;
  }
}
