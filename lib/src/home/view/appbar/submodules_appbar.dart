// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event Handler code
import 'package:playhouse/src/controller.dart';

/// Tabs for the Submodules
///
class SubmodulesTabBar {
  //
  SubmodulesTabBar(this.provider) {
    // Supply the Controller.
    _con = provider.con;
  }
  final ScrapbookSubmodulesState provider;
  ScrapBookController _con;

  TabController _tabController;
  List<Widget> _tabSubmodules;
  List<Widget> _children;

  void initState() {
    //
    _tabSubmodules = provider.tabSubmodules();

    /// 4 Submodules. Each with their own 'ScrapbookTaskScreen
    _children = provider.children();

    //
    String prefsLabel;

    /// Determine if we're on the Design side or the Build side.
    if (_con.inBuildScreen) {
      prefsLabel = 'Build';
    } else {
      prefsLabel = 'Design';
    }

    _tabController = GITabController(
      initialIndex: Prefs.getInt('${prefsLabel}SubmodulesIndex'),
      length: _tabSubmodules.length,
      vsync: provider,
      state: provider,
    );

    _tabController.addListener(() {
      Prefs.setInt('${prefsLabel}SubmodulesIndex', _tabController.index);
    });
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;

  List<Widget> get tabs => _tabSubmodules;

  List<Widget> get children => _children;

  Widget picTab(Image image) => Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: 300,
        height: 200,
        child: AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: image,
        ),
      );
}
