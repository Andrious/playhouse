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
          LogInLogOut(),
          const Divider(),
          const _DrawerWidget(
            OrganizationsList(),
            icon: Icon(Icons.business),
            title: Text('Organizations'),
          ),
        ],
      ),
    );
  }
}

class LogInLogOut extends StatelessWidget {
  LogInLogOut({Key key})
      : _appCon = AppController(),
        _auth = SignIn(),
        super(key: key);
  final AppController _appCon;
  final SignIn _auth;

  @override
  Widget build(BuildContext context) {
    final signedIn = _appCon.loggedIn && !_appCon.isAnonymous;
    String title;
    IconData icon;
    if (signedIn) {
      title = 'Sign out';
      icon = Icons.logout;
    } else {
      title = 'Sign in...';
      icon = Icons.login;
    }
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: I10n.t(title),
      onTap: () {
        if (signedIn) {
          _auth.signOut().then((value) {
            Navigator.of(_appCon.context).pop();
            _appCon.refresh();
          });
        } else {
//          unawaited(_appCon.signIn());
          _appCon.signIn().then((value) {
            Navigator.of(_appCon.context).pop();
            _appCon.refresh();
          });
        }
      },
    );
  }
}

class _DrawerWidget extends StatelessWidget {
  const _DrawerWidget(
    this.widget, {
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  final Icon icon;
  final Text title;
  final Widget widget;

  @override
  Widget build(BuildContext context) => ListTile(
        leading: icon ?? const Icon(Icons.arrow_right),
        title: title ?? const Text('Option'),
        onTap: () => _openRoute(widget),
      );

  /// Open the supplied widget in a new route.
  Future<void> _openRoute(Widget widget) async {
    final Route<Map<String, dynamic>> route = MaterialPageRoute(
      builder: (BuildContext context) => widget,
      fullscreenDialog: true,
    );
    await Navigator.of(App.context).push(route);
  }
}
