// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// For base64.decode()
import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

///
class TaskScreen extends StatefulWidget {
  ///
  const TaskScreen({Key? key, required this.card}) : super(key: key);

  ///
  final TaskCard card;

  ///
  @override
  State createState() => _TaskScreenState(card);
}

class _TaskScreenState extends PanelScreenState<TaskScreen> {
  _TaskScreenState(TaskCard card) : super(card) {
    taskCompleted = card.completed();
  }
  //
  final List<Widget> actions = [];
  late bool taskCompleted;

  /// Determine which 'Task' Screen is to be displayed.
  StatefulWidget? whichTaskPanel(TaskCard card) {
    //
    final index = ['question', 'abc', 'AR', 'picture', 'pencil', 'movie']
        .indexWhere(card.con.task!['key_art_file'].contains);

    StatefulWidget? widget;

    switch (index) {
      case 0:
        widget = questionTaskScreens(this);
        break;
      case 1:
        widget = abcTaskScreens(this);
        break;
      case 2:
        widget = arTaskScreens(this);
        break;
      case 3:
        widget = pictureTaskScreens(this);
        break;
      case 4:
        widget = pencilTaskScreens(this);
        break;
      case 5:
        widget = movieTaskScreens(this);
        break;
      default:
        widget = null;
    }
    return widget;
  }

  @override
  Widget buildPanel(BuildContext context, BoxConstraints constraints) {
    Widget widget;

    if (taskCompleted) {
      widget = Padding(
          padding: const EdgeInsets.all(16), child: _noRow(instructions));
    } else {
      widget = whichTaskPanel(card) as Widget;
    }
    return widget;
  }

  @override
  Widget buildBackground(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: L10n.t('Playhouse'),
          centerTitle: true,
          elevation: 0,
          excludeHeaderSemantics: true,
          actions: actions,
        ),
        body: SafeArea(
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  'assets/images/submodules/${con.submodule!['key_art_file']}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              width: 300,
              height: 500,
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 60, 16, 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(16),
                child: taskCompleted ? whichTaskPanel(card) : instructions,
              ),
            ),
          ),
        ),
      );

  Widget _noRow(Column column) {
    column.children.removeWhere((widget) => widget is Row);
    return column;
  }

  Column get instructions => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Submodule Name
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 20),
                  child: Text(
                    '${card.task['submodule']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              /// Task icon
              SizedBox(
                width: 100,
                height: 50,
                child: card.icon,
              ),
            ],
          ),

          /// Task Name & Number
          Flexible(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: Text(
                  card.task['name'],
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          /// Short Description or Title
          Flexible(
            child: Center(
              child: Text(card.task['short_description']),
            ),
          ),

          /// Long Description
          Flexible(
            flex: 4,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(card.task['long_description']),
            ),
          ),
        ],
      );
}
