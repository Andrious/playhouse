// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

class ScrapBookDrawer extends StatelessWidget {
  const ScrapBookDrawer({Key key, this.state}) : super(key: key);

  final StateMVC state;

  @override
  Widget build(BuildContext context) {
//    final ControllerMVC con = state.controllerByType<c.HomeDrawer>();
    return Drawer(
      child: ListView(
        children: <Widget>[
          // con.header,
          // con.darkmode,
          // con.account,
          // con.orders,
          // con.settings,
          // con.about,
          // con.contact,
          // con.logout,
        ],
      ),
    );
  }
}
