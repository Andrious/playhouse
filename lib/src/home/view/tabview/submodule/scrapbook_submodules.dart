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
  State createState() => _ScrapbookSubmodulesState();
}

class _ScrapbookSubmodulesState extends StateMVC<ScrapbookSubmodulesScreen>
    with SingleTickerProviderStateMixin {
  SubmodulesTabBar sbSubTabBar;

  @override
  void initState() {
    super.initState();
    sbSubTabBar = SubmodulesTabBar(this);
    // Set up this appbar's data
    sbSubTabBar.initState();
  }

  @override
  void dispose() {
    // Don't forget to dispose the AppBar!
    sbSubTabBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              controller: sbSubTabBar.controller,
//              labelColor: Colors.green,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
//              indicatorColor: Colors.transparent,
//               unselectedLabelColor: Colors.grey,
//               unselectedLabelStyle: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.w700,
//               ),
//               labelStyle: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
              tabs: sbSubTabBar.tabs,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: sbSubTabBar.controller,
              children: sbSubTabBar.children,
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
}
