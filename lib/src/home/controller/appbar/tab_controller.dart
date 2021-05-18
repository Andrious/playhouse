// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

// class SubTabController extends GITabController {
//   SubTabController({
//     int initialIndex = 0,
//     @required int length,
//     @required TickerProvider vsync,
//     StateMVC state,
//   }) : super(
//           initialIndex: initialIndex,
//           length: length,
//           vsync: vsync,
//           state: state,
//         );
// }
//
// class GITabController extends TabController {
//   GITabController({
//     int initialIndex = 0,
//     @required int length,
//     @required TickerProvider vsync,
//     StateMVC state,
//   })  : con = _TabController(state),
//         super(
//           initialIndex: initialIndex,
//           length: length,
//           vsync: vsync,
//         );
//   final _TabController con;
//
//   GreyIvyTabBar get tabBar => _tabBar;
//   set tabBar(GreyIvyTabBar tabBar) {
//     if (tabBar != null) {
//       _tabBar = tabBar;
//     }
//   }
//
//   GreyIvyTabBar _tabBar;
// }
//
// class _TabController extends ControllerMVC {
//   _TabController([StateMVC state]) : super(state);
// }
