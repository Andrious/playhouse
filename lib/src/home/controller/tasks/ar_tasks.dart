// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

///
TaskCard arTasks(
  Map<String, dynamic> task,
  List<Map<String, dynamic>> userTask,
) {
  //
  TaskCard card;

  final con = ScrapBookController();

  final name = task['name'];

  switch (name) {
    case 'Task 1.1.3':
      card = ARUnityTask(task, userTask);
      break;
    default:
      card = ARTask(task, userTask);
  }
  return card;
}

///
StatefulWidget arTaskScreens(PanelScreenState penal) {
  //
  StatefulWidget widget;

  final con = ScrapBookController();

  final name = con.card!.task['name'];

  switch (name) {
    case 'Task 1.1.9':
      widget = const SimpleUnityScreen(inScreen: true);
      break;
    default:
      widget = const EmptyPanel();
  }
  return widget;
}
