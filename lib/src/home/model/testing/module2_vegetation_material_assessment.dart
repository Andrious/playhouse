// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:playhouse/src/model.dart';

import 'testing_database.dart';

final _db = DatabaseTest();

void module2VegetationAndMaterialsAssessment() {
//
  final DocumentReference modRef =
      FireStoreCollection('Modules').collection!.doc();

  _db.createModule(
    modRef,
    name: 'Module 2: Vegetation & Materials Assessment',
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  identifyingVegetation(modRef);
  materialSelection(modRef);
}

void identifyingVegetation(DocumentReference modRef) {
  //
  final DocumentReference doc =
      FireStoreCollection('${modRef.path}/Submodules').collection!.doc();

  _db.createSubmodule(
    doc,
    nextSubId: '',
    name: 'Submodule 2.1: Identifying Vegetation',
    short: 'Identifying Vegetation description.',
    long: 'Identifying Vegetation longer description with more detail.',
    locked: false,
    complete: false,
    keyArt: infoIcon,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  final table = FireStoreCollection('${doc.path}/Tasks').collection;

  _db.createTask(
    table!.doc(),
    name: 'Task 2.1.1',
    short: 'Identify five plants, five shrubs, and five trees.',
    long:
        'For this first task, we will get you to identify five local plant species, five local shrub species, and five local tree species found within your local region. Please use either online or printed sources to help with your research. Once you’ve identified your local vegetation species, please list the name of that species (Bur Oak), the vegetation type (Tree), and include a photograph or sketch of the species.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 2.1.2',
    short: 'Provide more information for each species you’ve identified.',
    long:
        'Once you have completed your initial list of 15 local vegetation species, you will now begin to provide a bit more detail. Please provide the following information for each species you’ve identified: Hardiness Zone, Mature Size, Sun Preference, and Soil Preference. Please use either online or printed sources for your research. This information will help you understand why certain species grow in certain areas and what factors influence their growth.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 2.1.3',
    short: 'Now explore your yard.',
    long:
        'Now, you will explore your yard or local area and document all the various types of vegetation species you see. Using your previous research, begin to create a list and use a combination of photography, sketching, and text to provide the following information: an image, species name, species type, where it was located, hardiness zone, mature size, sun preference and soil preference. This task will teach you how to effectively identify and use your previous research information to understand the local vegetation found within your area.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}

void materialSelection(DocumentReference modRef) {
  //
  final DocumentReference doc =
      FireStoreCollection('${modRef.path}/Submodules').collection!.doc();

  _db.createSubmodule(
    doc,
    nextSubId: '',
    name: 'Submodule 2.2: Material Selection',
    short: 'Material Selection description.',
    long: 'Material Selection longer description with more detail.',
    locked: false,
    complete: false,
    keyArt: infoIcon,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  final table = FireStoreCollection('${doc.path}/Tasks').collection;

  _db.createTask(
    table!.doc(),
    name: 'Task 2.2.1',
    short: 'Explore a single site',
    long:
        'For this first task, you will choose a single site or area to explore. Once your site is chosen, please begin to photograph or sketch five different construction materials. These construction materials can be whatever you see (a deck made out of wood, or a brick sidewalk, or the stucco siding of a house). When taking a photograph or sketching your material, please also include the pattern of the material. Once your photos or sketches are completed, you will also label the image with the name of the material and application of the material. For example, material type = wood, material application = exterior deck.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 2.2.2',
    short: 'Document the natural materials found.',
    long:
        'For this task, go back to your chosen site and document the natural materials found within or around the area. These natural materials can exist in the form of trees, shrubs, plants, rocks, soil, sand, etc. Please photograph or sketch each individual natural material and begin to compile a list that includes a photo or sketch image, name of material and where it was found.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 2.2.3',
    short: 'Compare your material lists.',
    long:
        'For this task, you will use both of your construction and natural material lists to compare if the construction materials found are similar or different than the existing natural materials found. The point of this exercise is to question where we are getting are materials from. Please compare your two material lists and discover potential matches, and if none exist, please substitute the construction material with a local, natural material instead.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}
