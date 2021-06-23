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

    final bool init = await model.initAsync();

    return init;
  }

  int get initialIndex => Prefs.getInt('DesignBuildIndex');

  String moduleType = '';

  List<Map<String, dynamic>> get modules => _modules;
  List<Map<String, dynamic>> _modules;

  List<Map<String, dynamic>> initModules(String moduleType) {
    //
    final modules = model.modules.items;

    if (moduleType == null || moduleType.trim().isEmpty) {
      _modules = modules;
    } else {
      _modules = modules
          .where((module) => module['module_type'] == moduleType.trim())
          .toList(growable: false);
    }
    return _modules;
  }

  void initTasks() {
    //
    final id = submodule['rowid'];

    final tasks = model.tasks.items
        .where((record) => record['submodule_id'] == id)
        .toList();

    final List<TaskCard> cards = [];

    int counter = -1;

    for (var cnt = 0; cnt < tasks.length; cnt++) {
      //
      tasks[cnt]['submodule'] = submodule['name'];

      final savedTask = model.usersTasks.items
          .where((rec) => rec['task_id'] == tasks[cnt]['rowid'])
          .toList();

      final card = addCard(tasks[cnt], savedTask.isEmpty ? {} : savedTask[0]);

      if (card != null) {
        cards.add(card);
      }
    }
    // Populate the getter!
    _taskCards = cards;
  }

  TaskCard addCard(Map<String, dynamic> task, Map<String, dynamic> savedTask) {
    //
    TaskCard card;

    final String file = task['key_art_file'];

    final index = ['question', 'abc', 'AR', 'picture', 'pencil', 'movie']
        .indexWhere(file.contains);

    switch (index) {
      case 0:
        card = QuestionTask(task, savedTask);
        break;
      case 1:
        card = ABCTask(task, savedTask);
        break;
      case 2:
        card = ARTask(task, savedTask);
        break;
      case 3:
        card = PencilTask(task, savedTask);
        break;
      case 4:
        card = PictureTask(task, savedTask);
        break;
      case 5:
        card = MovieCameraTask(task, savedTask);
        break;
      default:
        card = null;
    }
    return card;
  }

  bool inBuildScreen = false;

  Map<String, dynamic> module;

  Map<String, dynamic> submodule;

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
  Future<void> onTap(TaskCard card) async {
    await openFullScreenRoute(TaskScreen(card: card));
    setState(() {});
  }

  /// Tapping the 'info' icon on the Task Card
  Future<void> onTapInfo(TaskCard card) async {
    await onTap(card);
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

  List<Widget> get taskCards => _taskCards;
}
