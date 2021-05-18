// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
  _TaskScreenState() : super(ScrapBookController());
  //   _TaskScreenState() : super(ScrapBookController()) {
  //   con = controller;
  // }
  //
  // ScrapBookController con;

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
      endDrawer: ScrapBookDrawer(),
      body: Stack(
        children: <Widget>[
          // Container(
          //     height: double.infinity,
          //     child: PNetworkImage(
          //       image,
          //       fit: BoxFit.cover,
          //     )),
          SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 2, 20),
                        child: AutoSizeText(
//                          '${con.submoduleName}  |',
                          '${widget.subTask['subName']}  |',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(2, 2, 2, 20),
                        child: AutoSizeText(
                          'Submodule description',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
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
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child:
                                      Text(widget.subTask['short_description']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child:
                                      Text(widget.subTask['long_description']),
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
