// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// For base64.decode()
import 'dart:convert';

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key key, this.task, this.subTask}) : super(key: key);
  final TaskCard task;
  final Map<String, dynamic> subTask;
  @override
  State createState() => _TaskScreenState();
}

class _TaskScreenState extends StateMVC<TaskScreen> {
  _TaskScreenState() : super(ScrapBookController()) {
    con = controller;
  }
  ScrapBookController con;

  @override
  void initState() {
    super.initState();
    subState = con.ofState<SubmodulesState>();
  }

  final List<Widget> actions = [];
  SubmodulesState subState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(
//        leading: widget.task.icon,
        title: I10n.t('Playhouse'),
        centerTitle: true,
//        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
        actions: actions,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: MemoryImage(
                      base64.decode(
                        con.submodule['image'],
                      ),
                    ),
                    fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                width: 300,
                height: 500,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 100, 16, 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        heightFactor: 0,
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${widget.subTask['subName']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      /// Task Name and Number
                      Flexible(
                        flex: 2,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              bottom: 30,
                            ),
                            child: Text(
                              widget.subTask['name'],
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Short Description or Title
                      Flexible(
                        child: Center(
                          child: Text(widget.subTask['short_description']),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Text(widget.subTask['long_description']),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
//              height: 50,
//              width: 50,
              left: 330,
              top: 10,
              right: 15,
              bottom: 640,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
//                    borderRadius: BorderRadius.circular(30)
                ),
//                padding: const EdgeInsets.all(16),
                child: widget.task.icon,
              ),
            ),
          ],
        ),
      ),
    );
//     return SafeArea(
//       child: Stack(
//         children: <Widget>[
//           // Crop(
//           //   padding: const EdgeInsets.only(),
//           //   interactive: false,
//           //   backgroundColor: Colors.white,
//           //   dimColor: Colors.white,
//           //   controller: CropController(
//           //     aspectRatio: 0.8,
//           //   ),
//           //   child: Image.memory(
//           //     base64.decode(
//           //       con.submodule['image'],
//           //     ),
//           //   ),
//           // ),
//           ClipRRect(
//             child: Image.memory(
//               base64.decode(
//                 con.submodule['image'],
//               ),
//             ),
//           ),
// //           GreyIvyTabBar(
// // //            indicatorSize: TabBarIndicatorSize.label,
// //             controller: TabController(
// //               length: 1,
// //               vsync: subState,
// //             ),
// //             tabs: [
// //               ClipRRect(
// //                 child: Image.memory(
// //                   base64.decode(
// //                     con.submodule['image'],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //             physics: const BigPageScrollPhysics().applyTo(
// //                 ScrollConfiguration.of(context).getScrollPhysics(context)),
// //           ),
//           SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Container(
//               margin: const EdgeInsets.fromLTRB(16, 200, 16, 16),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(30)),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   /// Task Name and Number
//                   Flexible(
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           top: 30,
//                           bottom: 30,
//                         ),
//                         child: Text(
//                           widget.subTask['name'],
//                           style: const TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   /// Short Description or Title
//                   Flexible(
//                     child: Center(
//                       child: Text(widget.subTask['short_description']),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   Flexible(
//                     child: Text(widget.subTask['long_description']),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
  }

// Stack(
//       children: <Widget>[
//         Crop(
//           padding: const EdgeInsets.only(),
//           interactive: false,
//           backgroundColor: Colors.white,
//           dimColor: Colors.white,
//           controller: CropController(
//             aspectRatio: 0.78,
//           ),
//           child: Image.memory(
//             base64.decode(
//               con.submodule['image'],
//             ),
//           ),
//         ),

  //        SafeArea(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.white),
//                   child: Column(
//                     children: <Widget>[
//                       /// Task Name and Number
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           top: 30,
//                           bottom: 20,
//                         ),
//                         child: Text(
//                           widget.subTask['name'],
//                           style: const TextStyle(
//                             fontSize: 26,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//
//                       /// Short Description or Title
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           top: 10,
//                         ),
//                         child: Text(widget.subTask['short_description']),
//                       ),
//                       const SizedBox(height: 30),
//                       Flexible(
//                         child: SingleChildScrollView(
//                           physics: const BouncingScrollPhysics(),
//                           child: Text(widget.subTask['long_description']),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         )

}
