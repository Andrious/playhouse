// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:playhouse/src/model.dart';

import 'testing_database.dart';

final _db = DatabaseTest();

///
void module1SunAndShadow() {
  //
  final DocumentReference modRef =
      FireStoreCollection('Modules').collection!.doc();

  _db.createModule(
    modRef,
    name: 'Module 1: Sun and Shadow Assessment',
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  sunExposure(modRef);
  shadowStudies(modRef);
  solarPathTasks(modRef);
}

///
void sunExposure(DocumentReference modRef) {
  final DocumentReference doc =
      FireStoreCollection('${modRef.path}/Submodules').collection!.doc();

  _db.createSubmodule(
    doc,
    nextSubId: '',
    name: 'Sub Module 1.1: Sun Exposure',
    short: 'Sun Exposure description.',
    long: 'Sun Exposure longer description with more detail.',
    locked: false,
    complete: false,
    keyArt: infoIcon,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  final table = FireStoreCollection('${doc.path}/Tasks').collection;

  _db.createTask(
    table!.doc(),
    name: 'Task 1.1.1',
    short: 'Visit a site three times a day.',
    long:
        'Choose a site within your local neighborhood or area. Walk to your site three times a day. Once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Document what you see and feel during each visit using text, sketching, photography, and/or video. Are there lots of people or animals? Are there trees or no trees? Is it cold or warm?',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 1.1.2',
    short: 'Describe sunshine changes at your site.',
    long:
        'Choose a site within your local neighborhood or area. On a sunny day, walk to your site once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Describe how the sunshine changes and impacts your site based on each visit. On a cloudy day, please do the exact same thing and describe any differences you notice between the sunny and cloudy days during each visit. Use either text, sketch, photography, and/or video.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 1.1.3',
    short: 'Visit a site every 30 minutes for 3-Hours',
    long:
        'Over a 3-hour time span during the day, go outside and while in the same position, locate the sun in the sky. Document its location either through photography, video, or sketch. Label the time of day and repeat every 30 minutes for 3-Hours. Summarize what you noticed about the suns positioning throughout the time span. Were you able to see it at all times or was it hidden?',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}

///
void shadowStudies(DocumentReference modRef) {
  final DocumentReference doc =
      FireStoreCollection('${modRef.path}/Submodules').collection!.doc();

  _db.createSubmodule(
    doc,
    nextSubId: '',
    name: 'Sub Module 1.2: Shadow Studies',
    short: 'Shadow Studies description.',
    long: 'Shadow Studies longer description with more detail.',
    locked: false,
    complete: false,
    keyArt: infoIcon,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  final table = FireStoreCollection('${doc.path}/Tasks').collection;

  _db.createTask(
    table!.doc(),
    name: 'Task 1.2.1',
    short: 'Make Shadows',
    long:
        'In your home, please select a small object. Place that object on a flat and clean surface, either a table or floor will work. Next, grab a portable light source, such as a lamp, and direct the light onto your object. Please take five photographs of your object from multiple views and capture the shadow that is produced. Repeat this process four more times, with the lamp being placed in a different spot each time. Describe what you saw and what surprised you. How long was your shadow? Were you able to make any cool shapes?',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 1.2.2',
    short: 'Describe Shadows',
    long:
        'Now that we understand how shadow can be manipulated in a controlled environment, we are going to see how a shadow changes in a natural environment with the sunlight being our light source. Please take a large sheet of paper (12”x16” or above) and place the sheet of paper on the ground in a spot that gets a lot of sunlight. Place an object on the centre of the sheet near the bottom side. Please mark the top of the shadow with a pencil or pen and label the time and repeat this for every 30 minutes for 3 hours. Document with photos and describe what you noticed. Did the shadow shift a lot more than you thought?',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 1.2.3',
    short: 'Compare Shadows',
    long:
        'For this step, we are going to create a simple box model using whatever materials you have and make a series of openings on one face/side of the box. Next, we will take photos of the different shadows being casted within a controlled environment (lamp source inside) and an uncontrolled environment (sunlight outside). Please take eight photographs from different angles for each environment and compare the shadows. Create another model and repeat this process again with different openings to create different shadows. What did you notice about how the shadows changed as you switched from inside to outside? This will teach us what causes a shadow, and how to changes based on the light source. We can begin to manipulate and create certain s¬hadows within our design.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}

///
void solarPathTasks(DocumentReference modRef) {
  final DocumentReference doc =
      FireStoreCollection('${modRef.path}/Submodules').collection!.doc();

  _db.createSubmodule(
    doc,
    nextSubId: '',
    name: 'Sub Module 1.3: Solar Path',
    short: 'Solar Path description.',
    long: 'Solar Path longer description with more detail.',
    locked: false,
    complete: false,
    keyArt: infoIcon,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  final table = FireStoreCollection('${doc.path}/Tasks').collection;

  _db.createTask(
    table!.doc(),
    name: 'Task 1.3.1',
    short: 'Understanding the solar path',
    long:
        'Understanding the solar path is critical to designing and building a sustainable and energy efficient home or structure. Using whatever resources available to you, please familiarize yourself with the terms: Horizon, Zenith, Azimuth, and Altitude. Please enter and submit a one sentence description of what each term means.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 1.3.2',
    short: 'Create a sun path diagram',
    long:
        'Create a sun path diagram for your local area based on the four seasons. Please map out the hourly solar path from sunrise to sunset for each of the following days: March 21, June 21, September 21, and December 21. Feel free to use pencil and paper or phone/tablet/computer to complete this task. This diagram once complete, will show you the suns position in the sky through the entire days listed above.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );

  _db.createTask(
    table.doc(),
    name: 'Task 1.3.3',
    short: 'Create an elevation drawing/sketch',
    long:
        'Please use your sun path diagram and create an elevation drawing/sketch. Please include a horizon line with a box on the centre point. Pleas mark the highest altitude point for each of the four days that you mapped out, and also label the degree of the solar altitude and the time of each day. Feel free to use a pen and paper or phone/tablet/computer to complete this drawing. Once complete, you will be able to draw the angle of the sun at its highest point and determine which part of your box is exposed to direct sunlight at that specific time labeled.',
    type: 'DeviceImage',
    keyArt: rocket,
    timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
}
