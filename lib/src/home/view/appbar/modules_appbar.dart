// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:auto_size_text/auto_size_text.dart';

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
    //
    final initIndex = Prefs.getInt('${_con.moduleType}ModulesIndex');

    _tabController = TabController(
      // GITabController(
      initialIndex: initIndex,
      length: _con.database ? ModuleFields().table.list.length : 4,
      vsync: provider,
//      state: provider,
    );

    // _tabController must be defined first.
    ///todo To be removed.
    if (_con.database) {
      _con.module = _con.model.modules.items[initIndex];
    } else {
      _con.moduleName = _con.tabLabel(tabs[initIndex]);
    }

    _tabController.addListener(() {
      /// Record the 'last' tab visited.
      Prefs.setInt('${_con.moduleType}ModulesIndex', _tabController.index);

      ///todo To be removed.
      if (_con.database) {
        _con.module = _con.model.modules.items[_tabController.index];
      } else {
        _con.moduleName = _con.tabLabel(tabs[_tabController.index]);
      }
      provider?.setState(() {});
    });
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;

  List<Tab> get tabs {
    var modules = <Tab>[];

    ///todo To be removed.
    if (_con.database) {
      _children = [];
      final table = ModuleFields().table;
      var index = -1;
      for (final module in table.list) {
        _children.add(const SubmodulesScreen());
        index++;
        modules.add(Tab(
          child: AutoSizeText(
            I10n.s(module['name']),
            style: TextStyle(
              fontWeight: _tabController.index == index
                  ? FontWeight.w700
                  : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ));
      }

      ///todo To be removed.
    } else {
      //
      _children = const [
        SubmodulesScreen(),
        SubmodulesScreen(),
        SubmodulesScreen(),
        SubmodulesScreen(),
      ];
      modules = [
        Tab(
          child: AutoSizeText(
            I10n.s('Inspiration'),
            style: TextStyle(
              fontWeight:
                  _tabController.index == 0 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
        Tab(
          child: AutoSizeText(
            I10n.s('Site Assessment'),
//            minFontSize: 6,
            style: TextStyle(
              fontWeight:
                  _tabController.index == 1 ? FontWeight.w700 : FontWeight.w400,
            ),
//            softWrap: false,
            wrapWords: true,
//            overflow: TextOverflow.visible,
          ),
        ),
        Tab(
          child: AutoSizeText(
            I10n.s('Floor Plan'),
            style: TextStyle(
              fontWeight:
                  _tabController.index == 2 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
        Tab(
          child: AutoSizeText(
            I10n.s('Elevation'),
            style: TextStyle(
              fontWeight:
                  _tabController.index == 3 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
      ];
    }
    return modules;
  }

  List<Widget> get children => _children;
  List<Widget> _children;

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
