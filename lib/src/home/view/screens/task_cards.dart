// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class QuestionTask extends TaskCard {
  QuestionTask(Map<String, dynamic> task, List<Map<String, dynamic>> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'questionMark',
        );
}

class ABCTask extends TaskCard {
  ABCTask(Map<String, dynamic> task, List<Map<String, dynamic>> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'abc',
        );
}

class ARTask extends TaskCard {
  ARTask(Map<String, dynamic> task, List<Map<String, dynamic>> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'AR',
        );

  @override
  Future<void> onTap() async {
    await con.openFullScreenRoute(const SimpleUnityScreen());
  }
}

class PencilTask extends TaskCard {
  PencilTask(Map<String, dynamic> task, List<Map<String, dynamic>> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'pencil',
        );
}

class PictureTask extends TaskCard {
  PictureTask(
    Map<String, dynamic> task,
    List<Map<String, dynamic>> userTask, {
    Key key,
    bool pickImage = false,
    bool infoIcon = true,
  }) : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'picture',
          pickImage: pickImage,
          infoIcon: infoIcon,
        );
}

class MovieCameraTask extends TaskCard {
  MovieCameraTask(
      Map<String, dynamic> task, List<Map<String, dynamic>> userTask,
      {Key key})
      : super(
          key: key,
          task: task,
          userTask: userTask,
          name: 'movieCamera',
        );
}

class PickPicture extends PictureTask {
  PickPicture(
    Map<String, dynamic> task,
    List<Map<String, dynamic>> userTask, {
    @required this.isCompleted,
    Key key,
  }) : super(
          task,
          userTask,
          pickImage: true,
          infoIcon: false,
          key: key,
        );
  final bool Function() isCompleted;

  @override
  bool completed() {
    //
    bool completed = super.completed();

    if (!completed) {
      //
      completed = isCompleted();
    }
    return completed;
  }
}

class TaskCard extends StatefulWidget {
  TaskCard({
    Key key,
    @required this.task,
    @required this.userTask,
    @required this.name,
    this.pickImage = false,
    this.infoIcon = true,
  })  : con = ScrapBookController(),
        image = PickImage(),
        super(key: key);

  final Map<String, dynamic> task;
  final List<Map<String, dynamic>> userTask;
  final String name;
  final bool pickImage;
  final bool infoIcon;

  final ScrapBookController con;
  final PickImage image;

  Widget get icon {
    final _TaskCardsState cardState = state;
    return cardState?.icon;
  }

  set icon(Widget image) {
    if (image != null) {
      final _TaskCardsState cardState = state;
      cardState?.icon = image;
    }
  }

  /// Determine if the current task is now completed.
  @mustCallSuper
  bool completed() {
    //
    final userId = con.userId;

    final taskId = task['rowid'];

    final unlocked = con.model.tasksUnlocked.items
        .where((rec) => rec['user_id'] == userId && rec['task_id'] == taskId)
        .toList();

    return unlocked.isNotEmpty && unlocked[0]['completed'] == 1;
  }

  /// Override with subclasses.
  void onTap() => con.onTap(this);

  /// Override with subclasses.
  void onTapInfo() => con.onTapInfo(this);

  @override
  // ignore: no_logic_in_create_state
  State createState() => _TaskCardsState();
}

class _TaskCardsState extends State<TaskCard> with StateMap {
  //
  TaskCard card;
  Widget icon;

  @override
  void initState() {
    super.initState();
    card = widget;
    card.image.initState(card);
    icon ??= Image.asset('assets/images/${card.name.trim()}02.jpg');
  }

  @override
  void dispose() {
    widget.image.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (card.name.isEmpty) {
      return Container();
    }
    return Card(
      child: FutureBuilder<Widget>(
        future: _cardContent(),
        initialData: icon,
        builder: (_, snapshot) => _futureBuilder(snapshot),
      ),
    );
  }

  Future<Widget> _cardContent() async {
    //
    Widget widget;

    if (card.pickImage) {
      widget = await card.image.getImage();
    }

    if (widget != null) {
      //
      widget = InkWell(
        onTap: card.onTap,
        highlightColor: const Color(0xffbb86fc),
        child: widget,
      );
    } else {
      //
      final List<Widget> widgets = [];

      if (card.infoIcon) {
        //
        if (card.completed()) {
          //
          widgets.add(
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
//                onTap: card.onTapInfo,
                  highlightColor: const Color(0xffbb86fc),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('assets/images/check_mark.jpg')),
                ),
              ),
            ),
          );
        } else {
          widgets.add(
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: card.onTapInfo,
                  highlightColor: const Color(0xffbb86fc),
                  child: Image.asset('assets/images/info.jpg'),
                ),
              ),
            ),
          );
        }
      }

      widgets.add(
        Flexible(
          flex: 3,
          child: Center(
            child: InkWell(
              onTap: card.onTap,
              highlightColor: const Color(0xffbb86fc),
              child: icon,
            ),
          ),
        ),
      );

      // widget = Stack(
      //   alignment: AlignmentDirectional.topEnd,
      //   children: widgets,
      // );

      widget = Column(children: widgets);

      // If all the tasks are locked.
      if (card.con.submodule['first_locked'] == 1) {
        //
        widget = Stack(
          children: [
            widget,
            const Padding(
              padding: EdgeInsets.all(10),
              child: Opacity(
                opacity: 0.6,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(),
                ),
              ),
            ),
          ],
        );
        // If this task card is locked.
      } else if (card.task['first_locked'] == 1) {
        //
        widget = Stack(
          children: [
            widget,
            Padding(
              padding: const EdgeInsets.all(10),
              child: card.con.lockImage,
            ),
          ],
        );
      }
    }
    return widget;
  }

  Widget _futureBuilder(AsyncSnapshot<Widget> snapshot) {
    if (snapshot.hasError) {
      final dynamic exception = snapshot.error;
      final details = FlutterErrorDetails(
        exception: exception,
        stack: exception is Error ? exception.stackTrace : null,
        library: 'app_statefulwidget',
        context: ErrorDescription('While getting ready in FutureBuilder Async'),
      );
      return App.errorHandler.displayError(details);
    } else if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasData) {
        return snapshot.data;
      } else {
        return icon;
      }
    } else {
      Widget widget;
      if (UniversalPlatform.isAndroid) {
        widget = const Center(child: CircularProgressIndicator());
      } else {
        widget = const Center(child: CupertinoActivityIndicator());
      }
      return widget;
    }
  }
}
