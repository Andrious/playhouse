// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:playhouse/src/model.dart';

import 'testing_database.dart';

final _db = DatabaseTest();

void module2SoilAndGradingAssessment() {
  //
  final DocumentReference modRef =
      FireStoreCollection('Modules').collection!.doc();

  _db.createModule(
    modRef,
    name: 'Module 3: Soil and Grading Assessment',
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  surfaceAndSoilIdentification(modRef);
  grading(modRef);
}

void surfaceAndSoilIdentification(DocumentReference modRef) {
  //
  final DocumentReference doc =
      FireStoreCollection('${modRef.path}/Submodules').collection!.doc();

  _db.createSubmodule(
    doc,
    nextSubId: '',
    name: 'Submodule 3.1: Surface and Soil Identification',
    short: 'Surface and Soil Identification description.',
    long:
        'Surface and Soil Identification longer description with more detail.',
    locked: false,
    complete: false,
    keyArt: infoIcon,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  final table = FireStoreCollection('${doc.path}/Tasks').collection;

  _db.createTask(
    table!.doc(),
    name: 'Task 3.1.1',
    short: 'Locate five different ground surfaces.',
    long:
        'For this task, please explore your local area or neighborhood and locate five different types of ground surfaces (sand, soil, rock, etc.). Document your findings using photographs or sketches and collect a small sample of each surface. Please also label the name of the surface, describe where it is was located, and what it was used for. This task is meant to expose you to multiple types of ground surfaces out there and how they are applied in design and construction.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 3.1.2',
    short: 'Describe the soil.',
    long:
        'For this task, please begin to research and briefly describe the characteristics of the following soil types in two or three sentences: clay, sandy, silty, peaty, chalky and loamy. This research will help familiarize you with the most common types of soils that are found and how they are different from one another.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 3.1.3',
    short: 'Dig a hole.',
    long:
        'For this task, you will select a specific site. On this site, you will dig a small hole and remove the intact soil. Document your process using photos and sketches and identify the following soil layers in your sample: organic layer, top soil layer, and sub soil layer. Please label each layer and its thickness using a measuring tape. This soil test will highlight the few basic layers that make up a typical soil profile. When designing structure, locating and identifying the multiple layers of the soil is critical in determining your foundation type.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}

void grading(DocumentReference modRef) {
  //
  final DocumentReference doc =
      FireStoreCollection('${modRef.path}/Submodules').collection!.doc();

  _db.createSubmodule(
    doc,
    nextSubId: '',
    name: 'Submodule 3.2: Grading',
    short: 'Grading description.',
    long: 'Grading longer description with more detail.',
    locked: false,
    complete: false,
    keyArt: infoIcon,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  final table = FireStoreCollection('${doc.path}/Tasks').collection;

  _db.createTask(
    table!.doc(),
    name: 'Task 3.2.1',
    short: "Identify a site's grading",
    long:
        'For this task, please select a specific site or area and begin to walk around within. Identify which areas within the site where you think the ground is higher and where you think the ground is lower. Document this process by taking photos of the higher and lower areas of the site.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 3.2.2',
    short: 'Measure the grading',
    long:
        'For this task, you will return to your site and you will begin to measure the slopes within. You can use a measuring tape and a level to help you out. Start at the highest point of your site and being to measure down using the level to create a flat and even surface and the measuring tape to measure the difference at the low end. Repeat this process throughout the site until you have a general understanding of how high and low your areas are.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 3.2.3',
    short: 'Find the contour lines',
    long:
        'For this task, please begin by researching what contour lines are. Next, you can either print off a map of your chosen site or create a digital version. Begin to roughly draw the contour lines over top your site map based on your previous research. Please use whatever measuring system you think works best. Label the height of each contour line. This task will help you gain a better understanding of how slope and drainage works on a site.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}
