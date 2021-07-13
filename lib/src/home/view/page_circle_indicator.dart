// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

import 'package:page_view_indicators/circle_page_indicator.dart';

class PageCircleIndicator extends StatefulWidget {
  const PageCircleIndicator({
    Key key,
    this.itemCount,
    this.dotSize = 12,
  }) : super(key: key);

  final int itemCount;
  final double dotSize;

  int get value {
    final state = StateSet.to<_PageCircleIndicatorState>();
    return state?.value;
  }

  set value(int value) {
    final state = StateSet.to<_PageCircleIndicatorState>();
    state?.value = value;
  }

  @override
  State createState() => _PageCircleIndicatorState();
}

class _PageCircleIndicatorState extends State<PageCircleIndicator>
    with StateMap {
  @override
  void initState() {
    super.initState();
    _dotSize = widget.dotSize ?? 12;
    currentPageNotifier = ValueNotifier<int>(value);
  }

  ValueNotifier<int> currentPageNotifier;
  double _dotSize;
  int value = 0;

  @override
  Widget build(BuildContext context) => CirclePageIndicator(
        size: _dotSize,
        selectedSize: _dotSize,
        dotColor: Theme.of(context).primaryColor.withOpacity(0.35),
        selectedDotColor: Theme.of(context).primaryColor,
        itemCount: widget.itemCount,
        currentPageNotifier: currentPageNotifier,
      );
}
