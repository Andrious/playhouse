// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';


class OrganizationsList extends StatefulWidget {
  const OrganizationsList({Key key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State createState() => App.useMaterial ? OrganizationsAndroid() : OrganizationsiOS();
}
