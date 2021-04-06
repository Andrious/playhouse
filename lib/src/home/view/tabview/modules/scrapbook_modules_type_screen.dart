// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The UI code
import 'package:playhouse/src/view.dart';

/// The event handling code
import 'package:playhouse/src/controller.dart';

/// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
class ModuleTypeScreen extends StatefulWidget {
  const ModuleTypeScreen({Key key}) : super(key: key);

  @override
  State createState() => ModuleTypeScreenState();
}

class ModuleTypeScreenState extends StateMVC<ModuleTypeScreen>
    with SingleTickerProviderStateMixin {
  ModuleTypeScreenState() : super(ScrapBookController()) {
    _con = controller;
  }

  ModulesAppBar _sbModAppBar;
  ScrapBookController get con => _con;
  ScrapBookController _con;

  @override
  void initState() {
    super.initState();
    con.inBuildScreen = widget is ScrapbookBuildScreen;
    _sbModAppBar = ModulesAppBar(this);
    // Set up this appbar's data
    _sbModAppBar.initState();
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    _sbModAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: _sbModAppBar.appBar,
      body: SafeArea(
        child: TabBarView(
          controller: _sbModAppBar.controller,
          children: _sbModAppBar.children,
        ),
      ));
}
