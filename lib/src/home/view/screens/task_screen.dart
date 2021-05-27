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
      appBar: AppBar(
        title: I10n.t('Playhouse'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        excludeHeaderSemantics: true,
      ),
      endDrawer: const ScrapBookDrawer(),
      body: Stack(
        children: <Widget>[
          Crop(
            padding: const EdgeInsets.only(),
            interactive: false,
            backgroundColor: Colors.white,
            dimColor: Colors.white,
            controller: CropController(
              aspectRatio: 0.78,
            ),
            child: Image.memory(
              base64.decode(
                con.submodule['image'],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Text(
                          widget.subTask['subName'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Flexible(
                        child: Text(
                          'Submodule description',
                        ),
                      ),
                    ]),
                const Spacer(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        /// Task Name and Number
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            bottom: 20,
                          ),
                          child: Text(
                            widget.subTask['name'],
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        /// Short Description or Title
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(widget.subTask['short_description']),
                        ),
                        const SizedBox(height: 30),
                        Flexible(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(widget.subTask['long_description']),
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: I10n.t('Playhouse'),
  //       centerTitle: true,
  //       automaticallyImplyLeading: false,
  //       elevation: 0,
  //       excludeHeaderSemantics: true,
  //     ),
  //     endDrawer: const ScrapBookDrawer(),
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           /// Submodule Name |  Short Description
  //           Flexible(
  //             flex: 3,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 4),
  //                   child: Text(
  //                     widget.subTask['subName'],
  //                     style: const TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 16,
  //                     ),
  //                   ),
  //                 ),
  //                 const Flexible(
  //                   child: Padding(
  //                     padding: EdgeInsets.only(top: 4),
  //                     child: Text(
  //                       'Submodule description',
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Flexible(
  //             flex: 5,
  //             fit: FlexFit.tight,
  //             child: Stack(
  //               children: <Widget>[
  //                 /// Large Picture
  //                 Crop(
  //                   interactive: false,
  //                   backgroundColor: Colors.white,
  //                   dimColor: Colors.white,
  //                   controller: CropController(),
  //                   child: Image.memory(
  //                     base64.decode(
  //                       con.submodule['image'],
  //                     ),
  //                   ),
  //                 ),
  //                 Card(
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
  //                           bottom: 30,
  //                         ),
  //                         child: Text(widget.subTask['short_description']),
  //                       ),
  //
  //                       /// Long Description
  //                       SingleChildScrollView(
  //                         child: Text(widget.subTask['long_description']),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
