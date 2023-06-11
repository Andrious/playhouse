// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

TaskCard pictureTasks(
  Map<String, dynamic> task,
  List<Map<String, dynamic>> userTask,
) {
  //
  TaskCard card;

  final con = ScrapBookController();

  final name = task['name'];

  switch (name) {
    case 'Task 1.1.4':
      card = PictureTask(
        task,
        userTask,
        pickImage: con.moduleType == 'Design',
      );
      break;
    default:
      card = PictureTask(task, userTask);
  }
  return card;
}

StatefulWidget pictureTaskScreens(PanelScreenState penal) {
  //
  StatefulWidget? widget;

  final con = ScrapBookController();

  final name = con.card!.task['name'];

  switch (name) {
    case 'Task 1.1.10':
      widget = ThreePicturesScreen(penal);
      break;
  }

  return widget ??= const EmptyPanel();
}
