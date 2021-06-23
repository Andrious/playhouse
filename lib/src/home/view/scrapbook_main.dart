// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The event handling code
import 'package:playhouse/src/controller.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// Design | Build
class ScrapBookApp extends StatefulWidget {
  const ScrapBookApp({Key key}) : super(key: key);
  @override
  State createState() => ScrapBookState();
}

class ScrapBookState extends StateMVC<ScrapBookApp>
    with SingleTickerProviderStateMixin {
  ScrapBookState() : super(ScrapBookController()) {
    con = controller;
  }

  DesignBuildAppBar _sbAppBar;
  ScrapBookController con;

  @override
  void initState() {
    super.initState();
    _sbAppBar = DesignBuildAppBar(this);
  }

  @override
  void dispose() {
    _sbAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: _sbAppBar.appBar,
        endDrawer: const ScrapBookDrawer(),
        primary: false,
        body: TabBarView(
          controller: _sbAppBar.controller,
          children: const <Widget>[
            ScrapbookDesignScreen(),
            ScrapbookBuildScreen(),
          ],
        ));
  }
}

///  Design | Build
class DesignBuildAppBar {
  //
  DesignBuildAppBar(this._provider) {
    //
    // Supply the Controller.
    _con = _provider.con;

    final initIndex = _con.initialIndex;

    _tabController = TabController(
      // GITabController(
      initialIndex: initIndex,
      length: 2,
      vsync: _provider,
//      state: _provider,
    );

    _tabs = _onTabs();

    _con.moduleType = _con.tabLabel(tabs[initIndex]);

    _tabController.addListener(() {
      Prefs.setInt('DesignBuildIndex', _tabController.index);
      _provider?.setState(() {});
      _con.moduleType = _con.tabLabel(tabs[_tabController.index]);
    });

    _appBar = _onAppBar();
  }
  final ScrapBookState _provider;
  ScrapBookController _con;

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;
  TabController _tabController;

  /// The Main Appbar's list of tabs.
  List<Tab> get tabs => _tabs;
  List<Tab> _tabs;

  /// The App Tool bar
  AppBar get appBar => _appBar;
  AppBar _appBar;

  AppBar _onAppBar() => AppBar(
        title: I10n.t('Playhouse'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        toolbarHeight: 100,
        bottom: TabBar(
          tabs: _onTabs(),
          controller: _tabController,
        ),
      );

  List<Tab> _onTabs() => [
        Tab(
          child: I10n.t(
            'Design',
            style: TextStyle(
              fontWeight:
                  _tabController.index == 0 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
        Tab(
          child: I10n.t(
            'Build',
            style: TextStyle(
              fontWeight:
                  _tabController.index == 1 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
      ];
}
