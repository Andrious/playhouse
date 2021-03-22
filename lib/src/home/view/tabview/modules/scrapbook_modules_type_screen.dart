// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The UI code
import 'package:playhouse/src/view.dart';

class ModuleTypeScreen extends StatefulWidget {
  const ModuleTypeScreen({Key key}) : super(key: key);

  @override
  State createState() => _ModuleTypeScreenState();
}

class _ModuleTypeScreenState extends StateMVC<ModuleTypeScreen>
    with SingleTickerProviderStateMixin {
  ModulesAppBar sbModAppBar;

  @override
  void initState() {
    super.initState();
    sbModAppBar = ModulesAppBar(this);
    // Set up this appbar's data
    sbModAppBar.initState();
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    sbModAppBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      primary: false,
      appBar: sbModAppBar.appBar,
      body: TabBarView(
        controller: sbModAppBar.controller,
        children: sbModAppBar.children,
      ));
}
