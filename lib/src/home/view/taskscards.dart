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

  @override
  void onTap() {
    con.cardNo = 0;
    super.onTap();
  }
}

class ABCTask extends TaskCard {
  ABCTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'abc',
        );

  @override
  void onTap() {
    con.cardNo = 1;
    super.onTap();
  }
}

class ARTask extends TaskCard {
  ARTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'AR',
        );

  @override
  Future<void> onTap() async {
    con.cardNo = 2;
    await con.openFullScreenRoute(const SimpleUnityScreen());
  }
}

class PencilTask extends TaskCard {
  PencilTask(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'pencil',
        );

  @override
  void onTap() {
    con.cardNo = 3;
    super.onTap();
  }
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
    con.cardNo = 4;
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

  @override
  void onTap() {
    con.cardNo = 5;
    super.onTap();
  }
}

class QuestionTask02 extends TaskCard {
  QuestionTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'questionMark',
        );

  @override
  void onTap() {
    con.cardNo = 6;
    super.onTap();
  }
}

class ABCTask02 extends TaskCard {
  ABCTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'abc',
        );

  @override
  void onTap() {
    con.cardNo = 7;
    super.onTap();
  }
}

class ARTask02 extends TaskCard {
  ARTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'AR',
        );

  @override
  void onTap() {
    con.cardNo = 8;
    super.onTap();
  }
}

class PencilTask02 extends TaskCard {
  PencilTask02(String submodule, {Key key})
      : super(
          key: key,
          submodule: submodule,
          name: 'pencil',
        );

  @override
  void onTap() {
    con.cardNo = 9;
    super.onTap();
  }
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
    con.cardNo = 10;
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
  void onTap() {
    con.cardNo = 11;
    super.onTap();
  }

  @override
  void onTapInfo() {}
}
