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
class ThreePicturesScreen extends StatefulWidget {
  ///
  const ThreePicturesScreen(this.parent, {super.key});

  ///
  final PanelScreenState parent;
  @override
  State createState() => _ThreePicturesScreenState();
}

class _ThreePicturesScreenState extends StateX<ThreePicturesScreen>
    with StateSet {
  _ThreePicturesScreenState() : super(controller: ScrapBookController()) {
    con = controller as ScrapBookController;
  }
  late ScrapBookController con;
  late PanelScreenState parent;

  List<Widget> threePics = [];

  @override
  void initState() {
    super.initState();
    parent = widget.parent;
    initPics();
  }

  @override
  Widget buildAndroid(BuildContext context) => Flexible(
        flex: parent.isPanelUp ? 30 : 2,
        child: LimitedBox(
          maxHeight: MediaQuery.of(context).size.height * parent.maxHeight,
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            primary: false,
            addRepaintBoundaries: false,
            children: threePics,
          ),
        ),
      );

  void initPics() {
    //
    final length = con.card!.userTask.length;

    for (int cnt = 0; cnt <= 2; cnt++) {
      if (cnt < length) {
        threePics.add(PickPicture(
          con.card!.task,
          [con.card!.userTask[cnt]],
          isCompleted: completed,
        ));
      } else {
        threePics.add(PickPicture(
          con.card!.task,
          const [{}],
          isCompleted: completed,
        ));
      }
    }
  }

  bool completed() {
    //
    final userTask = con.model.usersTasks.savedRec;

    final userId = userTask['user_id'];

    final taskId = userTask['task_id'];

    final userTasks = con.model.usersTasks.items
        .where((rec) => rec['user_id'] == userId && rec['task_id'] == taskId)
        .toList();

    final completed = userTasks.length == 3;

    if (completed) {
      //
      final recList = con.model.tasksUnlocked.items
          .where((rec) => rec['user_id'] == userId && rec['task_id'] == taskId)
          .toList();

      Map<String, dynamic> rec;

      if (recList.isEmpty) {
        rec = {'user_id': userId, 'task_id': taskId};
      } else {
        //
        rec = recList[0];
      }
      // Don't bother if already 'completed'
      if (rec['completed'] == null || rec['completed'] == 0) {
        //
        if (rec['user_id'] == null) {
          //
          rec['user_id'] = userId;

          rec['task_id'] = taskId;
        }
        rec['completed'] = 1; // true

        con.model.tasksUnlocked.save(rec);
      }
    }
    return completed;
  }
}
