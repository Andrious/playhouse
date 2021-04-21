// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code

import 'dart:math' as math;
import 'package:flutter/foundation.dart' show precisionErrorTolerance;

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

  SubmodulesTabBar get tabBar => _sbSubTabBar;
  SubmodulesTabBar _sbSubTabBar;

  ScrapBookController get con => _con;
  ScrapBookController _con;

  AnimationController _animationController;
  var _panelHeight = 0.0;

  @override
  void initState() {
    super.initState();

    _sbSubTabBar = SubmodulesTabBar(this);
    // Set up this appbar's data
    _sbSubTabBar.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 100), value: 1, vsync: this);

    final panelUp = Prefs.getBool('${_con.moduleType}${_con.module}_panelUp');

    if (!panelUp) {
      _movePanel();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final context = this.context;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    if (isPortrait) {
      _panelHeight = MediaQuery.of(context).size.height * 0.05;
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
        final ScrollPhysics scrollPhysics =
            ScrollConfiguration.of(context).getScrollPhysics(context);
        final tabBar = GreyIvyTabBar(
          controller: _sbSubTabBar.controller,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: _sbSubTabBar.tabs,
          physics: BigPageScrollPhysics(
            controller: _sbSubTabBar.controller,
          ).applyTo(scrollPhysics),
        );

        final tabView = TabBarView(
          controller: _sbSubTabBar.controller,
          children: _sbSubTabBar.children,
        );

        _sbSubTabBar.controller.tabBar = tabBar;

        return Stack(
          children: <Widget>[
            tabBar,
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
                  child: tabView,
                ),
              ),
            ),
          ],
        );
      });

  void onPressed() {
    _movePanel();
  }

  bool get isPanelUp {
    final AnimationStatus status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _movePanel() {
    _animationController.fling(velocity: isPanelUp ? -1.0 : 1.0);
    Prefs.setBool('${_con.moduleType}${_con.module}_panelUp', isPanelUp);
  }

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

/// Scroll physics used by a [SubmodulesScreen].
///
/// These physics cause the page view to snap to page boundaries.
///
/// See also:
///
///  * [ScrollPhysics], the base class which defines the API for scrolling
///    physics.
///  * [PageView.physics], which can override the physics used by a page view.
class BigPageScrollPhysics extends ScrollPhysics {
  /// Creates physics for a [PageView].
  const BigPageScrollPhysics({ScrollPhysics parent, this.controller})
      : super(parent: parent);

  final GITabController controller;

  double get viewportFraction => 2;

  @override
  BigPageScrollPhysics applyTo(ScrollPhysics ancestor) {
    return BigPageScrollPhysics(
        parent: buildParent(ancestor), controller: controller);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (parent == null) {
      return offset;
    }
    return parent.applyPhysicsToUserOffset(position, offset);
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      final simulation = ScrollSpringSimulation(
          spring, position.pixels, target, velocity,
          tolerance: tolerance);
      int nextPage;
      if (velocity < -tolerance.velocity) {
        nextPage = controller.index - 1;
      } else if (velocity > tolerance.velocity) {
        nextPage = controller.index + 1;
      }
      if (nextPage != null) {
        // There's a bug! It won't go to initialIndex!?
        if (nextPage >= 0 && (nextPage < controller.length)) {
          controller.animateTo(nextPage);
        }
      }
      return simulation;
    }
    return null;
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return _getPixels(position, page.roundToDouble());
  }

  double _getPage(ScrollMetrics position) {
    return _getPageFromPixels(
        !position.hasPixels
            ? null
            : position.pixels
                .clamp(position.minScrollExtent, position.maxScrollExtent),
        position);
    return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollMetrics position, double page) {
    return _getPixelsFromPage(position, page);
    return page * position.viewportDimension;
  }

  double _getPixelsFromPage(ScrollMetrics position, double page) {
    return page * position.viewportDimension * viewportFraction +
        _initialPageOffset(position);
  }

  double _initialPageOffset(ScrollMetrics position) =>
      math.max(0, position.viewportDimension * (viewportFraction - 1) / 2);

  double _getPageFromPixels(double pixels, ScrollMetrics position) {
    final double actual = math.max(0, pixels - _initialPageOffset(position)) /
        math.max(1.0, position.viewportDimension * viewportFraction);
    final double round = actual.roundToDouble();
    if ((actual - round).abs() < precisionErrorTolerance) {
      return round;
    }
    return actual;
  }

  @override
  bool get allowImplicitScrolling => false;
}
