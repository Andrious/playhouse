// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart' show FlutterExceptionHandler;

import 'package:firebase_core/firebase_core.dart' as f;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;

import 'package:playhouse/src/app/controller/authexample.dart';

import 'package:playhouse/src/model.dart'
    show
        ErrorWidgetBuilder,
        Firebase,
        PlayhouseDB,
        Widget,
        WidgetsFlutterBinding;

import 'package:playhouse/src/view.dart';

import 'package:mvc_application/controller.dart' as c;

import 'package:playhouse/src/controller.dart' show SignIn;

class AppController extends c.AppController {
  factory AppController() => _this ??= AppController._();
  AppController._() : _auth = SignIn();
  static AppController _this;

  final SignIn _auth;

  @override
  Future<bool> initAsync([BuildContext context]) async {
    // c.WidgetsFlutterBinding.ensureInitialized();
    // //todo: Comment this out to test the error handling.
    // await f.Firebase.initializeApp();
    //
    // final auth1 = Firebase().auth;
    //
    // var user = auth.currentUser;

    bool init = await _auth.signIn();

    /// todo: Remove and replace with more substantial routine.
    if (init) {
      //
      if (App.inDebugger) {
        // final test = DatabaseTest();
        //
        // if (!test.createDB()) {}
      }
      final database = PlayhouseDB();

      init = await database.downloadDB();
    }
    return init;
  }

  Future<void> signIn() async {
    await Navigator.push(App.context,
        MaterialPageRoute<void>(builder: (context) => const SignInScreen()));
    refresh();
  }

  Future<bool> signInWithFacebook() async {
    Firebase().removeAnonymous();
    await _auth.delete();
    await signOut();
    final signIn = _auth.signInWithFacebook();
    return signIn;
  }

  Future<bool> signInWithTwitter() async {
    return Future.value(false);
    // //
    // final PackageInfo info = await PackageInfo.fromPlatform();
    //
    // final List<String> items = info.packageName.split('.');
    //
    // final String one = await _remoteConfig.getStringed(items[0]);
    // if (one.isEmpty) {
    //   return false;
    // }
    // final String two = await _remoteConfig.getStringed(items[1]);
    // if (two.isEmpty) {
    //   return false;
    // }
    // FireBaseDB().removeAnonymous();
    // await _auth.delete();
    // await signOut();
    //
    // final bool signIn = await _auth
    //     .signInWithTwitter(
    //   key: one,
    //   secret: two,
    // )
    //     .catchError(getError);
    //
    // if (!signIn) {
    //   final Exception ex = _auth.getError();
    //   await showBox(text: ex.toString(), context: _con?.state?.context);
    // }
    // return signIn;
  }

  Future<bool> signInEmailPassword(BuildContext context) async {
    //
    const String email = '';

    const String password = '';

    Firebase().removeAnonymous();
    await _auth.delete();
    await signOut();

    final bool signIn = await _auth.signInEmailPassword(context,
      email: email,
      password: password,
    );

    if (!signIn) {
      final Exception ex = _auth.getError();
      await showBox(text: ex.toString(), context: context);
    }
    return signIn;
  }

  Future<bool> signInWithGoogle(BuildContext context) async {
//    Firebase().removeAnonymous();
//    await _auth.delete();
    await signOut();
    final bool signIn = await _auth.signInWithGoogle();
    if (!signIn) {
      final Exception ex = _auth.getError();
      await showBox(text: ex.toString(), context: context);
    }
    rebuild();
    return signIn;
  }

  // logout and refresh
  void logOut() {
    signOut();
    rebuild();
  }

  // 'disconnect' from Firebase
  Future<void> signOut() => _auth.signOut().then(_logInUser);

  void _logInUser(dynamic user) {
    //
    if (user != null) {
      userStamp();
    }
    FirebaseCrashlytics.instance.setUserIdentifier(_auth.name);
  }

  // Stamp the user information to the firebase database.
  void userStamp() => Firebase().userStamp();

  String get uid => _auth.uid;

  String get email => _auth.email;

  String get name => _auth.name;

  String get provider => _auth.provider;

  bool get isNewUser => _auth.isNewUser;

  bool get isAnonymous => _auth.isAnonymous;

  String get photo => _auth.photo;

  String get token => _auth.token;

  String get tokenId => _auth.tokenId;

  /// Is the user 'logged in' through a third-party (ex. Google or Facebook)
  bool get loggedIn => _auth.loggedIn;
}

/// Incorporate FirebaseCrashlytics into the app.
// ignore: avoid_void_async
void runApp(
  Widget app, {
  FlutterExceptionHandler handler,
  ErrorWidgetBuilder builder,
  ReportErrorHandler report,
  bool allowNewHandlers = false,
}) async {
  /// If nothing is specified, turn to Firebase Crashlytics
  if (handler == null && report == null) {
    // Allow for FirebaseCrashlytics.instance
    WidgetsFlutterBinding.ensureInitialized();

    // Allow for FirebaseCrashlytics.instance
    await f.Firebase.initializeApp();

    // Supply Firebase Crashlytics
    final crash = FirebaseCrashlytics.instance;

    handler = crash.recordFlutterError;

    report = crash.recordError;

    // If true, then crash reporting data is sent to Firebase.
    await crash.setCrashlyticsCollectionEnabled(!App.inDebugger);
  }

  /// Assign the appropriate error handler.
  c.runApp(
    app,
    errorHandler: handler,
    errorScreen: builder,
    errorReport: report,
    allowNewHandlers: allowNewHandlers,
  );
}
