// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

class ScrapbookSubmodulesScreen extends StatefulWidget {
  const ScrapbookSubmodulesScreen({Key key}) : super(key: key);

  @override
  State createState() => ScrapbookSubmodulesState();
}

class ScrapbookSubmodulesState extends StateMVC<ScrapbookSubmodulesScreen>
    with SingleTickerProviderStateMixin {
  ScrapbookSubmodulesState() : super(ScrapBookController()) {
    _con = controller;
  }
  SubmodulesTabBar _sbSubTabBar;
  ScrapBookController get con => _con;
  ScrapBookController _con;

  @override
  void initState() {
    super.initState();
    _sbSubTabBar = SubmodulesTabBar(this);
    // Set up this appbar's data
    _sbSubTabBar.initState();
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    _sbSubTabBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            // child: Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              controller: _sbSubTabBar.controller,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: _sbSubTabBar.tabs,
            ),
//            ),
          ),
          Flexible(
            flex: 4,
            child: TabBarView(
              controller: _sbSubTabBar.controller,
              children: _sbSubTabBar.children,
            ),
          ),
        ],
      );

  // Widget get _subModuleWidgets => Container(
  //   color: Colors.white,
  //   height: 82,
  //   padding: const EdgeInsets.symmetric(horizontal: 10),
  //   child: ListView.builder(
  //     physics: const BouncingScrollPhysics(),
  //     scrollDirection: Axis.horizontal,
  //     itemCount: _submodules.length,
  //     itemBuilder: (BuildContext context, int index) => Container(
  //         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //         width: 150,
  //         height: 200,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Expanded(
  //                 child: ClipRRect(
  //                     borderRadius: BorderRadius.circular(5),
  //                     child: Image.network(_submodules[index]['image'],
  //                         fit: BoxFit.cover))),
  //             const SizedBox(
  //               height: 5,
  //             ),
  //           ],
  //         )),
  //   ),
  // );

  /// Means to 'lock' certain Submodules.
  bool sub01Locked = false;
  bool sub02Locked = false;
  bool sub03Locked = false;
  bool sub04Locked = false;
}
