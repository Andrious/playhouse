// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:playhouse/src/controller.dart';
import 'package:playhouse/src/view.dart';
import 'package:state_set/state_set.dart';

import 'package:crop/crop.dart';

class TaskCard extends StatefulWidget with StateSetWidget {
  TaskCard({
    Key key,
    this.submodule,
    this.name,
  })  : con = ScrapBookController(),
        image = PickImage(),
        super(key: key);

  final String submodule;
  final String name;

  final ScrapBookController con;
  final PickImage image;

  @override
  void dispose() {
    image._state = null;
    super.dispose();
  }

  /// Override with subclasses.
  void onTap() => con.onTap();

  /// Override with subclasses.
  void onTapInfo() => con.onTapInfo();

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
    widget.image._state = this;
//    widget.image.getImage(widget);
    child ??= Image.asset('assets/images/${widget.name.trim()}.jpg');
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widget = this.widget;
    if (widget.name.isEmpty) {
      return Container();
    }
    return Card(
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          InkWell(
            onTap: widget.onTapInfo,
            highlightColor: const Color(0xffbb86fc),
            child: FutureBuilder<Widget>(
                future: widget.image.getImage(widget),
                initialData: child,
                builder: (_, snapshot) => _futureBuilder(snapshot)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30), //(top: 20, right: 25),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: widget.onTap,
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

  _TaskCardsState _state;

  Future<Widget> getImage(TaskCard card) async {
    this.card = card;
    final con = card.con;
    Widget image;

    ///todo To be removed
    String name;
    if(con.database){
      name = con.module['name'];
    }else{
      name = con.moduleName;
    }

    key =
        '${con.moduleType}$name${card.submodule}${card.name}${card.runtimeType.toString()}';

    final path = Prefs.getString(key);

    if (path.isNotEmpty) {
      //
      final file = File(path);

      // ignore: avoid_slow_async_io
      final exists = await file.exists();

      if (exists) {
        //
        _state?.child =
            Crop(controller: CropController(), child: Image.file(file));
      }
    }
    return image;
  }

  Future<void> pickImage() async {
    final image = ImagePicker();
    final path = await image.picker();
    if (path.isNotEmpty) {
      var state = card.stateOf<_TaskCardsState>();
      state ??= _state;
      state?.child = Image.file(File(path), fit: BoxFit.fitHeight);
      // ignore: invalid_use_of_protected_member
      state?.setState(() {});
      await Prefs.setString(key, path);
    }
  }
}
