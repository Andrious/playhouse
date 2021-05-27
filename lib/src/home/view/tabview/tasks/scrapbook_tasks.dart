// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

/// State of the Task:  Favorite, Incomplete, etc.
class ScrapbookTasksScreen extends StatefulWidget {
  const ScrapbookTasksScreen({Key key, @required this.tab}) : super(key: key);
  final PicTab tab;

  @override
  State createState() => _ScrapbookTasksScreenState();
}

class _ScrapbookTasksScreenState extends StateMVC<ScrapbookTasksScreen> {
  _ScrapbookTasksScreenState() : super(ScrapBookController());
  // _ScrapbookTasksScreenState() : super(ScrapBookController()) {
  //   _con = controller;
  // }
  SubmodulesState submodule;
  String submoduleName;
  // ScrapBookController get con => _con;
  ScrapBookController _con;

  TextStyle style;

  @override
  void initState() {
    super.initState();
    submodule = widget.tab.state;
    _con = submodule.con;
    var name;
    if (widget.tab.submodule is String) {
      name = widget.tab.submodule;
    } else {
      name = widget.tab.submodule['name'];
    }
    // critical to assign.
    _con.submoduleName = name;
    submoduleName = name;
    style = const TextStyle(color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    Icon arrow;
    double maxHeight;
    if (submodule.isPanelUp) {
      arrow = const Icon(
        Icons.expand_more, // Icons.view_headline,
        color: Colors.red,
      );
      maxHeight = 0.7;
    } else {
      arrow = const Icon(
        Icons.expand_less, // Icons.view_headline,
        color: Colors.green,
      );
      maxHeight = 0.35;
    }
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (isLandscape && submodule.isPanelUp) {
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
          flex: submodule.isPanelUp ? 3 : 30,
          child: Padding(
            padding: submodule.isPanelUp
                ? const EdgeInsets.only(bottom: 10)
                : const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(submodule.onPressed);
                  },
                  child: Text(
                    '$submoduleName  |',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(submodule.onPressed);
                  },
                  child: Text(
                    'Submodule description',
                    style: style,
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: submodule.isPanelUp ? 30 : 2,
          child: LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * maxHeight,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              primary: false,
              addRepaintBoundaries: false,
              children: _con.taskCards,
//              children: con.taskCards(widget.tab.submodule);
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
                  setState(submodule.onPressed);
                },
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    'View All',
                    style: style,
                  ),
                  Flexible(child: arrow),
                ]),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'All',
                  style: style,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Favorite',
                  style: style,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Incomplete',
                  style: style,
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
