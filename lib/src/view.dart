// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


/// MVC framework
export 'package:mvc_application/view.dart' hide AppMenu, runApp;

/// https://pub.dev/packages/cached_network_image/
export 'package:cached_network_image/cached_network_image.dart';

/// The App's Menu
export 'package:playhouse/src/app/view/menu/app_menu.dart';

/// App's SignIn Routine
export 'package:playhouse/src/app/view/signin_screen.dart';

/// Scrapbook main screen
export 'package:playhouse/src/home/view/scrapbook_main.dart'; //  hide ScrapBookApp

/// AppBars
export 'package:playhouse/src/home/view/appbar/design_build_appbar.dart';

export 'package:playhouse/src/home/view/appbar/modules_appbar.dart';

export 'package:playhouse/src/home/view/appbar/submodules_appbar.dart';

export 'package:playhouse/src/home/view/appbar/taskstate_appbar.dart';

/// Scrapbook Drawer
export 'package:playhouse/src/home/view/drawer/scrapbook_drawer.dart';

/// Scrapbook Design screen
export 'package:playhouse/src/home/view/tabview/modules/scrapbook_modules_design_screen.dart';

/// Scrapbook Build screen
export 'package:playhouse/src/home/view/tabview/modules/scrapbook_modules_build_screen.dart';

/// Scrapbook Submodules screen
export 'package:playhouse/src/home/view/tabview/submodule/scrapbook_submodules.dart';

/// Modules screen (Parent of the two screens above: Design & Build
export 'package:playhouse/src/home/view/tabview/modules/scrapbook_modules_type_screen.dart';

/// Individual Module screen
export 'package:playhouse/src/home/view/tabview/modules/scrapbook_module_screen.dart';

/// Individual Task screen
export 'package:playhouse/src/home/view/tabview/tasks/scrapbook_tasks.dart'; // hide Card;

/// 'State' of the Task (Favorite, Incomplete, etc.)
export 'package:playhouse/src/home/view/tabview/taskstate/task_state.dart'; // hide Card;
