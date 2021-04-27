// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key key}) : super(key: key);

  @override
  State createState() => App.useMaterial ? UsersListAndroid() : UsersListiOS();
}
