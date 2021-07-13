// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

/// Special icons used
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// State of the Task:  Favorite, Incomplete, etc.
class ScrapbookTasksScreen extends StatefulWidget {
  const ScrapbookTasksScreen({Key key, @required this.tab}) : super(key: key);
  final PicTab tab;

  @override
  State createState() => _ScrapbookTasksScreenState();
}

class _ScrapbookTasksScreenState extends StateMVC<ScrapbookTasksScreen>
    with StateMap {
  _ScrapbookTasksScreenState() : super(ScrapBookController());

  SubmodulesState submoduleState;
  ScrapBookController _con;
  TextStyle style;

  @override
  void initState() {
    super.initState();

    submoduleState = widget.tab.state;

    _con = submoduleState.con;

    /// Populate the 'first' Submodule State object for each Module
    final state = _con.subModuleStates[_con.module['name']];

    if (state != null && !state.mounted) {
      _con.subModuleStates[_con.moduleType + _con.module['name']] = null;
    }

    _con.subModuleStates[_con.moduleType + _con.module['name']] ??= this;

    // Populate this Submodule's Tasks
    _con.initTasks(widget.tab.submodule);

    style = const TextStyle(color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    Icon arrow;
    double maxHeight;

    if (submoduleState.isPanelUp) {
      //
      arrow = const Icon(
        Icons.expand_more, // Icons.view_headline,
        color: Colors.red,
      );

      maxHeight = 0.7;
    } else {
      //
      arrow = const Icon(
        Icons.expand_less, // Icons.view_headline,
        color: Colors.green,
      );

      maxHeight = 0.35;
    }

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape && submoduleState.isPanelUp) {
      //
      maxHeight = 0.5;
    }

    return Column(
      children: [
//         InkWell(
//           onTap: () {
//             setState(submodule.onPressed);
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 arrow,
//                 arrow,
//                 arrow,
//               ],
//             ),
//           ),
//         ),
        Flexible(
          flex: submoduleState.isPanelUp ? 3 : 30,
          child: Padding(
            padding: submoduleState.isPanelUp
                ? const EdgeInsets.only(top: 20, bottom: 10)
                : const EdgeInsets.only(top: 10, left: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                setState(submoduleState.onPressed);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${_con.submodule['name']}  |',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        _con.submodule['short_description'],
                        style: style,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: submoduleState.isPanelUp ? 30 : 2,
          child: LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * maxHeight,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              addRepaintBoundaries: false,
              children: _con.taskCards,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(submoduleState.onPressed);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'View All',
                        style: style,
                      ),
                    ),
                    const Expanded(
                      child: FaIcon(FontAwesomeIcons.angleUp),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Expanded(
                      child: I10n.t(
                        'To Do',
                        style: style,
                      ),
                    ),
                    const Expanded(
                      child: FaIcon(
                        FlutterIcons.reminder,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Expanded(
                      child: I10n.t(
                        'Done',
                        style: style,
                      ),
                    ),
                    const Expanded(
                      child: FaIcon(
                        Icons.done,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Expanded(
                      child: I10n.t(
                        'Favourites',
                        style: style,
                      ),
                    ),
                    const Expanded(
                      child: FaIcon(
                        Icons.star,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmptyTaskStateScreen extends StatelessWidget {
  const EmptyTaskStateScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center();
}
