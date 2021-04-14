// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event Handler code
import 'package:playhouse/src/controller.dart';

/// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
class ModulesAppBar {
  //
  ModulesAppBar(this.provider) {
    // Supply the Controller.
    _con = provider.con;
  }
  final ModuleTypeScreenState provider;
  ScrapBookController _con;
  TabController _tabController;

  /// Set up the AppBar
  void initState() {
    final initIndex = Prefs.getInt('${_con.moduleType}ModulesIndex');

    _tabController = GITabController(
      initialIndex: initIndex,
      length: 4,
      vsync: provider,
      state: provider,
    );

    _tabController.addListener(() {
      /// Record the 'last' tab visited.
      Prefs.setInt('${_con.moduleType}ModulesIndex', _tabController.index);
      _con.module = _con.tabLabel(tabs[_tabController.index]);
      provider?.setState(() {});
    });

    // _tabController must be defined first.
    _con.module = _con.tabLabel(tabs[initIndex]);
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;

  List<Tab> get tabs => [
        Tab(
          child: Text(
            'Inspiration',
            style: TextStyle(
              fontWeight:
                  _tabController.index == 0 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
        Tab(
          child: Text(
            'Site assessment',
            style: TextStyle(
              fontWeight:
                  _tabController.index == 1 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
        Tab(
          child: Text(
            'Floor Plan',
            style: TextStyle(
              fontWeight:
                  _tabController.index == 2 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
        Tab(
          child: Text(
            'Elevation',
            style: TextStyle(
              fontWeight:
                  _tabController.index == 3 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
      ];

  // List<Widget> get children => [
  //       ModuleScreen(tab: tabs[0]),
  //       ModuleScreen(tab: tabs[1]),
  //       ModuleScreen(tab: tabs[2]),
  //       ModuleScreen(tab: tabs[3]),
  //     ];

  List<Widget> get children => const [
        SubmodulesScreen(),
        SubmodulesScreen(),
        SubmodulesScreen(),
        SubmodulesScreen(),
      ];

  /// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
  AppBar get appBar => AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        toolbarHeight: 50,
//        primary: false,
        bottom: TabBar(
          tabs: tabs,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      );
}
