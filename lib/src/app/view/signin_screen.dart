// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart'
    show
        BoxDecoration,
        BoxShape,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Colors,
        Column,
        Container,
        CupertinoActivityIndicator,
        EdgeInsets,
        GestureDetector,
        Icon,
        Key,
        MainAxisAlignment,
        Navigator,
        Padding,
        Row,
        State,
        StateMVC,
        StatefulWidget,
        Widget;

import 'package:playhouse/src/controller.dart' show App, AppController;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);
  @override
  State createState() => _SignInState();
}

class _SignInState extends StateMVC<SignInScreen> {
  _SignInState() : super() {
    app = AppController();
  }
  AppController app;
  Widget working = Container();

  @override
  Widget build(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 40),
              child: GestureDetector(
                onTap: () async {
                  _working();
//                  final bool signIn = await app.signInWithFacebook();
                  const bool signIn = true;
                  if (signIn) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.facebook,
                    //                 color: Color(0xFF0084ff),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 40),
              child: GestureDetector(
                onTap: () async {
                  _working();
                  final bool signIn = await app.signInWithTwitter();
                  if (signIn) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.twitter,
                    //                 color: Color(0xFF0084ff),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 40),
              child: GestureDetector(
                onTap: () async {
                  _working();
                  final bool signIn = await app.signInEmailPassword(context);
                  if (signIn) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.envelope,
//                  color: Color(0xFF0084ff),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: () async {
                  _working();
//                  final bool signIn = await app.signInWithGoogle(context);
                  const bool signIn = true;
                  if (signIn) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.google,
                    //                 color: Color(0xFF0084ff),
                  ),
                ),
              ),
            ),
          ],
        ),
        working,
      ]);

  void _working() {
    working = App.useMaterial
        ? const Center(child: CircularProgressIndicator())
        : const Center(child: CupertinoActivityIndicator());
    setState(() {});
  }
}
