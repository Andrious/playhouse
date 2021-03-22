// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

class DesignBuildAppBar {
  //
  DesignBuildAppBar(this._provider) {
    //
    if (_provider is StateMVC) {
      _state = _provider as StateMVC;
    }
    _tabController = TabController(
        initialIndex: Prefs.getInt('DesignBuildIndex'),
        length: 2,
        vsync: _provider);
    _tabController.addListener(() {
      Prefs.setInt('DesignBuildIndex', _tabController.index);
      _state?.setState(() {});
    });
  }
  final TickerProvider _provider;
  StateMVC _state;

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController _tabController;
  TabController get controller => _tabController;

  AppBar get appBar => AppBar(
        title: const Text('Grey & Ivy Playhouse'),
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

class ModulesAppBar {
  //
  ModulesAppBar(this.provider);

  final TickerProvider provider;
  TabController _tabController;
  StateMVC _state;

  /// Set up the AppBar
  void initState() {
    //
    if (provider is StateMVC) {
      _state = provider as StateMVC;
    }

    _tabController = TabController(
        initialIndex: Prefs.getInt('ModulesIndex'), length: 4, vsync: provider);
    _tabController.addListener(() {
      Prefs.setInt('ModulesIndex', _tabController.index);
      _state?.setState(() {});
    });

    _children = const [
      ModuleScreen(),
      ModuleScreen(),
      ModuleScreen(),
      ModuleScreen(),
    ];
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;

  List<Widget> get _tabModules => [
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
            'Evaluation',
            style: TextStyle(
              fontWeight:
                  _tabController.index == 3 ? FontWeight.w700 : FontWeight.w400,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
      ];

  AppBar get appBar => AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        toolbarHeight: 50,
        primary: false,
        bottom: TabBar(
          tabs: _tabModules,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      );

  List<Widget> _children;
  List<Widget> get children => _children;
}

/// Tabs for the Submodules
///
class SubmodulesTabBar {
  //
  SubmodulesTabBar(this.provider);

  final TickerProvider provider;
  TabController _tabController;
  List<Widget> _tabSubmodules;
  List<Widget> _children;

  void initState() {
    _tabSubmodules = [
      picTab(Image.asset('assets/images/Inspiration.jpg', fit: BoxFit.cover)),
      picTab(
          Image.asset('assets/images/SiteAssessment.jpg', fit: BoxFit.cover)),
      picTab(Image.asset('assets/images/FloorPlan.jpg', fit: BoxFit.cover)),
      picTab(Image.asset('assets/images/Elevation.jpg', fit: BoxFit.cover)),
    ];

    _children = [
      const ScrapbookTaskScreen(),
      const ScrapbookTaskScreen(),
      const ScrapbookTaskScreen(),
      const ScrapbookTaskScreen(),
    ];

    _tabController = TabController(
        initialIndex: Prefs.getInt('SubmodulesIndex'),
        length: _tabSubmodules.length,
        vsync: provider);
    _tabController.addListener(() {
      Prefs.setInt('SubmodulesIndex', _tabController.index);
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
      width: 150,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: image,
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),
        ],
      ));
}
