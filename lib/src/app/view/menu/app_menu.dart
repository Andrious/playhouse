// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The Data code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart'
    show
    App,
    DialogBox,
    I10n,
    ISOSpinner,
    Menu,
    PopupMenuItem,
    Prefs,
    Text,
    UniversalPlatform,
    unawaited;

import 'package:playhouse/src/controller.dart';

import 'package:universal_platform/universal_platform.dart';

class AppMenu extends Menu {
  AppMenu() : super() {
    _appCon = AppController();

    if (_appCon.loggedIn) {
      if (_appCon.isAnonymous) {
        tailItems = [
          PopupMenuItem(value: 'SignIn', child: I10n.t('Sign in...')),
        ];
      } else {
        tailItems = [
          PopupMenuItem(value: 'Logout', child: I10n.t('Logout')),
        ];
      }
    } else {
      tailItems = [
        PopupMenuItem(value: 'SignIn', child: I10n.t('Sign in...')),
      ];
    }
  }
  AppController _appCon;

  @override
  List<PopupMenuItem<dynamic>> menuItems() => [
    PopupMenuItem(
        value: 'interface',
        child: Text('${I10n.s('Interface:')} $interface')),
    PopupMenuItem(
        value: 'Locale',
        child: Text('${I10n.s('Locale:')} ${App.locale.toLanguageTag()}')),
  ];

  // Supply what the interface
  String get interface => App.useMaterial ? 'Material' : 'Cupertino';

  @override
  Future<void> onSelected(dynamic menuItem) async {
    switch (menuItem) {
      case 'interface':
        App.changeUI(App.useMaterial ? 'Cupertino' : 'Material');
        bool switchUI;
        if (App.useMaterial) {
          if (UniversalPlatform.isAndroid) {
            switchUI = false;
          } else {
            switchUI = true;
          }
        } else {
          if (UniversalPlatform.isAndroid) {
            switchUI = true;
          } else {
            switchUI = false;
          }
        }
        await Prefs.setBool('switchUI', switchUI);
        break;
      case 'Locale':
      // await MsgBox(
      //   context: context,
      //   title: I10n.s('Current Language'),
      //   msg: I10n.s('Pick another:'),
      //   body: const [ISOSpinner()],
      // ).show();

        final initialItem = I10n.supportedLocales.indexOf(App.locale);
        final spinner = ISOSpinner(initialItem: initialItem);

        await DialogBox(
          context: _appCon.state.context,
          title: I10n.s('Current Language'),
          body: [spinner],
          press01: () {
            spinner.onSelectedItemChanged(initialItem);
          },
          press02: () {},
          switchButtons: Settings.getLeftHanded(),
        ).show();

        break;
      case 'Logout':
        _appCon.logOut();
        break;
      case 'SignIn':
        unawaited(_appCon.signIn());
        break;
      default:
    }
  }
}
