// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:playhouse/src/model.dart';
//

import 'package:flutter/foundation.dart'
    show LicenseEntryWithLineBreaks, LicenseRegistry;

import 'package:flutter/services.dart' show rootBundle;

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class SetupApp extends AppConMVC {
  SetupApp([StateMVC state]) : super(state);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LicenseRegistry.addLicense(() async* {
      var licence = await rootBundle.loadString('assets/google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], licence);
      licence = await rootBundle.loadString('assets/google_fonts/UFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], licence);
    });
  }

  /// If the device's connectivity changes.
  @override
  void onConnectivityChanged(ConnectivityResult result) {}
}
