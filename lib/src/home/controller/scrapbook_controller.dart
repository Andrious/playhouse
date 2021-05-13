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

    bool init = await model.initAsync();

    return init;
  }

  bool inBuildScreen = false;

  String moduleType = '';

  String module = '';

  String submodule = '';

  List<Widget> _taskCards;

  /// Return the text label specified in the Tab object.
  String tabLabel(Tab tab) {
    String label = '';
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

  Future<void> onTap() async {

  }

  Future<void> onTapInfo() async {

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

    // await MsgBox(
    //         title: 'Task',
    //         msg:
    //             "This is a description of this card's task and what you need to do accomplish it!'\n\nWould you like to start doing this task?",
    //         context: App.context)
    //     .show();
  }

  List<Widget> taskCards(String submodule) => [
        QuestionTask(submodule),
        ABCTask(submodule),
        ARTask(submodule),
        PencilTask(submodule),
        PictureTask(submodule),
        MovieCameraTask(submodule),
        QuestionTask02(submodule),
        ABCTask02(submodule),
        ARTask02(submodule),
        PencilTask02(submodule),
        PictureTask02(submodule),
        MovieCameraTask02(submodule),
      ];
}
