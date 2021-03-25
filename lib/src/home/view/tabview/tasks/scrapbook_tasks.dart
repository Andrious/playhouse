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
  State createState() => _ScrapbookTaskState();
}

class _ScrapbookTaskState extends StateMVC<ScrapbookTasksScreen> with SingleTickerProviderStateMixin{
  TaskStateTabBar sbTaskStateTabBar;

  @override
  void initState() {
    super.initState();
    sbTaskStateTabBar = TaskStateTabBar(this);
    // Set up this appbar's data
    sbTaskStateTabBar.initState();
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    sbTaskStateTabBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: TabBar(
          controller: sbTaskStateTabBar.controller,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: ShapeDecoration(
              color: const Color(0xFFE6E6E6),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99)
              )
          ),
          tabs: sbTaskStateTabBar.tabs,
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: sbTaskStateTabBar.controller,
          children: sbTaskStateTabBar.children,
        ),
      ),
    ],
  );
}

