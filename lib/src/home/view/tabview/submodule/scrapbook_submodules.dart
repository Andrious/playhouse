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
  ScrapbookSubmodulesState(): super(ScrapBookController()){
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TabBar(
              controller: _sbSubTabBar.controller,
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
              tabs: _sbSubTabBar.tabs,
            ),
          ),
          Expanded(
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

  List<Widget> tabSubmodules() {

    if(_con.inBuildScreen){
      sub03Locked = true;
      sub04Locked = true;
    }

    String subPic03;
    String subPic04;

    if (sub03Locked) {
      subPic03 = 'FloorPlanLocked.jpg';
    } else {
      subPic03 = 'FloorPlan.jpg';
    }

    if (sub04Locked) {
      subPic04 = 'ElevationLocked.jpg';
    } else {
      subPic04 = 'Elevation.jpg';
    }

    return [
      _sbSubTabBar.picTab(
          Image.asset('assets/images/Inspiration.jpg', fit: BoxFit.cover)),
      _sbSubTabBar.picTab(
          Image.asset('assets/images/SiteAssessment.jpg', fit: BoxFit.cover)),
      _sbSubTabBar.picTab(
          Image.asset('assets/images/$subPic03', fit: BoxFit.cover)),
      _sbSubTabBar.picTab(
          Image.asset('assets/images/$subPic04', fit: BoxFit.cover)),
    ];
  }

  List<Widget> children() {
    return [
      const ScrapbookTaskStateScreen(),
      const ScrapbookTaskStateScreen(),
      const ScrapbookTaskStateScreen(),
      const ScrapbookTaskStateScreen(),
    ];
  }

  /// Means to 'lock' certain Submodules.
  bool sub01Locked = false;
  bool sub02Locked = false;
  bool sub03Locked = false;
  bool sub04Locked = false;
}
