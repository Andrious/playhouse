// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart' show FlutterExceptionHandler;

import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;

import 'package:firebase_core/firebase_core.dart' as f;

import 'package:flutter/foundation.dart'
    show LicenseEntryWithLineBreaks, LicenseRegistry;

import 'package:flutter/services.dart' show rootBundle;

//import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:fluttery_framework/controller.dart' as c;

import 'package:playhouse/src/controller.dart' show SignIn;

///
class AppController extends c.AppController {
  ///
  factory AppController() => _this ??= AppController._();
  AppController._();
//  : _auth = SignIn();
  static AppController? _this;

//  final SignIn _auth;

  @override
  Future<bool> initAsync([BuildContext? context]) async {
    // c.WidgetsFlutterBinding.ensureInitialized();
    // //todo: Comment this out to test the error handling.
    // await f.Firebase.initializeApp();
    //
    // final auth1 = Firebase().auth;
    //
    // var user = auth.currentUser;

//    final bool init = await _auth.signIn();

    final init = await _setErrorHandler();
    return init;
  }

  /// Define the error handling
  Future<bool> _setErrorHandler() async {
    /// Incorporate FirebaseCrashlytics into the app.
    // Allow for FirebaseCrashlytics.instance
    WidgetsFlutterBinding.ensureInitialized();

    // Allow for FirebaseCrashlytics.instance
    await f.Firebase.initializeApp();

    // Supply Firebase Crashlytics
    final crash = FirebaseCrashlytics.instance;

    final set = AppErrorHandler.set(
        handler: crash.recordFlutterError, report: crash.recordError);

    // If true, then crash reporting data is sent to Firebase.
    await crash.setCrashlyticsCollectionEnabled(!App.inDebugMode);

    return true;
  }

  @override
  void initState() {
    super.initState();
    LicenseRegistry.addLicense(() async* {
      var licence = await rootBundle.loadString('assets/google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], licence);
      licence = await rootBundle.loadString('assets/google_fonts/UFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], licence);
    });
  }

  /// Return the 'last' context used in this app.
  BuildContext get context => App.context!;

  // Future<void> signIn() async {
  //   await Navigator.push(App.context,
  //       MaterialPageRoute<void>(builder: (context) => const SignInScreen()));
  //   refresh();
  // }

  // Future<bool> signInWithFacebook() async {
  //   if (App.inDebugger) {
  //     FirebaseUser().removeAnonymous();
  //     await _auth.delete();
  //     await signOut();
  //     return _auth.signInWithFacebook();
  //   } else {
  //     await MsgBox(
  //             title: 'Playhouse Under Development',
  //             msg: 'Facebook not yet implemented.\nSign in with Google!',
  //             context: context)
  //         .show();
  //     return Future.value(false);
  //   }
  // }

  ///
  Future<bool> signInWithTwitter() async {
    await MsgBox(
            title: 'Playhouse Under Development',
            msg: 'Twitter not yet implemented.\nSign in with Google!',
            context: context)
        .show();
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

  ///
  Future<bool> signInEmailPassword(BuildContext context) async {
    await MsgBox(
            title: 'Playhouse Under Development',
            msg: 'Email not yet implemented.\nSign in with Google!',
            context: context)
        .show();
    return Future.value(false);
    // //
    // const String email = '';
    //
    // const String password = '';
    //
    // FirebaseUser().removeAnonymous();
    // await _auth.delete();
    // await signOut();
    //
    // final bool signIn = await _auth.signInEmailPassword(
    //   context,
    //   email: email,
    //   password: password,
    // );
    //
    // if (!signIn) {
    //   final Exception ex = _auth.getError();
    //   await showBox(text: ex.toString(), context: context);
    // }
    // return signIn;
  }

  // Future<bool> signInWithGoogle(BuildContext context) async {
// //    await signOut();
//     final bool signIn = await _auth.signInWithGoogle();
//     if (!signIn) {
//       final Exception ex = _auth.getError();
//       await showBox(text: ex.toString(), context: context);
//     }
//     rebuild();
//     return signIn;
//  }

  /// logout and refresh
  void logOut() {
    // signOut();
    setState(() {});
  }

  // // 'disconnect' from Firebase
  // Future<void> signOut() => _auth.signOut().then(_logInUser);

//  void _logInUser(dynamic user) {
  // //
  // if (user != null) {
  //   userStamp();
  // }
  // FirebaseCrashlytics.instance.setUserIdentifier(_auth.name);
//  }

  /// Stamp the user information to the firebase database.
  void userStamp() => FirebaseUser().userStamp();

  // String get uid => _auth.uid;
  //
  // String get email => _auth.email;
  //
  // String get name => _auth.name;
  //
  // String get provider => _auth.provider;
  //
  // bool get isNewUser => _auth.isNewUser;
  //
  // bool get isAnonymous => _auth.isAnonymous;
  //
  // String get photo => _auth.photo;
  //
  // String get token => _auth.token;
  //
  // String get tokenId => _auth.tokenId;
  //
  // /// Is the user 'logged in' through a third-party (ex. Google or Facebook)
  // bool get loggedIn => _auth.loggedIn;

  ///
  Object? getError([Object? error]) {
    if (error == null) {
      error = _error;
      _error = null;
    } else {
      _error = error;
    }
    return error;
  }

  ///
  bool get inError {
    final error = _error;
    _error = null;
    return error != null;
  }

  Object? _error;
}

// /// Incorporate FirebaseCrashlytics into the app.
// // ignore: avoid_void_async
// void runApp(
//   Widget app, {
//   FlutterExceptionHandler handler,
//   ErrorWidgetBuilder builder,
//   ReportErrorHandler report,
//   bool allowNewHandlers = false,
//   bool firebaseCrashlytics = true,
// }) async {
//   /// If nothing is specified, turn to Firebase Crashlytics
//   if (handler == null && report == null) {
//     // Allow for FirebaseCrashlytics.instance
//     WidgetsFlutterBinding.ensureInitialized();
//
//     // Allow for FirebaseCrashlytics.instance
//     await f.Firebase.initializeApp();
//
//     // Supply Firebase Crashlytics
//     final crash = FirebaseCrashlytics.instance;
//
//     handler = crash.recordFlutterError;
//
//     report = crash.recordError;
//
//     // If true, then crash reporting data is sent to Firebase.
//     await crash.setCrashlyticsCollectionEnabled(firebaseCrashlytics);
//   }
//
//   /// Assign the appropriate error handler.
//   // Than we setup preferred orientations,
//   // and only after it finished we run our app
//   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//       .then((value) => c.runApp(
//             app,
//             errorHandler: handler,
//             errorScreen: builder,
//             errorReport: report,
//             allowNewHandlers: allowNewHandlers,
//           ));
// }
