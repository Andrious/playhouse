// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// MVC framework

import 'package:flutter/foundation.dart' show FlutterExceptionHandler;

import 'package:firebase_core/firebase_core.dart' as f;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:firebase_crashlytics/firebase_crashlytics.dart'
    show FirebaseCrashlytics;

import 'package:playhouse/src/model.dart'
    show
        ErrorWidgetBuilder,
        FireStoreDB,
        PlayhouseDB,
        Widget,
        WidgetsFlutterBinding;

import 'package:playhouse/src/view.dart' show App, ReportErrorHandler;

import 'package:mvc_application/controller.dart' as c;

class AppController extends c.AppController {
  FireStoreDB db;

  @override
  Future<bool> initAsync() async {
    c.WidgetsFlutterBinding.ensureInitialized();
    //todo: Comment this out to test the error handling.
    await f.Firebase.initializeApp();

    final auth = Firebase().auth;

    final user = auth.currentUser;

    /// todo: Remove and replace with more substantial routine.
    // if (user != null) {
    //   //
    //   final database = PlayhouseDB();
    //
    //   database.createDB();
    // }

    return user != null;
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
    final FirebaseCrashlytics crash = FirebaseCrashlytics.instance;

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
