// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The event handling code
import 'package:playhouse/src/controller.dart';

class DiscoverModulesScreen extends ModuleTypeScreen {
  const DiscoverModulesScreen({Key key}) : super(key: key);
}

class DesignModulesScreen extends ModuleTypeScreen {
  const DesignModulesScreen({Key key}) : super(key: key);
}

class BuildModulesScreen extends ModuleTypeScreen {
  const BuildModulesScreen({Key key}) : super(key: key);
}

/// List of Modules
/// e.g. 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
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
          controller: _sbModAppBar.modTabController,
          children: _sbModAppBar.modTabChildren,
        ),
      ));
}

/// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
class ModulesAppBar {
  //
  ModulesAppBar(this.provider) {
    // Supply the Controller.
    _con = provider.con;
  }
  final ModuleTypeScreenState provider;
  ScrapBookController _con;

  /// Set up the AppBar
  void initState() {
    //
    final recs = _con.modules;

    final initIndex = _con.initModuleIndex;

    _modTabController = TabController(
      initialIndex: initIndex,
      length: recs.length,
      vsync: provider,
    );

    // _tabController must be defined first.
    if (recs.isNotEmpty) {
      _con.module = recs[initIndex];
    }

    _modTabController.addListener(() {
      // This fires again when finished 'changing'
      if (_modTabController.indexIsChanging) {
        //
        _con.initModule(_modTabController.index);

        provider?.setState(() {});
      }
    });

    //
    _modTabChildren = [];

    // Create the appropriate number of module screens.
    for (final module in recs) {
      //
      _modTabChildren.add(const SubmodulesScreen());
    }
  }

  /// Clean up after itself.
  void dispose() {
    _modTabController.dispose();
  }

  TabController get modTabController => _modTabController;
  TabController _modTabController;

  List<Tab> get modTabs {
    //
    final List<Tab> _tabs = [];

    var index = -1;

    for (final module in _con.modules) {
      //
      index++;

      _tabs.add(Tab(
        child: I10n.t(
          module['name'],
          style: TextStyle(
            fontWeight: _modTabController.index == index
                ? FontWeight.w700
                : FontWeight.w400,
          ),
        ),
      ));
    }
    return _tabs;
  }

  List<Widget> get modTabChildren => _modTabChildren;
  List<Widget> _modTabChildren;

  /// 'Inspiration' 'Site assessment' 'Floor Plan' 'Evaluation'
  AppBar get appBar => AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        toolbarHeight: 50,
//        primary: false,
        bottom: TabBar(
          isScrollable: true,
          tabs: modTabs,
          controller: _modTabController,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      );
}
