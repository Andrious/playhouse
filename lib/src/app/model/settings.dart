// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:playhouse/src/view.dart'
    show
        AboutListTile,
        App,
        AppSettings,
        BuildContext,
        EdgeInsets,
        FlutterLogo,
        I10n,
        Icon,
        Icons,
        Padding,
        Prefs,
        RichText,
        SafeArea,
        SingleChildScrollView,
        StatelessWidget,
        TargetPlatform,
        TextSpan,
        TextStyle,
        Theme,
        ThemeData,
        VoidCallback,
        Widget;

class Settings {
  //
  static bool get(String setting) {
    if (setting == null || setting.trim().isEmpty) {
      return false;
    }
    return Prefs.getBool(setting, false);
  }

  static Future<bool> set(String setting, {bool on}) {
    if (setting == null || setting.trim().isEmpty) {
      return Future.value(false);
    }
    return Prefs.setBool(setting, on);
  }

  static bool getOrder() {
    return Prefs.getBool('order_of_items', false);
  }

  static Future<bool> setOrder({bool on}) {
    return Prefs.setBool('order_of_items', on);
  }

  static bool getLeftHanded() {
    return Prefs.getBool('left_handed', false);
  }

  static Future<bool> setLeftHanded({bool on}) {
    return Prefs.setBool('left_handed', on);
  }

  static StatelessWidget tapText(String text, VoidCallback onTap,
      {TextStyle style}) {
    return AppSettings.tapText(text, onTap, style: style);
  }

  static Widget aboutTile(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: AboutListTile(
          icon: const Icon(Icons.info),
          applicationIcon: const FlutterLogo(),
          applicationName: 'Playhouse',
          applicationVersion: 'Ver. ${App.version}',
          applicationLegalese: 'Grey & Ivy Inc.\n© 2021',
          aboutBoxChildren: aboutBoxChildren(context),
        ),
      ),
    );
  }

  static void showAboutDialog(BuildContext context) {
    //
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.bodyText1;
    final TextStyle linkStyle =
        themeData.textTheme.bodyText1.copyWith(color: themeData.accentColor);

    AppSettings.showAbout(
      context: context,
      applicationVersion: 'Ver. ${App.version}',
      applicationIcon: const FlutterLogo(),
      applicationLegalese: 'Grey & Ivy Inc.\n© 2021',
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    style: aboutTextStyle,
                    text: I10n.s(
                        '''This project is at its early-stage demonstrating the use of Augmented Reality (AR) technologies to teach, facilitate, and assist in Architectural pursuits.                         All on multiple platforms from a single codebase.''')),
                TextSpan(
                  style: aboutTextStyle,
                  text:
                      '\n\n${I10n.s('The source code is available on Github:')}',
                ),
                AppSettings.linkTextSpan(
                  style: linkStyle,
                  url: 'https://github.com/Andrious/workingmemory',
                  text: '\nWorking Memory',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static List<Widget> aboutBoxChildren(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.bodyText1;
    final TextStyle linkStyle =
        themeData.textTheme.bodyText1.copyWith(color: themeData.accentColor);
    return [
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  style: aboutTextStyle,
                  text:
                      'This is an early-stage, open-source project demonstrating '
                      'the use of the MVC design pattern with Flutter and produce '
                      "a 'ToDo List' application that works in "
                      '${AppSettings.defaultTargetPlatform == TargetPlatform.iOS ? 'multiple platforms' : 'iOS and Android'} '
                      'from a single codebase.'),
              TextSpan(
                style: aboutTextStyle,
                text: '.\n\nThe source code is available on Github:',
              ),
              AppSettings.linkTextSpan(
                style: linkStyle,
                url: 'https://github.com/Andrious/workingmemory',
                text: '\nWorking Memory',
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
