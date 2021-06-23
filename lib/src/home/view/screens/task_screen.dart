// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// For base64.decode()
import 'dart:convert';

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key key, this.card}) : super(key: key);
  final TaskCard card;
  @override
  State createState() => _TaskScreenState();
}

class _TaskScreenState extends StateMVC<TaskScreen> {
  _TaskScreenState() : super(ScrapBookController()) {
    con = controller;
  }
  ScrapBookController con;
  Map<String, dynamic> rec;
  Widget icon;

  @override
  void initState() {
    super.initState();
    subState = con.ofState<SubmodulesState>();
    rec = widget.card.task;
    icon = widget.card.icon;
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
                  image: ExactAssetImage(
                    'assets/images/${con.submodule['key_art_file']}',
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
                          '${rec['submodule']}',
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
                              rec['name'],
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
                          child: Text(rec['short_description']),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Text(rec['long_description']),
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
                child: icon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
