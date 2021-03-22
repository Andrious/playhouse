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
        PlayhouseDB,
        Widget,
        WidgetsFlutterBinding;

import 'package:playhouse/src/view.dart'
    show App, BuildContext, ReportErrorHandler;

import 'package:mvc_application/controller.dart' as c;

import 'package:playhouse/src/controller.dart' show SignIn;


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
