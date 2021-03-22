// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

class ScrapBookApp extends StatefulWidget {
  const ScrapBookApp({Key key}) : super(key: key);
  @override
  State createState() => _ScrapBookState();
}

class _ScrapBookState extends StateMVC<ScrapBookApp>
    with SingleTickerProviderStateMixin {
  DesignBuildAppBar sbAppBar;

  @override
  void initState() {
    super.initState();
    sbAppBar = DesignBuildAppBar(this);
  }

  @override
  void dispose(){
    sbAppBar.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: sbAppBar.appBar,
        endDrawer: ScrapBookDrawer(),
        body: TabBarView(
          controller: sbAppBar.controller,
          children: const <Widget>[
            ScrapbookDesignScreen(),
            ScrapbookBuildScreen(),
          ],
        ));
  }




}


