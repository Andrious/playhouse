// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class ScrapBookController extends ControllerMVC {
  factory ScrapBookController([StateMVC state]) =>
      _this ??= ScrapBookController._(state);

  ScrapBookController._([StateMVC state])
      : model = ScrapBookModel(),
        super(state);

  static ScrapBookController _this;
  final ScrapBookModel model;

  @override
  Future<bool> initAsync() async {
    if (App.inDebugger) {
      final test = DatabaseTest();
      //
      // if (!test.createDB()) {}

//        test.insertShadow();
    }

    // // Initialize the User's data information.
    // await FirebaseUser().initAsync();
    //
    // final database = PlayhouseDB();
    //
    // init = await database.downloadDB();

    database = Prefs.getBool('useDatabase');

    bool init = await model.initAsync();

    return init;
  }

  bool inBuildScreen = false;

  String moduleType = '';

  Map<String, dynamic> module;
//  String module = '';

  ///todo To be removed.
  bool database = false;

  ///todo To be removed.
  String moduleName = '';

  Map<String, dynamic> submodule;
//  String submodule = '';

  ///todo To be removed.
  String submoduleName = '';

  ///todo To be removed.
  int cardNo = 0;

  List<Widget> _taskCards;

  /// Return the text label specified in the Tab object.
  String tabLabel(Tab tab) {
    String label = '';
    // If not a Text widget
    if (tab.text == null) {
      if (tab.child is Text) {
        label = (tab.child as Text).data;
      } else {
        try {
          label = (tab.child as dynamic).data;
        } catch (ex) {
          label = '';
        }
      }
    } else {
      label = tab.text;
    }
    return label;
  }

  /// Merely tapping the Task Card
  Future<void> onTap() async {
    ///todo To be removed.
    final Map<String, dynamic> task = model.tasks.items[cardNo];
    final Map<String, dynamic> subTask = Map.from(task);
    subTask['subName'] = submoduleName;
    await openFullScreenRoute(TaskScreen(subTask: subTask));
    setState(() {});
  }

  /// Tapping the 'info' icon on the Task Card
  Future<void> onTapInfo() async {
    await onTap();
  }

  /// Open the supplied widget in a new route.
  Future<void> openFullScreenRoute(Widget widget) async {
    final Route<Map<String, dynamic>> route = CupertinoPageRoute(
      builder: (BuildContext context) => Material(child: widget),
      fullscreenDialog: true,
    );
    await Navigator.of(App.context).push(route);
  }

  Future<void> infoDialogue() async {
    const List<Widget> body = [
      SizedBox(height: 20),
      Text(
          "This is a description of this card's task and what you need to do accomplish it!"),
      SizedBox(height: 30),
      Text('Would you like to start doing this task?'),
      SizedBox(height: 30),
    ];

    await DialogBox(
      title: 'Task',
      body: body,
      barrierDismissible: true,
      actions: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(App.context);
          },
          child: const Text('Continue'),
        )
      ],
      context: App.context,
    ).show();
  }

  List<Widget> get taskCards => [
        QuestionTask(submoduleName),
        ABCTask(submoduleName),
        ARTask(submoduleName),
        PencilTask(submoduleName),
        PictureTask(submoduleName),
        MovieCameraTask(submoduleName),
        QuestionTask02(submoduleName),
        ABCTask02(submoduleName),
        ARTask02(submoduleName),
        PencilTask02(submoduleName),
        PictureTask02(submoduleName),
        MovieCameraTask02(submoduleName),
      ];
}
