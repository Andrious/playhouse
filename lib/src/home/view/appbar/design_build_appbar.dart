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
    _tabController = GITabController(
      initialIndex: Prefs.getInt('DesignBuildIndex'),
      length: 2,
      vsync: _provider,
      state: _provider,
    );
    _tabController.addListener(() {
      Prefs.setInt('DesignBuildIndex', _tabController.index);
      _provider?.setState(() {});
    });
  }
  final ScrapBookState _provider;

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController _tabController;
  TabController get controller => _tabController;

  /// The App Tool bar
  AppBar get appBar => AppBar(
        title: const Text('Playhouse'),
        // actions: [
        //   /// Supply the App's popup menu. Pass in the screen's State object.
        //   AppMenu().show(_provider),
        // ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        toolbarHeight: 100,
        primary: false,
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text(
                'Design',
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
              child: Text(
                'Build',
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
          controller: _tabController,
        ),
      );
}
