// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event Handler code
import 'package:playhouse/src/controller.dart';

///  Design | Build
class DesignBuildAppBar {
  //
  DesignBuildAppBar(this._provider) {
    //
    // Supply the Controller.
    _con = _provider.con;

    _tabController = TabController( // GITabController(
      initialIndex: Prefs.getInt('DesignBuildIndex'),
      length: 2,
      vsync: _provider,
//      state: _provider,
    );

    _tabs = _onTabs();

    _con.moduleType = _con.tabLabel(tabs[_tabController.index]);

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

  TabController _tabController;
  TabController get controller => _tabController;

  /// The Main Appbar's list of tabs.
  List<Tab> get tabs => _tabs ??= _onTabs();
  List<Tab> _tabs;

  /// The App Tool bar
  AppBar get appBar => _onAppBar();
  AppBar _appBar;

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

  AppBar _onAppBar() => AppBar(
        title: I10n.t('Playhouse'),
        // actions: [
        //   /// Supply the App's popup menu. Pass in the screen's State object.
        //   AppMenu().show(_provider),
        // ],
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
}
