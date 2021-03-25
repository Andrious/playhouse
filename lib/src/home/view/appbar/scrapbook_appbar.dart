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
  DesignBuildAppBar(TickerProvider _provider) {
    //
    if (_provider is StateMVC) {
      _state = _provider as StateMVC;
    }
    _tabController = GITabController(
        initialIndex: Prefs.getInt('DesignBuildIndex'),
        length: 2,
        vsync: _provider);
    _tabController.addListener(() {
      Prefs.setInt('DesignBuildIndex', _tabController.index);
      _state?.setState(() {});
    });
  }
  StateMVC _state;

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
        //   AppMenu().show(_state),
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

/// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
class ModulesAppBar {
  //
  ModulesAppBar(this.providerState);

  final ModuleTypeScreenState providerState;
  TabController _tabController;

  /// Set up the AppBar
  void initState() {
    _tabController = GITabController(
      initialIndex: Prefs.getInt('ModulesIndex'),
      length: 4,
      vsync: providerState,
      state: providerState,
    );
    _tabController.addListener(() {
      Prefs.setInt('ModulesIndex', _tabController.index);
      providerState?.setState(() {});
    });

    /// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
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

  final ScrapbookSubmodulesState provider;
  TabController _tabController;
  List<Widget> _tabSubmodules;
  List<Widget> _children;

  void initState() {
    _tabSubmodules = provider.tabSubmodules();

    /// 4 Submodules. Each with their own 'ScrapbookTaskScreen
    _children = provider.children();

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

/// Tabs for the 'state' of a Task
///
class TaskStateTabBar {
  //
  TaskStateTabBar(TickerProvider _provider) {
    //
    if (_provider is StateMVC) {
      _state = _provider as StateMVC;
    }

    _tabController = GITabController(
        initialIndex: Prefs.getInt('TaskStateIndex'),
        length: 3,
        vsync: _provider,
        state: _state);

    _tabController.addListener(() {
      if (_tabController.length > 0) {
        Prefs.setInt('TaskStateIndex', _tabController.index);
      }
      _state?.setState(() {});
    });
  }
  StateMVC _state;
  TabController _tabController;
  List<Widget> _tabTasks;
  List<Widget> _children;

  void initState() {
    _children = [
      const ScrapbookTaskStateScreen(),
      const EmptyTaskStateScreen(),
      const EmptyTaskStateScreen(),
    ];
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;

  List<Widget> get tabs => [
        _taskTab('All', 0),
        _taskTab('Favorite', 1),
        _taskTab('Incomplete', 2),
      ];

  List<Widget> get children => _children;

  Tab _taskTab(String data, int index) => Tab(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            data.trim(),
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: _tabController.index == index
                  ? FontWeight.w700
                  : FontWeight.w400,
              // foreground: Paint()
              //   ..style = PaintingStyle.stroke
              //   ..strokeWidth = 1
              //   ..color = Colors.blue[700],
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ),
      );
}
