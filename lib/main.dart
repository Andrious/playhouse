// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

void main() => runApp(MyApp());

class MyApp extends AppStatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  AppState createView() => AppState(
        debugShowCheckedModeBanner: false,
        title: 'Grey & Ivy Playhouse',
        home: const HomePage(),
        localizationsDelegates: [
          I10nDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        inTheme: () => ThemeData(
          primarySwatch: Colors.yellow,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: 'Corben',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
      );
}
