// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The event handling code
import 'package:playhouse/src/controller.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// Design | Build
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

  DesignBuildAppBar _sbAppBar;
  ScrapBookController con;

  @override
  void initState() {
    super.initState();
    _sbAppBar = DesignBuildAppBar(this);
  }

  @override
  void dispose() {
    _sbAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: _sbAppBar.appBar,
        endDrawer: const ScrapBookDrawer(),
        primary: false,
        body: TabBarView(
          controller: _sbAppBar.controller,
          children: const <Widget>[
            ScrapbookDesignScreen(),
            ScrapbookBuildScreen(),
          ],
        ));
  }
}
