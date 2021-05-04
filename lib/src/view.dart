// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// MVC framework
export 'package:mvc_application/view.dart' hide AppMenu, runApp;

/// https://pub.dev/packages/cached_network_image/
//export 'package:cached_network_image/cached_network_image.dart';

/// The App's Menu
export 'package:playhouse/src/app/view/menu/app_menu.dart';

/// App's SignIn Routine
export 'package:playhouse/src/app/view/signin_screen.dart';

/// Scrapbook main screen
export 'package:playhouse/src/home/view/scrapbook_main.dart';

/// AppBars
export 'package:playhouse/src/home/view/appbar/design_build_appbar.dart';
export 'package:playhouse/src/home/view/appbar/modules_appbar.dart';
export 'package:playhouse/src/home/view/appbar/submodules_appbar.dart';

/// Scrapbook Drawer
export 'package:playhouse/src/home/view/drawer/scrapbook_drawer.dart';

/// Grey & Ivy TabBar
export 'package:playhouse/src/home/view/tabview/tabbar/gi_tabbar.dart';

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

/// Individual Task Cards
export 'package:playhouse/src/home/view/taskscards.dart';

/// Current Tab Indicator
export 'package:playhouse/src/home/view/page_circle_indicator.dart';

/// Screens
export 'package:playhouse/src/home/view/screens/scrapbook_screens.dart';
export 'package:playhouse/src/home/view/screens/scrapbook_screens_widgets.dart';

/// Modules
export 'package:playhouse/src/home/view/screens/modules_list.dart';
export 'package:playhouse/src/home/view/screens/android/modules_android.dart';
export 'package:playhouse/src/home/view/screens/ios/modules_ios.dart';

/// Submodules
export 'package:playhouse/src/home/view/screens/submodules_list.dart';
export 'package:playhouse/src/home/view/screens/android/submodules_android.dart';
export 'package:playhouse/src/home/view/screens/ios/submodules_ios.dart';

/// Tasks
export 'package:playhouse/src/home/view/screens/tasks_list.dart';
export 'package:playhouse/src/home/view/screens/android/tasks_android.dart';
export 'package:playhouse/src/home/view/screens/ios/tasks_ios.dart';

/// Organizations
export 'package:playhouse/src/home/view/screens/organizations_list.dart';
export 'package:playhouse/src/home/view/screens/android/organizations_android.dart';
export 'package:playhouse/src/home/view/screens/ios/organizations_ios.dart';

/// Users
export 'package:playhouse/src/home/view/screens/users_list.dart';
export 'package:playhouse/src/home/view/screens/android/users_android.dart';
export 'package:playhouse/src/home/view/screens/ios/users_ios.dart';

/// SetState routine
export 'package:state_set/state_set.dart';
