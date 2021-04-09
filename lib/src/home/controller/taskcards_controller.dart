// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class TaskCard extends StatefulWidget with StateSetWidget {
  TaskCard({
    Key key,
    this.name,
  })  : con = ScrapBookController(),
        image = PickImage(),
        super(key: key);

  final String name;

  final ScrapBookController con;
  final PickImage image;

  /// Override with subclasses.
  void onTap() {}

  /// Override with subclasses.
  void onTapInfo() {}

  @override
  // ignore: no_logic_in_create_state
  State createState() => _TaskCardsState();
}

class _TaskCardsState extends State<TaskCard> {
  Widget child;

  @override
  void initState() {
    super.initState();
    widget.withState(this);
    widget.initState();
    widget.image.getImage(widget);
    child ??= Image.asset('assets/images/${widget.name.trim()}.jpg');
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name.isEmpty) {
      return Container();
    }
    return Card(
      child: Stack(
        children: [
          InkWell(
            onTap: () => widget.onTapInfo(),
            highlightColor: const Color(0xffbb86fc),
            child: FutureBuilder<Widget>(
                future: widget.image.getImage(widget),
                initialData: child,
                builder: (_, snapshot) => _futureBuilder(snapshot)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => widget.onTap(),
                highlightColor: const Color(0xffbb86fc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _futureBuilder(AsyncSnapshot<Widget> snapshot) {
    if (snapshot.hasError) {
      final dynamic exception = snapshot.error;
      final details = FlutterErrorDetails(
        exception: exception,
        stack: exception is Error ? exception.stackTrace : null,
        library: 'app_statefulwidget',
        context: ErrorDescription('While getting ready in FutureBuilder Async'),
      );
      return App.errorHandler.displayError(details);
    } else if (snapshot.connectionState == ConnectionState.done) {
      return child;
    } else {
      Widget widget;
      if (UniversalPlatform.isAndroid) {
        widget = const Center(child: CircularProgressIndicator());
      } else {
        widget = const Center(child: CupertinoActivityIndicator());
      }
      return widget;
    }
  }
}

class PickImage {
//
  TaskCard card;
  String key;

  Future<Widget> getImage(TaskCard card) async {
    this.card = card;
    final con = card.con;
    key =
        '${con.moduleType}${con.module}${con.submodule}${card.name}${card.runtimeType.toString()}';
    final path = Prefs.getString(key);
    Widget image;
    if (path.isNotEmpty) {
      image = Image.file(File(path), fit: BoxFit.fitHeight);
      final state = card.stateOf<_TaskCardsState>();
      state?.child = image;
    }
    return image;
  }

  Future<void> pickImage() async {
    final image = ImagePicker();
    final path = await image.picker();
    if (path.isNotEmpty) {
      final state = card.stateOf<_TaskCardsState>();
      state?.child = Image.file(File(path), fit: BoxFit.fitHeight);
      // ignore: invalid_use_of_protected_member
      state?.setState(() {});
      await Prefs.setString(key, path);
    }
  }
}
