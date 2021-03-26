// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event Handler code
import 'package:playhouse/src/controller.dart';

/// Tabs for the 'state' of a Task
///
class TaskStateTabBar {
  //
  TaskStateTabBar(this.provider) {
    // Supply the Controller.
    _con = provider.con;
  }
  final ScrapbookTaskState provider;
  ScrapBookController _con;

  TabController _tabController;
  List<Widget> _tabTasks;
  List<Widget> _children;

  void initState() {
    _children = [
      const ScrapbookTaskStateScreen(),
      const EmptyTaskStateScreen(),
      const EmptyTaskStateScreen(),
    ];

    //
    String prefsLabel;

    /// Determine if we're on the Design side or the Build side.
    if (_con.inBuildScreen) {
      prefsLabel = 'Build';
    } else {
      prefsLabel = 'Design';
    }

    _tabController = GITabController(
        initialIndex: Prefs.getInt('${prefsLabel}TaskStateIndex'),
        length: 3,
        vsync: provider,
        state: provider);

    _tabController.addListener(() {
      if (_tabController.length > 0) {
        Prefs.setInt('${prefsLabel}TaskStateIndex', _tabController.index);
      }
      provider?.setState(() {});
    });
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
