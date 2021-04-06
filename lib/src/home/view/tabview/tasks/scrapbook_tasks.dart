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
  _ScrapbookTasksScreenState() : super(ScrapBookController()) {
    _con = controller;
  }
  SubmodulesState submodule;

  ScrapBookController get con => _con;
  ScrapBookController _con;

  TextStyle style;

  @override
  void initState() {
    super.initState();
    submodule = widget.tab.state;
    style = const TextStyle(color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    Icon arrow;
    if (submodule.isPanelUp) {
      arrow = const Icon(
        Icons.expand_more,
        color: Colors.red,
      );
    } else {
      arrow = const Icon(
        Icons.expand_less,
        color: Colors.green,
      );
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
            TextButton(
              onPressed: () {
                setState(submodule.onPressed);
              },
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'View All',
                  style: style,
                ),
                arrow,
              ]),
            ),
          ],
        ),
        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            primary: false,
            children: con.taskCards,
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
