// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The Data code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart'
    show
        App,
        AppStateExtension,
        DialogBox,
        ISOSpinner,
        L10n,
        PopupMenuItem,
        Prefs,
        Text,
        UniversalPlatform;

import 'package:playhouse/src/controller.dart';

class AppMenu {
  /// Only one instance of the class
  factory AppMenu() => _this ??= AppMenu._();
  static AppMenu? _this;

  AppMenu._() {
    //
    App.menu.key = const Key('appMenuButton');

    /// When an menu item is selected
    App.menu.onSelected = (String value) async {
      switch (value) {
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
          //   title: L10n.s('Current Language'),
          //   msg: L10n.s('Pick another:'),
          //   body: const [ISOSpinner()],
          // ).show();
          final locales = App.supportedLocales!;

          final initialItem = locales.indexOf(App.locale!);

          final spinner = ISOSpinner(
            initialItem: initialItem,
            supportedLocales: locales,
            onSelectedItemChanged: (int index) async {
              final List<Locale> localesList = locales;
//            if (localesList != null) {
              App.locale = localesList[index];
              await Prefs.setString(
                  'locale', localesList[index].toLanguageTag());
              App.refresh();
//            }
            },
          );

          await DialogBox(
//          context: _appCon.state.context,
            title: L10n.s('Current Language'),
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
          //       unawaited(_appCon.signIn());
          break;
        default:
      }
    };
  }
  late AppController _appCon;

  /// Supply the app's popupmenu
  /// a mutable menu
  Widget get popupMenuButton {
    /// Supply the menu options
    App.menu.menuEntries = [
      PopupMenuItem(
          value: 'interface',
          child: Text('${L10n.s('Interface:')} $interface')),
      PopupMenuItem(
          value: 'Locale',
          child: Text('${L10n.s('Locale:')} ${App.locale!.toLanguageTag()}')),
    ];
    return App.menu.popupMenuButton;
  }

  // Supply what the interface
  String get interface => App.useMaterial ? 'Material' : 'Cupertino';
}
