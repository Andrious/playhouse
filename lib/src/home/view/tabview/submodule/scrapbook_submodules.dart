// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

class SubmodulesScreen extends StatefulWidget {
  const SubmodulesScreen({Key key}) : super(key: key);

  @override
  State createState() => SubmodulesState();
}

class SubmodulesState extends StateMVC<SubmodulesScreen>
    with TickerProviderStateMixin {
  SubmodulesState() : super(ScrapBookController()) {
    _con = controller;
  }
  SubmodulesTabBar _sbSubTabBar;
  ScrapBookController get con => _con;
  ScrapBookController _con;

  AnimationController _animationController;
  var _panelHeight = 330.0;

  void onPressed() {
    _animationController.fling(velocity: isPanelUp ? -1.0 : 1.0);
    Prefs.setBool('${_con.module}_panelUp', isPanelUp);
  }

  bool get isPanelUp {
    final AnimationStatus status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  void initState() {
    super.initState();
    _sbSubTabBar = SubmodulesTabBar(this);
    // Set up this appbar's data
    _sbSubTabBar.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 100), value: 1, vsync: this);

    final panelUp = Prefs.getBool('${_con.module}_panelUp');

    if (!panelUp) {
      onPressed();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final context = this.context;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    if (isPortrait) {
      _panelHeight = MediaQuery.of(context).size.height * 0.35;
    } else {
      _panelHeight = 0.0;
    }
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    _sbSubTabBar.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final animation = _getPanelAnimation(constraints);
        return Stack(
          children: <Widget>[
            TabBar(
              controller: _sbSubTabBar.controller,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: _sbSubTabBar.tabs,
            ),
            PositionedTransition(
              rect: animation,
              child: Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                elevation: 12,
                child: Container(
                  height: _panelHeight,
                  child: TabBarView(
                    controller: _sbSubTabBar.controller,
                    children: _sbSubTabBar.children,
                  ),
                ),
              ),
            ),
          ],
        );
      });

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final top = height - _panelHeight;
    final bottom = -_panelHeight;
    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, top, 0, bottom),
      end: const RelativeRect.fromLTRB(0, 0, 0, 0),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  /// Means to 'lock' certain Submodules.
  bool sub01Locked = false;
  bool sub02Locked = false;
  bool sub03Locked = false;
  bool sub04Locked = false;
}
