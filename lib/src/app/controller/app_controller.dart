// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// MVC framework

import 'package:flutter/foundation.dart' show FlutterExceptionHandler;

import 'package:firebase_core/firebase_core.dart' as f;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;

import 'package:playhouse/src/app/controller/authexample.dart';

import 'package:playhouse/src/model.dart'
    show
        DatabaseTest,
        ErrorWidgetBuilder,
        PlayhouseDB,
        Widget,
        WidgetsFlutterBinding;

import 'package:playhouse/src/view.dart'
    show App, BuildContext, showBox, ReportErrorHandler;

import 'package:mvc_application/controller.dart' as c;

import 'package:playhouse/src/controller.dart' show Auth;

class AppController extends c.AppController {
  AppController() : _auth = SignIn();
  //
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
}

class SignIn {
  factory SignIn() => _this ??= SignIn._();
  SignIn._() : _auth = Auth();
  static SignIn _this;
  final Auth _auth;

  bool get loggedIn => _loggedIn;
  bool _loggedIn;

  Future<bool> signIn() async {
    _loggedIn = await signInSilently();
    if (!_loggedIn) {
      _loggedIn = await signInAnonymously();
    }
    if (_auth.isAnonymous) {
//      FireBaseDB().removeAnonymous();
//      _auth.listener = _con?.recordDump;
    }
    return _loggedIn;
  }

  // 'disconnect' from Firebase
  Future<void> signOut() => _auth.signOut().then(_logInUser);

  Future<bool> signInAnonymously() => _auth.signInAnonymously();

  Future<bool> signInSilently() => _auth.signInSilently();

  Future<bool> signInWithFacebook() async {
    //   FireBaseDB().removeAnonymous();
    await _auth.delete();
    await signOut();
    final signIn = _auth.signInWithFacebook();
    return signIn;
  }
  //    List<String> items = App.packageName.split(".");

  Future<bool> signInWithTwitter() async {
    return true;
    //
//    final PackageInfo info = await PackageInfo.fromPlatform();
//
//     final List<String> items = info.packageName.split('.');
//
//     final String one = await _remoteConfig.getStringed(items[0]);
//     if (one.isEmpty) {
//       return false;
//     }
//     final String two = await _remoteConfig.getStringed(items[1]);
//     if (two.isEmpty) {
//       return false;
//     }
//     FireBaseDB().removeAnonymous();
//     await _auth.delete();
//     await signOut();
//
//     final bool signIn = await _auth
//         .signInWithTwitter(
//       key: one,
//       secret: two,
//     )
//         .catchError(getError);
//
//     if (!signIn) {
//       final Exception ex = _auth.getError();
//       await showBox(text: ex.toString(), context: _con?.state?.context);
//     }
//     return signIn;
  }

  Future<bool> signInEmailPassword(BuildContext context) async {
    //
    const String email = '';

    const String password = '';

//    FireBaseDB().removeAnonymous();
    await _auth.delete();
    await signOut();

    final bool signIn = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (!signIn) {
      final Exception ex = _auth.getError();
      await showBox(text: ex.toString(), context: context);
    }
    return signIn;
  }

  Future<bool> signInWithGoogle() async {
//    FireBaseDB().removeAnonymous();
    await _auth.delete();
    await signOut();
    final bool signIn = await _auth.signInWithGoogle();
    if (!signIn) {
      final Exception ex = _auth.getError();
      await showBox(text: ex.toString(), context: App.context);
    }
    await rebuild();
    return signIn;
  }

  // Stamp the user information to the firebase database.
//  void userStamp() => FireBaseDB().userStamp();

  Future<void> rebuild() async {
    _loggedIn = _auth.isLoggedIn();
    // refresh();
    // // Pops only if on the stack and not on the first screen.
    // final BuildContext context = _con?.state?.context;
    // if (context != null) {
    //   await Navigator.of(context).maybePop();
    // }
  }

  String get uid => _auth.uid;

  String get email => _auth.email;

  String get name => _auth.displayName;

  String get provider => _auth.providerId;

  bool get isNewUser => _auth.isNewUser;

  bool get isAnonymous => _auth.isAnonymous;

  String get photo => _auth.photoUrl;

  String get token => _auth.accessToken;

  String get tokenId => _auth.idToken;

  // /// Override if you like to customize error handling.
  // @override
  // void onError(FlutterErrorDetails details) {
  //   super.onError(details);
  // }

  void _logInUser(dynamic user) {
    //
    if (user != null) {
//      userStamp();
    }
    FirebaseCrashlytics.instance.setUserIdentifier(_auth.displayName);
  }
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

class Firebase {
  Firebase() : auth = FirebaseAuth.instance;

  final FirebaseAuth auth;
}
