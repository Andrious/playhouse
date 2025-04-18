// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The event handling code
import 'package:playhouse/src/controller.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

///
class ScrapBookApp extends StatefulWidget {
  ///
  const ScrapBookApp({Key? key}) : super(key: key);
  @override
  State createState() => ScrapBookState();
}

///
class ScrapBookState extends StateX<ScrapBookApp>
    with SingleTickerProviderStateMixin {
  ///
  ScrapBookState() : super(controller: ScrapBookController()) {
    con = controller as ScrapBookController;
  }

  ///
  late ScrapBookController con;
  late TabController _mobTypeTabController;

  @override
  void initState() {
    super.initState();

    _mobTypeTabController = TabController(
      initialIndex: con.initialIndex,
      length: con.moduleTypes.length,
      vsync: this,
    );

    _mobTypeTabController.addListener(() {
      con.initialIndex = _mobTypeTabController.index;
      setState(() {});
      con.initTypeOfModules(_mobTypeTabController.index);
    });
  }

  @override
  void dispose() {
    _mobTypeTabController.dispose();
    super.dispose();
  }

  @override
  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      endDrawer: const ScrapBookDrawer(),
      primary: false,
      body: TabBarView(
        controller: _mobTypeTabController,
        children: const <Widget>[
          DiscoverModulesScreen(),
          DesignModulesScreen(),
          BuildModulesScreen(),
        ],
      ),
    );
  }

  /// The App Tool bar
  AppBar get _appBar => AppBar(
        title: L10n.t('''
        creativeSTORM
        by Grey & Ivy
        '''),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        toolbarHeight: 100,
        bottom: TabBar(
          controller: _mobTypeTabController,
          tabs: [
            Tab(
              child: L10n.t(
                con.moduleTypes[0],
                style: TextStyle(
                  fontWeight: _mobTypeTabController.index == 0
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
            ),
            Tab(
              child: L10n.t(
                con.moduleTypes[1],
                style: TextStyle(
                  fontWeight: _mobTypeTabController.index == 1
                      ? FontWeight.w700
                      : FontWeight.w400,
                ),
                softWrap: false,
                overflow: TextOverflow.visible,
              ),
            ),
            Tab(
              child: L10n.t(
                con.moduleTypes[2],
                style: TextStyle(
                  fontWeight: _mobTypeTabController.index == 1
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
