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
//    final List<Widget> widgets = [LogInLogOut()];
    final List<Widget> widgets = [];

    final dataWidget = ListTile(
      title: const Text('Use Database'),
      subtitle: const Text('restart app to take effect'),
      trailing: CupertinoSwitch(
        value: Prefs.getBool('useDatabase'),
        onChanged: (bool value) {
          final useDatabase = Prefs.getBool('useDatabase');
          Prefs.setBool('useDatabase', !useDatabase);
          App.refresh();
        },
      ),
    );
    // Add to the drawer.
    widgets.add(dataWidget);

    if (App.inDebugger) {
      widgets.addAll([
        const Divider(),
        _DrawerWidget(
          const ModulesList(),
          icon: const Icon(Icons.view_agenda),
          title: I10n.t('Modules'),
        ),
        _DrawerWidget(
          const SubmodulesList(),
          icon: const Icon(Icons.view_compact),
          title: I10n.t('Submodules'),
        ),
        _DrawerWidget(
          const TasksList(),
          icon: const Icon(Icons.handyman),
          title: I10n.t('Tasks'),
        ),
        const Divider(),
        _DrawerWidget(
          const UsersList(),
          icon: const Icon(Icons.group),
          title: I10n.t('Users'),
        ),
        _DrawerWidget(
          const UsersModulesUnlocked(),
          icon: const Icon(Icons.group),
          title: I10n.t('Users Modules Unlocked'),
        ),
        _DrawerWidget(
          const UsersSubmodulesUnlocked(),
          icon: const Icon(Icons.group),
          title: I10n.t('Users Submodules Unlocked'),
        ),
        _DrawerWidget(
          const UsersTasksUnlocked(),
          icon: const Icon(Icons.group),
          title: I10n.t('Users Tasks Unlocked'),
        ),
        const Divider(),
        _DrawerWidget(
          const OrganizationsList(),
          icon: const Icon(Icons.business),
          title: I10n.t('Organizations'),
        ),
        _DrawerWidget(
          const OrganizationsModuleList(),
          icon: const Icon(Icons.business_outlined),
          title: I10n.t('Organizations Module'),
        ),
        _DrawerWidget(
          const OrganizationsSubmoduleList(),
          icon: const Icon(Icons.business_rounded),
          title: I10n.t('Organizations Submodule'),
        ),
        _DrawerWidget(
          const OrganizationsTaskList(),
          icon: const Icon(Icons.business_sharp),
          title: I10n.t('Organizations Task'),
        ),
        const Divider(),
      ]);
    }
    return Drawer(
      child: ListView(
        children: widgets,
      ),
    );
  }
}

class LogInLogOut extends StatelessWidget {
  LogInLogOut({Key key})
      : _appCon = AppController(),
        //       _auth = SignIn(),
        super(key: key);
  final AppController _appCon;
//  final SignIn _auth;

  @override
  Widget build(BuildContext context) {
//    final signedIn = _appCon.loggedIn && !_appCon.isAnonymous;
    const signedIn = true;
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
          // _auth.signOut().then((value) {
          //   Navigator.of(_appCon.context).pop();
          //   _appCon.refresh();
//          });
        } else {
//          unawaited(_appCon.signIn());
//           _appCon.signIn().then((value) {
//             Navigator.of(_appCon.context).pop();
//             _appCon.refresh();
//           });
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
