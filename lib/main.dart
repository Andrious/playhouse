// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

void main() => runApp(MyApp());

class MyApp extends AppStatefulWidget {
  MyApp({Key key})
      : super(
          key: key,
          loadingScreen: _LoadingScreen(),
        );

  @override
  AppState createView() => AppState(
        debugShowCheckedModeBanner: false,
        title: 'Grey & Ivy Playhouse',
        home: ScrapBookApp(), //const HomePage(),
        con: AppController(),
        localizationsDelegates: [
          I10nDelegate(),
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        inTheme: () => ThemeData(
          primaryColor: Colors.white,
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

class _LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      // SizedBox.expand(
      //   child: Image.asset(
      //     'assets/GILoadingScreen.jpg',
      //     fit: BoxFit.fill,
      //   ),
      // );

      const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          // image: DecorationImage(
          //   image: AssetImage('assets/GILoadingScreen.jpg'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Center(child: CircularProgressIndicator()),
      );
}
