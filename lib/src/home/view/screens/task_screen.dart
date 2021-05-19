// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// For base64.decode()
import 'dart:convert';

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key key, this.subTask}) : super(key: key);
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
  Widget build(BuildContext context) {
    return Scaffold(
      //       primary: false,
      appBar: AppBar(
        title: I10n.t('Playhouse'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
      ),
      endDrawer: const ScrapBookDrawer(),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              height: 500, // double.infinity,
              child: Crop(
                interactive: false,
                backgroundColor: Colors.white,
                dimColor: Colors.white,
                controller: CropController(),
                child: Image.memory(
                  base64.decode(
                    con.submodule['image'],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 4, 2, 2),
                    child: AutoSizeText(
                      '${widget.subTask['subName']}  |',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 4, 2, 2),
                    child: AutoSizeText(
                      'Submodule description',
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 380,
              left: 0,
              right: 0,
              height: 800,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                          color: Colors.white),
                      child: Column(
                        children: <Widget>[
                          Text(
                            widget.subTask['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              //                             physics: const BouncingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                        widget.subTask['short_description']),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(
                                        widget.subTask['long_description']),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
// //        alignment: Alignment.topCenter,
//         children: <Widget>[
//           SafeArea(
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   child: Container(
//                     height: screenSize.height, //300,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.withAlpha(50),
//                       borderRadius: const BorderRadius.only(
//                         topRight: Radius.circular(100),
//                         topLeft: Radius.circular(100),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(100),
//                           topLeft: Radius.circular(100),
//                         ),),
// //                        color: Colors.white),
//                     child: SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         children: const <Widget>[
//                           SizedBox(height: 100),
//                           Text(
//                               "This is a description of this card's task and what you need to do accomplish it!"),
//                           SizedBox(height: 30),
//                           Text('Would you like to start doing this task?'),
//                           SizedBox(height: 30),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}
