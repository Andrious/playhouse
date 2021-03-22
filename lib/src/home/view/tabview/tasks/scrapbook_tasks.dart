// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

//import 'dart:html';

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

class ScrapbookTaskScreen extends StatefulWidget {
  const ScrapbookTaskScreen({Key key}) : super(key: key);

  @override
  State createState() => _ScrapbookTaskState();
}

class _ScrapbookTaskState extends StateMVC<ScrapbookTaskScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {}, child: const Text('All')),
              TextButton(onPressed: () {}, child: const Text('Favorite')),
              TextButton(onPressed: () {}, child: const Text('Incomplete')),
            ],
          ),
          LimitedBox(
            maxHeight: 370,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
//              shrinkWrap: true,
              children: [
                Card(
                  child: Image.asset(
                    'assets/images/questionMark.jpg',
 //                   height: 80,
                  ),
                ),
                Card(
                  child: Image.asset(
                    'assets/images/abc.jpg',
 //                   height: 80,
                  ),
                ),
                Card(
                  child: Image.asset(
                    'assets/images/AR.jpg',
 //                   height: 80,
                  ),
                ),
                Card(
                  child: Image.asset(
                    'assets/images/pencil.jpg',
 //                   height: 80,
                  ),
                ),
                Card(
                  child: Image.asset(
                    'assets/images/picture.jpg',
//                    height: 80,
                  ),
                ),
                Card(
                  child: Image.asset(
                    'assets/images/movieCamera.jpg',
  //                  height: 80,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class Card01 extends StatelessWidget {
  const Card01({Key key, this.image, this.title, this.price}) : super(key: key);
  final Image image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) => Container(
    width: 20,
    height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
            ),
          ],
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image,
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      );
}