// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class QuestionTask extends TaskCard {
  QuestionTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'questionMark',
        );
}

class ABCTask extends TaskCard {
  ABCTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'abc',
        );
}

class ARTask extends TaskCard {
  ARTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'AR',
        );
}

class PencilTask extends TaskCard {
  PencilTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'pencil',
        );
}

class PictureTask extends TaskCard {
  PictureTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'picture',
        );

  @override
  Future<void> onTap() async {
    await image.pickImage();
  }
}

class MovieCameraTask extends TaskCard {
  MovieCameraTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'movieCamera',
        );
}

class QuestionTask02 extends TaskCard {
  QuestionTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'questionMark',
        );
}

class ABCTask02 extends TaskCard {
  ABCTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'abc',
        );
}

class ARTask02 extends TaskCard {
  ARTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'AR',
        );
}

class PencilTask02 extends TaskCard {
  PencilTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'pencil',
        );
}

class PictureTask02 extends TaskCard {
  PictureTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'picture',
        );

  @override
  Future<void> onTap() async {
    await image.pickImage();
  }
}

class MovieCameraTask02 extends TaskCard {
  MovieCameraTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'movieCamera',
        );

  @override
  void onTap() {}

  @override
  void onTapInfo() {}
}
