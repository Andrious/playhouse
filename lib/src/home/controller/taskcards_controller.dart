// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:playhouse/src/controller.dart';
import 'package:playhouse/src/view.dart';

import 'package:state_set/state_set.dart';
import 'package:path_provider/path_provider.dart';

import 'package:images_picker/images_picker.dart';
import 'package:image/image.dart' as i;
import 'package:uuid/uuid.dart';

class TaskCard extends StatefulWidget with StateSetWidget {
  TaskCard({
    Key key,
    @required this.submodule,
    @required this.name,
  })  : con = ScrapBookController(),
        image = PickImage(),
        icon = Image.asset('assets/images/${name.trim()}02.jpg'),
        super(key: key);

  final String submodule;
  final String name;

  final ScrapBookController con;
  final PickImage image;
  final Widget icon;

  @override
  void dispose() {
    image._state = null;
    super.dispose();
  }

  /// Override with subclasses.
  void onTap() => con.onTap(this);

  /// Override with subclasses.
  void onTapInfo() => con.onTapInfo(this);

  @override
  // ignore: no_logic_in_create_state
  State createState() => _TaskCardsState();
}

class _TaskCardsState extends State<TaskCard> {
  Widget child;

  @override
  void initState() {
    super.initState();
    final _parent = widget;
    _parent.withState(this);
    _parent.initState();
    _parent.image._state = this;
    child ??= _parent.icon;
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TaskCard widget = this.widget;
    if (widget.name.isEmpty) {
      return Container();
    }
    return Card(
      child: FutureBuilder<Widget>(
        future: _cardContent(widget),
        initialData: child,
        builder: (_, snapshot) => _futureBuilder(snapshot),
      ),
    );
  }

  Future<Widget> _cardContent(TaskCard card) async {
    Widget widget;
    final parent = this.widget;
    widget = await parent.image.getImage(parent);

    if (widget != null) {
      //
      widget = InkWell(
        onTap: card.onTap,
        highlightColor: const Color(0xffbb86fc),
        child: widget,
      );
    } else {
      //
      widget = Column(children: [
        Flexible(
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: card.onTapInfo,
              highlightColor: const Color(0xffbb86fc),
              child: Image.asset('assets/images/info.jpg'),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: InkWell(
              onTap: card.onTap,
              highlightColor: const Color(0xffbb86fc),
              child: child,
            ),
          ),
        ),
      ]);
    }
    return widget;
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
      if (snapshot.hasData) {
        return snapshot.data;
      } else {
        return child;
      }
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
    Widget image;

    this.card = card;
    final con = card.con;

    ///todo To be removed
    String name;
    if (con.database) {
      name = con.module['name'];
    } else {
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
        image = Crop(
          controller: CropController(),
          child: Image.file(
            file,
          ),
        );

        _state?.child = image;
      }
    }
    return image;
  }

  // // Works with import 'package:image_picker/image_picker.dart' as i;
  // Future<void> pickImage() async {
  //   final image = ImagePicker();
  //   final path = await image.picker();
  //   return recordImage(path);
  // }

  // Works with import 'package:images_picker/images_picker.dart';
  Future<void> pickImage() async {
    final path = await ImagesPicker.pick();
    if (path != null && path.isNotEmpty) {
      await recordImage(path[0].path);
    }
  }

  Future<bool> saveJpg(Uint8List image) async {
    //
    Directory directory;

    try {
      directory = await getApplicationDocumentsDirectory();
    } catch (ex) {
      directory = null;
    }

    if (directory == null) {
      return false;
    }

    const uuid = Uuid();

    final unique = uuid.v4().replaceAll(RegExp('-'), '');

    final fileName = '${card.name}_${unique.substring(0, 7)}';

    var file = await File('${directory.path}/$fileName.jpg').create();

    file =
        await file.writeAsBytes(i.encodeJpg(i.decodeImage(image)), flush: true);

    final path = file.path;

    var save = path.isNotEmpty;

    if (save) {
      //
      final old = Prefs.getString(key);

      if (old.isNotEmpty) {
        //
        final oldFile = File(old);

        FileSystemEntity entity;
        try {
          entity = await oldFile.delete();
        } catch (e) {
          entity = null;
        }
        save = await entity?.exists() ?? false;
      }
      save = await recordImage(path);
    }
    return save;
  }

  Future<bool> recordImage(String path) async {
    //
    var record = path != null && path.isNotEmpty;

    if (record) {
      var state = card.stateOf<_TaskCardsState>();
      state ??= _state;
//      state?.child = Image.file(File(path), fit: BoxFit.fitHeight);
      state?.child =
          Crop(controller: CropController(), child: Image.file(File(path)));
      // ignore: invalid_use_of_protected_member
      state?.setState(() {});
      record = await Prefs.setString(key, path);
    }
    return record;
  }
}
