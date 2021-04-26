// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

class TasksListAndroid extends ScrapbookListScreen<TasksList, TasksFields>
    with ScrapbookFields {
//

  @override
  String title = 'Tasks List';

  @override
  bool useModuleType = false;
  @override
  bool useLocked = false;
  @override
  bool useName = true;
  @override
  bool useDescription = true;
  @override
  bool useKeyArt = false;
  @override
  bool useTimeStamp = true;
  @override
  bool useEmail = false;
  @override
  bool usePhone = false;
  @override
  bool useCompleted = false;
  @override
  bool useDeleted = false;

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>>
  fetchData() => TasksFields().field.values.toList();
}
