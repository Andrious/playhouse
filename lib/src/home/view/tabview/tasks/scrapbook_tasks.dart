// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//import 'dart:html';

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

class ScrapbookTasksScreen extends StatefulWidget {
  const ScrapbookTasksScreen({Key key}) : super(key: key);

  @override
  State createState() => ScrapbookTaskState();
}

class ScrapbookTaskState extends StateMVC<ScrapbookTasksScreen> with SingleTickerProviderStateMixin{
  ScrapbookTaskState() : super(ScrapBookController()) {
    _con = controller;
  }
  TaskStateTabBar _sbTaskStateTabBar;

  ScrapBookController get con => _con;
  ScrapBookController _con;

  @override
  void initState() {
    super.initState();
    _sbTaskStateTabBar = TaskStateTabBar(this);
    // Set up this appbar's data
    _sbTaskStateTabBar.initState();
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    _sbTaskStateTabBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: TabBar(
          controller: _sbTaskStateTabBar.controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: ShapeDecoration(
              color: const Color(0xFFE6E6E6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99)
              )
          ),
          tabs: _sbTaskStateTabBar.tabs,
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: _sbTaskStateTabBar.controller,
          children: _sbTaskStateTabBar.children,
        ),
      ),
    ],
  );
}

