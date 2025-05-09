// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

///
export 'package:fluttery_framework/controller.dart' hide AppController, runApp;

/// The Controller for the App itself
export 'package:playhouse/src/app/controller/app_controller.dart';

/// The Controller for this Home screen
export 'package:playhouse/src/home/controller/scrapbook_controller.dart';

/// Different Tasks grouped by category
export 'package:playhouse/src/home/controller/tasks/question_tasks.dart';
export 'package:playhouse/src/home/controller/tasks/picture_tasks.dart';
export 'package:playhouse/src/home/controller/tasks/abc_tasks.dart';
export 'package:playhouse/src/home/controller/tasks/ar_tasks.dart';
export 'package:playhouse/src/home/controller/tasks/pencil_tasks.dart';
export 'package:playhouse/src/home/controller/tasks/movie_tasks.dart';

/// The Tasks for the Home screen
export 'package:playhouse/src/home/controller/pick_image.dart';

/// The image picker
export 'package:playhouse/src/home/controller/image_picker.dart';

/// Controls the Authentication into the App
export 'package:playhouse/src/app/controller/initAsync/playhouse_signin.dart';

/// Tab Controller for the App
export 'package:playhouse/src/home/controller/appbar/tab_controller.dart';
