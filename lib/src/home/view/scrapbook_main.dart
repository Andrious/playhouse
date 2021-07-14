// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The event handling code
import 'package:playhouse/src/controller.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

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
  ScrapBookController con;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: con.initialIndex,
      length: con.moduleTypes.length,
      vsync: this,
    );

    _tabController.addListener(() {
      con.initialIndex = _tabController.index;
      setState(() {});
      con.initTypeOfModules(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar,
        endDrawer: const ScrapBookDrawer(),
        primary: false,
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            DiscoverModulesScreen(),
            DesignModulesScreen(),
            BuildModulesScreen(),
          ],
        ));
  }

  /// The App Tool bar
  AppBar get _appBar => AppBar(
        title: I10n.t('Playhouse'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        toolbarHeight: 100,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: I10n.t(
                con.moduleTypes[0],
                style: TextStyle(
                  fontWeight: _tabController.index == 0
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
            ),
            Tab(
              child: I10n.t(
                con.moduleTypes[1],
                style: TextStyle(
                  fontWeight: _tabController.index == 1
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
            ),
            Tab(
              child: I10n.t(
                con.moduleTypes[2],
                style: TextStyle(
                  fontWeight: _tabController.index == 1
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      );
}
