// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:fluttery_framework/controller.dart' as c;
import 'package:playhouse/src/controller.dart';
import 'package:playhouse/src/model.dart';
import 'package:playhouse/src/view.dart';

/// The Controller for the app.
class ScrapBookController extends c.AppController {
  ///
  factory ScrapBookController([StateX? state]) =>
      _this ??= ScrapBookController._(state);

  ScrapBookController._([StateX? state])
      : model = ScrapBookModel(),
        lockImage = Opacity(
          opacity: 0.6,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(5, 5),
                      blurRadius: 5)
                ]),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset('assets/images/submodules/lock.png'),
              ),
            ),
            //           child: Center(child: Image.asset('assets/images/submodules/lock.png')),
          ),
        ),
        super(state) {
    _completer = const CompleteIndicator();
  }

  static ScrapBookController? _this;

  ///
  final ScrapBookModel model;

  ///
  final Widget lockImage;

  late String _inModuleTypeScreen;

  /// The current user
  late int userId;

  /// The current module being viewed.
  Map<String, dynamic>? module;

  /// The current submodule being viewed.
  late Map<String, dynamic>? submodule;

  /// The current tasks being viewed.
  late List<Map<String, dynamic>> tasks;

  /// The current task being viewed.
  late Map<String, dynamic>? task;

  /// The tasks currently completed.
  late List<Map<String, dynamic>> savedTask;

  ///
  double percentComplete = 0;

  /// The list of task cards.
  late List<Widget> _taskCards;

  /// The current task card.
  late TaskCard? card;

  /// A graphical indication of Task completion.
  late CompleteIndicator _completer;

  ///
  int get initialIndex => Prefs.getInt('ModuleTypeIndex');

  ///
  set initialIndex(int index) => Prefs.setInt('ModuleTypeIndex', index);

  ///
  int get initModuleIndex => Prefs.getInt('${moduleType}ModulesIndex');

  ///
  List<String> get moduleTypes => ['Discover', 'Design', 'Build'];

  ///
  String moduleType = '';

  ///
  Map<String, State>? subModuleStates = {};

  @override
  Future<bool> initAsync() async {
    if (App.inDebugMode) {
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

    // Open the data tables
    final bool init = await model.initAsync();

    //Identify the current user
    userId = model.users.items[0]['rowid'];

    // Align to the right data depending on the 'type' of Modules.
    initTypeOfModules();

    return init;
  }

  ///
  List<Map<String, dynamic>> get modules => _modules;
  late List<Map<String, dynamic>> _modules;

  /// Align to the right data depending on the 'type' of Modules.
  void initTypeOfModules([int? index]) {
    //
    index ??= initialIndex;

    moduleType = moduleTypes[index];

    initModules(moduleType);

    initModule(initModuleIndex);
  }

  ///
  List<Map<String, dynamic>> initModules(String? moduleType) {
    //
    final modules = model.modules.items;

    if (moduleType == null || moduleType.trim().isEmpty) {
      _modules = modules;
    } else {
      _modules = modules
          .where((module) => module['module_type'] == moduleType.trim())
          .toList(growable: false);

      // Identify the user
      final userId = model.users.items[0]['rowid'];

      // Determine what may be locked or not.
      final unlockedModules = model.modulesUnlocked.items
          .where((rec) => rec['user_id'] == userId)
          .toList(growable: false);

      if (unlockedModules.isNotEmpty) {
        for (final module in _modules) {
          if (unlockedModules.isEmpty) {
            break;
          }
          for (final unlocked in unlockedModules) {
            if (unlocked['module_id'] == module['rowid']) {
              module['first_locked'] = 0;
              unlockedModules.remove(unlocked);
            }
          }
        }
      }
    }
    return _modules;
  }

  ///
  void initModule(int index) {
    //
    setModule(index);

    final subs = initSubmodules();

    initTasks(subs[0]);
  }

  ///
  Map<String, dynamic>? setModule(int index) {
    //
    final recs = modules;

    // _tabController must be defined first.
    if (recs.isEmpty) {
      module = null;
    } else {
      // Record the 'last' tab visited.
      Prefs.setInt('${moduleType}ModulesIndex', index);
      module = recs[index];
    }
    // Explicitly assign the 'first' Submodule State object to the Controller.
    // At times, it's necessary as the Tabs don't call State object's setState()
//      addState(subModuleStates![moduleType + module!['name']] as StateMVC);
    State? state;
    if (subModuleStates == null) {
      state = null;
    } else {
      state = subModuleStates![moduleType + module!['name']];
    }

    if (state != null) {
      addState(state as StateX);
    }

    return module;
  }

  ///
  List<Map<String, dynamic>> get submodules => _submodules;
  late List<Map<String, dynamic>> _submodules;

  /// initModules() must be called first
  List<Map<String, dynamic>> initSubmodules() {
    //
    final id = module!['rowid'];

    _submodules =
        model.submodules.items.where((rec) => rec['module_id'] == id).toList();

    // Propagate the lock if the parent is currently locked.
    if (module!['first_locked'] == 1) {
      for (final submodule in _submodules) {
        submodule['first_locked'] = 1;
      }
    }
    return _submodules;
  }

  /// initSubmodules() must be called first
  List<Map<String, dynamic>> initTasks(Map<String, dynamic>? submodule) {
    //
    percentComplete = 0;

    /// Current completed tasks
    savedTask = [];

    // Record the current submodule being viewed.
    this.submodule = submodule;

    // Important to 'nullify' everything if passed null.
    if (submodule == null) {
      return tasks = [];
    }

    final id = submodule['rowid'];

    /// Current tasks displayed
    tasks = model.tasks.items
        .where((record) => record['submodule_id'] == id)
        .toList();

    final List<TaskCard> cards = [];

    for (var cnt = 0; cnt < tasks.length; cnt++) {
      //
      tasks[cnt]['submodule'] = submodule['name'];

      // Propagate the lock if the parent is currently locked.
      if (submodule['first_locked'] == 1) {
        tasks[cnt]['first_locked'] = 1;
      }

      final task = model.usersTasks.items
          .where((rec) => rec['task_id'] == tasks[cnt]['rowid'])
          .toList();

      final card = addCard(tasks[cnt], task.isEmpty ? [{}] : task);

      if (card != null) {
        cards.add(card);
      }

      savedTask.addAll(task);
    }

    // Populate the getter!
    _taskCards = cards;

    if (savedTask.isNotEmpty) {
      percentComplete = savedTask.length / tasks.length;
    }

    return tasks;
  }

  /// Update the completion percentage and display it.
  void calcCompletion() {
    savedTask = model.usersTasks.items;
    percentComplete = savedTask.length / tasks.length;
    completer.setCompletion();
  }

  ///
  List<Map<String, dynamic>> unlockedTasks() {
    final userTask = model.usersTasks.savedRec;

    final userId = userTask['user_id'];

    final taskId = userTask['task_id'];

    return model.tasksUnlocked.items
        .where((rec) => rec['user_id'] == userId && rec['task_id'] == taskId)
        .toList();
  }

  ///
  TaskCard? addCard(
      Map<String, dynamic> task, List<Map<String, dynamic>> savedTask) {
    //
    TaskCard? card;

    final index = [
      'question',
      'abc',
      'AR',
      'pencil',
      'picture',
      'movie',
    ].indexWhere(task['key_art_file'].contains);

    switch (index) {
      case 0:
        card = questionTasks(task, savedTask);
        break;
      case 1:
        card = abcTasks(task, savedTask);
        break;
      case 2:
        card = arTasks(task, savedTask);
        break;
      case 3:
        card = pencilTasks(task, savedTask);
        break;
      case 4:
        card = pictureTasks(task, savedTask);
        break;
      case 5:
        card = movieTasks(task, savedTask);
        break;
      default:
        card = null;
    }
    return card;
  }

  /// Return the text label specified in the Tab object.
  String tabLabel(Tab tab) {
    String label = '';
    // If not a Text widget
    if (tab.text == null) {
      if (tab.child is Text) {
        label = (tab.child as Text).data!;
      } else {
        try {
          label = (tab.child as dynamic).data;
        } catch (ex) {
          label = '';
        }
      }
    } else {
      label = tab.text!;
    }
    return label;
  }

  /// Merely tapping the Task Card
  Future<void> onTap(TaskCard card) async {
    if (card.pickImage) {
      await card.image.pickImage();
    } else {
      await openFullScreenRoute(
        TaskScreen(card: card),
      );
    }
    card.completed();
    calcCompletion();
    card.setState(() {});
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
    await Navigator.of(App.context!).push(route);
  }

  ///
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
            Navigator.pop(App.context!);
          },
          child: const Text('Continue'),
        )
      ],
      // context: App.context,
    ).show();
  }

  ///
  List<Widget> get taskCards => _taskCards;

  /// A graphical indication of Task completion.
  CompleteIndicator get completer => _completer;

  @override
  void dispose() {
    subModuleStates?.clear();
    subModuleStates = null;
    super.dispose();
  }
}
