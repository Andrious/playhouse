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
        home: ScrapBookApp(), //const ScrapBookApp(),
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
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(5, 5),
                        blurRadius: 5)
                  ]),
              margin: const EdgeInsets.all(48),
              child: Column(
                children: const <Widget>[
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/loading_screen.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      );
}
