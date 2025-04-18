// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The UI code
import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///
abstract class PanelScreenState<T extends StatefulWidget> extends StateX<T>
    with TickerProviderStateMixin, StateSet {
  ///
  PanelScreenState(this.card) : super(controller: card.con) {
    // Assign the Controller right away.
    con = card.con;
    // Ensure the Controller is provided the 'current' card.
    con.card = card;
    // Ensure the Controller has the 'current' task record.
    con.task = card.task;

    panelKey =
        '${con.moduleType}${con.module!['name']}${con.task!['name']}_panel';
  }

  ///
  final TaskCard card;

  /// A Preference Panel Key
  late String panelKey;

  ///
  late ScrapBookController con;

//  Widget panelScreen;

  late AnimationController _animationController;

  ///
  late double maxHeight;

  var _panelHeight = 0.0;

  /// The layout constraints set on the panel;
  late BoxConstraints constraints;

  /// Implement widget behind the panel
  Widget buildBackground(BuildContext context);

  /// Implement widget displayed on the panel.
  Widget buildPanel(BuildContext context, BoxConstraints constraints);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 100), value: 1, vsync: this);

    // Is the Task panel up or down.
    final panelUp = Prefs.getBool(panelKey);

    if (!panelUp) {
      _movePanel();
    }
  }

  @override
  void dispose() {
    // Always remove the 'current' task record.
    con.task = null;
    con.card = null;
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final context = this.context;
    // Set the initial panel height
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _panelHeight = MediaQuery.of(context).size.height * 0.06;
    } else {
      _panelHeight = 0.0;
    }
  }

  @override
  Widget buildAndroid(BuildContext context) {
    final panelUp = isPanelUp;

    if (panelUp) {
      maxHeight = 0.7;
    } else {
      maxHeight = 0.35;
    }

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape && panelUp) {
      //
      maxHeight = 0.5;
    }

    List<Widget> row;

    if (!panelUp) {
      row = [
        RotatedBox(
          quarterTurns: panelUp ? 0 : 2,
          child: const FaIcon(
            Icons.filter_list_outlined,
          ),
        ),
      ];
    } else {
      row = [
        /// Submodule Name
        Text(
          '${con.task!['submodule']}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const Icon(Icons.filter_list_outlined),

        /// Task icon
        SizedBox(
          width: 100,
          height: 50,
          child: card.icon,
        ),
      ];
    }

    const style = TextStyle(color: Colors.black);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // The buildPanel() function now has access to the constraints
      this.constraints = constraints;
      return Container(
        constraints: constraints,
        child: Stack(
          children: <Widget>[
            _SwipeUpDetector(
              this,
              child: buildBackground(context),
            ),
            PositionedTransition(
              rect: _getPanelAnimation(constraints),
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                elevation: 12,
                child: SizedBox(
                  height: _panelHeight,
                  child: _SwipeUpDetector(
                    this,
                    child: Column(
                      children: [
                        Flexible(
                          flex: panelUp ? 3 : 30,
                          child: Padding(
                            padding: panelUp
                                ? const EdgeInsets.only(top: 20, bottom: 10)
                                : const EdgeInsets.only(
                                    top: 10, left: 10, bottom: 10),
                            child: InkWell(
                              onTap: () {
                                _movePanel();
                                setState(() {});
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: row,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: panelUp ? 30 : 3,
                          child: buildPanel(context, constraints),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  ///
  bool get isPanelUp {
    final AnimationStatus status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _movePanel() {
    //
    final panelUp = isPanelUp;
    _animationController.fling(velocity: panelUp ? -1.0 : 1.0);
    Prefs.setBool(panelKey, !panelUp);
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final top = height - _panelHeight;
    final bottom = -_panelHeight;
    return RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, top, 0, bottom),
      end: const RelativeRect.fromLTRB(0, 100, 0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }
}

/// Swipe the Task Card panel up and down.
class _SwipeUpDetector extends GestureDetector {
  //
  _SwipeUpDetector(PanelScreenState state, {Key? key, required Widget child})
      : super(
          key: key,
          onVerticalDragStart: (details) => _start = details.localPosition.dy,
          onVerticalDragUpdate: (details) => _end = details.localPosition.dy,
          onVerticalDragEnd: (details) {
            //
            final panelUp = state.isPanelUp;

            /// Swiping up.
            if (_end < _start) {
              //
              if (!panelUp) {
                state._movePanel();
                state.setState(() {});
              }

              /// Swiping down.
            } else if (_end > _start) {
              //
              if (panelUp) {
                state._movePanel();
                state.setState(() {});
              }
            }
          },
          child: child,
        );
  static double _start = double.infinity;
  static double _end = double.infinity;
}

///
class EmptyPanel extends StatefulWidget {
  ///
  const EmptyPanel({super.key});
  @override
  State createState() => _EmptyPanelState();
}

class _EmptyPanelState extends State<EmptyPanel> {
  @override
  Widget build(BuildContext context) => Container();
}
