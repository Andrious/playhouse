// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// For base64.decode()
import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key key, this.card}) : super(key: key);
  final TaskCard card;
  @override
  State createState() => _TaskScreenState(card);
}

class _TaskScreenState extends PanelScreenState<TaskScreen> {
  _TaskScreenState(TaskCard card) : super(card);
  //
  final List<Widget> actions = [];

  /// Determine which 'Task' Screen is to be displayed.
  StatefulWidget whichTaskScreen(TaskCard card) {
    //
    final index = ['question', 'abc', 'AR', 'picture', 'pencil', 'movie']
        .indexWhere(card.con.task['key_art_file'].contains);

    StatefulWidget widget;

    switch (index) {
      case 0:
        widget = const EmptyPanel();
        break;
      case 1:
        widget = const EmptyPanel();
        break;
      case 2:
        widget = ThreePicturesScreen(this);
        break;
      case 3:
        widget = pictureTaskScreens(this);
        break;
      case 4:
        widget = const EmptyPanel();
        break;
      case 5:
        widget = const EmptyPanel();
        break;
      default:
        widget = null;
    }
    return widget;
  }

  @override
  StatefulWidget buildPanel(BuildContext context) => whichTaskScreen(card);

  @override
  Widget buildBackground(BuildContext context) => Scaffold(
        primary: false,
        appBar: AppBar(
//        leading: widget.task.icon,
          title: I10n.t('Playhouse'),
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
                  'assets/images/${con.submodule['key_art_file']}',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /// Submodule Name
                        Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 20),
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
                ),
              ),
            ),
          ),
        ),
      );
}
