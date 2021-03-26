// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

/// State of the Task:  Favorite, Incomplete, etc.
class ScrapbookTaskStateScreen extends StatefulWidget {
  const ScrapbookTaskStateScreen({Key key}) : super(key: key);

  @override
  State createState() => _ScrapbookTaskStateState();
}

class _ScrapbookTaskStateState extends StateMVC<ScrapbookTaskStateScreen> {
  _ScrapbookTaskStateState() : super(ScrapBookController()) {
    _con = controller;
  }
  ScrapBookController get con => _con;
  ScrapBookController _con;

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
          TextButton(onPressed: () {}, child: const Text('View All ^')),
        ],
      ),
      LimitedBox(
        maxHeight: 250, //350,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
//              shrinkWrap: true,
          children: con.taskCards,
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

class EmptyTaskStateScreen extends StatelessWidget{
  const EmptyTaskStateScreen({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) => const Center();
}