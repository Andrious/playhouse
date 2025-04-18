// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
/// Special icons used
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// State of the Task:  Favorite, Incomplete, etc.
class ScrapbookTasksScreen extends StatefulWidget {
  ///
  const ScrapbookTasksScreen({Key? key, required this.tab}) : super(key: key);

  ///
  final PicTab tab;

  @override
  State createState() => _ScrapbookTasksScreenState();
}

class _ScrapbookTasksScreenState extends StateX<ScrapbookTasksScreen>
    with StateSet {
  _ScrapbookTasksScreenState() : super(controller: ScrapBookController());

  SubmodulesState? submoduleState;
  late ScrapBookController _con;
  late TextStyle style;

  @override
  void initState() {
    super.initState();

    submoduleState = widget.tab.state;

    _con = submoduleState!.con;

    State? state;

    if (_con.subModuleStates == null) {
      state = null;
    } else {
      // Add this State as a subModule of this type and name.
      _con.subModuleStates![_con.moduleType + _con.module!['name']] ??= this;
    }

    // Populate this Submodule's Tasks
    _con.initTasks(widget.tab.submodule);

    style = const TextStyle(color: Colors.black);
  }

  @override
  Widget buildAndroid(BuildContext context) {
    Icon arrow;
    double maxHeight;

    if (submoduleState!.isPanelUp) {
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

    if (isLandscape && submoduleState!.isPanelUp) {
      //
      maxHeight = 0.5;
    }

    const btnStyle = ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
    );

    return Column(
      children: [
        Flexible(
          flex: submoduleState!.isPanelUp ? 3 : 30,
          child: Padding(
            padding: submoduleState!.isPanelUp
                ? const EdgeInsets.only(top: 20, left: 20, bottom: 2)
                : const EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: InkWell(
              onTap: () {
                setState(submoduleState!.onPressed);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${_con.submodule!['name']}  |',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        _con.submodule!['short_description'],
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
          flex: submoduleState!.isPanelUp ? 30 : 2,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tooltip(
              message: 'View All'.tr,
              child: IconButton(
                onPressed: () => setState(submoduleState!.onPressed),
                icon: const Icon(FontAwesomeIcons.angleUp),
                style: btnStyle,
              ),
            ),
            Tooltip(
              message: 'To Do'.tr,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FlutterIcons.reminder,
                ),
                style: btnStyle,
              ),
            ),
            Tooltip(
              message: 'Done'.tr,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.done),
                style: btnStyle,
              ),
            ),
            Tooltip(
              message: 'Favourites'.tr,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star,
                ),
                style: btnStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

///
class EmptyTaskStateScreen extends StatelessWidget {
  ///
  const EmptyTaskStateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center();
}
