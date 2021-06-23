// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class QuestionTask extends TaskCard {
  QuestionTask(Map<String, dynamic> task, Map<String, dynamic> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'questionMark',
        );
}

class ABCTask extends TaskCard {
  ABCTask(Map<String, dynamic> task, Map<String, dynamic> userTask, {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'abc',
        );
}

class ARTask extends TaskCard {
  ARTask(Map<String, dynamic> task, Map<String, dynamic> userTask, {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'AR',
        );

  @override
  Future<void> onTap() async {
    await con.openFullScreenRoute(const SimpleUnityScreen());
  }
}

class PencilTask extends TaskCard {
  PencilTask(Map<String, dynamic> task, Map<String, dynamic> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'pencil',
        );
}

class PictureTask extends TaskCard {
  PictureTask(Map<String, dynamic> task, Map<String, dynamic> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'picture',
        );

  @override
  Future<void> onTap() => image.pickImage();
}

class MovieCameraTask extends TaskCard {
  MovieCameraTask(Map<String, dynamic> task, Map<String, dynamic> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'movieCamera',
        );
}
