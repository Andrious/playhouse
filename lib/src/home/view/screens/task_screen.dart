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
    return Stack(
      children: <Widget>[
        Crop(
          padding: const EdgeInsets.only(),
          interactive: false,
          backgroundColor: Colors.white,
          dimColor: Colors.white,
          controller: CropController(
            aspectRatio: 0.8,
          ),
          child: Image.memory(
            base64.decode(
              con.submodule['image'],
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 200, 16, 16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                /// Task Name and Number
                Flexible(
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
                const SizedBox(height: 30),
                Flexible(
                  child: Text(widget.subTask['long_description']),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
