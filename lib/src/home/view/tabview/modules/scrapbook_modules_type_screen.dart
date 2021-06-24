// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:auto_size_text/auto_size_text.dart';

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The event handling code
import 'package:playhouse/src/controller.dart';

class ScrapbookDesignScreen extends ModuleTypeScreen {
  const ScrapbookDesignScreen({Key key}) : super(key: key);
}

class ScrapbookBuildScreen extends ModuleTypeScreen {
  const ScrapbookBuildScreen({Key key}) : super(key: key);
}

/// List of Modules
/// e.g. 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
class ModuleTypeScreen extends StatefulWidget {
  const ModuleTypeScreen({Key key}) : super(key: key);

  @override
  State createState() => ModuleTypeScreenState();
}

class ModuleTypeScreenState extends StateMVC<ModuleTypeScreen>
    with SingleTickerProviderStateMixin {
  ModuleTypeScreenState() : super(ScrapBookController()) {
    _con = controller;
  }

  ModulesAppBar _sbModAppBar;
  ScrapBookController get con => _con;
  ScrapBookController _con;

  @override
  void initState() {
    super.initState();
    con.inBuildScreen = widget is ScrapbookBuildScreen;
    _sbModAppBar = ModulesAppBar(this);
    // Set up this appbar's data
    _sbModAppBar.initState();
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    _sbModAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: _sbModAppBar.appBar,
      body: SafeArea(
        child: TabBarView(
          controller: _sbModAppBar.controller,
          children: _sbModAppBar.children,
        ),
      ));
}

/// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
class ModulesAppBar {
  //
  ModulesAppBar(this.provider) {
    // Supply the Controller.
    _con = provider.con;
  }
  final ModuleTypeScreenState provider;
  ScrapBookController _con;

  /// Set up the AppBar
  void initState() {
    //
    final recs = _con.initModules(_con.moduleType);

    final initIndex = Prefs.getInt('${_con.moduleType}ModulesIndex');

    _tabController = TabController(
      initialIndex: initIndex,
//      length: ModuleFields().table.list.length,
      length: recs.length,
      vsync: provider,
    );

    // _tabController must be defined first.
    if (recs.isNotEmpty) {
      _con.module = recs[initIndex];
    }

    _tabController.addListener(() {
      /// Record the 'last' tab visited.
      Prefs.setInt('${_con.moduleType}ModulesIndex', _tabController.index);

      final items = _con.model.modules.items;

      if (items.isNotEmpty) {
        _con.module = items[_tabController.index];
      }

      provider?.setState(() {});
    });

    //
    _con.inBuildScreen = provider.widget is ScrapbookBuildScreen;

    _children = [];

    for (final module in recs) {
      //
      _children.add(const SubmodulesScreen());
    }
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;
  TabController _tabController;

  List<Tab> get tabs {
    //
    final List<Tab> _tabs = [];

    var index = -1;

    for (final module in _con.modules) {
      //
      index++;

      // _tabs.add(Tab(
      //   child: AutoSizeText(
      //     I10n.s(module['name']),
      //     style: TextStyle(
      //       fontWeight: _tabController.index == index
      //           ? FontWeight.w700
      //           : FontWeight.w400,
      //     ),
      //     softWrap: false,
      //     overflow: TextOverflow.visible,
      //   ),
      // ));

      _tabs.add(Tab(
        child: I10n.t(
          module['name'],
          style: TextStyle(
            fontWeight: _tabController.index == index
                ? FontWeight.w700
                : FontWeight.w400,
          ),
        ),
      ));
    }
    return _tabs;
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
          isScrollable: true,
          tabs: tabs,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      );
}
