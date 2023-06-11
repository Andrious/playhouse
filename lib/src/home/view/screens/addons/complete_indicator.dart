// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

import 'package:percent_indicator/percent_indicator.dart';

class CompleteIndicator extends StatefulWidget {
  const CompleteIndicator({Key? key}) : super(key: key);

  @override
  State createState() => _CompleteIndicatorState();

  void setCompletion([TabController? tab]) {
    if (tab != null && tab.indexIsChanging) {
      return;
    }
    refresh();
  }
}

class _CompleteIndicatorState extends State<CompleteIndicator> with StateSet {
  @override
  void initState() {
    super.initState();
    con = ScrapBookController();
  }

  // The app's controller
  late ScrapBookController con;

  @override
  Widget build(BuildContext context) {
    //
    final num = (con.percentComplete * 100).round();
    String percent;
    if (num == 100) {
      percent = num.toString();
    } else {
      percent = '$num%';
    }
    return Stack(
        alignment: AlignmentDirectional.centerStart,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            width: 300,
            height: 100,
            child: Opacity(
              opacity: 0.6,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(5, 5),
                      blurRadius: 5,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                CircularPercentIndicator(
                  radius: 50,
//                lineWidth: 5,
                  animation: true,
                  animationDuration: 1000,
                  percent: con.percentComplete,
                  animateFromLastPercent: true,
                  center: Text(percent),
                  circularStrokeCap: CircularStrokeCap.square,
//              backgroundColor: Colors.white24,
//              maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
                  linearGradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.yellow, Colors.green, Colors.greenAccent],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: const Text('tasks completed.'),
                )
              ],
            ),
          ),
        ]);
  }
}
