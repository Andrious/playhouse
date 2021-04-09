// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class QuestionTask extends TaskCard {
  QuestionTask({Key key})
      : super(
    key: key,
    name: 'questionMark',
  );
}

class ABCTask extends TaskCard {
  ABCTask({Key key})
      : super(
    key: key,
    name: 'abc',
  );
}

class ARTask extends TaskCard {
  ARTask({Key key})
      : super(
    key: key,
    name: 'AR',
  );
}

class PencilTask extends TaskCard {
  PencilTask({Key key})
      : super(
    key: key,
    name: 'pencil',
  );
}

class PictureTask extends TaskCard {
  PictureTask({Key key})
      :
        super(
        key: key,
        name: 'picture',
      );

  @override
  Future<void> onTap() async {
    await image.pickImage();
  }
}

class MovieCameraTask extends TaskCard {
  MovieCameraTask({Key key})
      : super(
    key: key,
    name: 'movieCamera',
  );
}

class QuestionTask02 extends TaskCard {
  QuestionTask02({Key key})
      : super(
    key: key,
    name: 'questionMark',
  );
}

class ABCTask02 extends TaskCard {
  ABCTask02({Key key})
      : super(
    key: key,
    name: 'abc',
  );
}

class ARTask02 extends TaskCard {
  ARTask02({Key key})
      : super(
    key: key,
    name: 'AR',
  );
}

class PencilTask02 extends TaskCard {
  PencilTask02({Key key})
      : super(
    key: key,
    name: 'pencil',
  );
}

class PictureTask02 extends TaskCard {
  PictureTask02({Key key})
      : super(
        key: key,
        name: 'picture',
      );

  @override
  Future<void> onTap() async {
    await image.pickImage();
  }
}

class MovieCameraTask02 extends TaskCard {
  MovieCameraTask02({Key key})
      : super(
    key: key,
    name: 'movieCamera',
  );

  @override
  void onTap() {}

  @override
  void onTapInfo() {}
}
