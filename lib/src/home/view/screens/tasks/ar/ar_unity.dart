// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The UI code
import 'package:playhouse/src/view.dart';

///
class ARUnityTask extends TaskCard {
  ///
  ARUnityTask(Map<String, dynamic> task, List<Map<String, dynamic>> userTask,
      {Key? key})
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
