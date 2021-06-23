// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data' show Uint8List;
import 'dart:typed_data';

// For rootBundle.loadString();
import 'package:flutter/services.dart';

import 'package:image/image.dart' as i;
import 'package:images_picker/images_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:playhouse/src/controller.dart';
import 'package:playhouse/src/view.dart';
import 'package:state_set/state_set.dart';
import 'package:uuid/uuid.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    Key key,
    @required this.task,
    @required this.userTask,
    @required this.name,
  })  : con = ScrapBookController(),
        image = PickImage(),
        icon = Image.asset('assets/images/${name.trim()}02.jpg'),
        super(key: key);

  final Map<String, dynamic> task;
  final Map<String, dynamic> userTask;
  final String name;

  final ScrapBookController con;
  final PickImage image;
  final Widget icon;

  bool complete() => true;

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
    _parent.image.initState(this, _parent);
    child ??= _parent.icon;
  }

  @override
  void dispose() {
    widget.image.dispose();
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
    //
    Widget widget;

    widget = await card.image.getImage();

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
  Map<String, dynamic> userTask = {};
  String key;

  _TaskCardsState _state;

  void initState(_TaskCardsState state, TaskCard card) {
    //
    if (state != null && _state == null) {
      _state = state;
    }

    if (card != null && this.card == null) {
      this.card = card;

      userTask = card?.userTask;

      if (userTask == null || userTask.isEmpty) {
        userTask = {};
      }
    }
  }

  void dispose() {
    card = null;
    _state = null;
  }

  Future<Widget> getImage() async {
    Widget image;

    final code = userTask['key_art'];

    if (code == null || code is! String) {
      return image;
    }

    if (code == "''") {
      return image;
    }

    //
    image = Crop(
      controller: CropController(),
      child: Image.memory(base64.decode(code)),
    );

    _state?.child = image;

    return image;
  }

  // // Works with import 'package:image_picker/image_picker.dart' as i;
  // Future<void> pickImage() async {
  //   final image = ImagePicker();
  //   final path = await image.picker();
  //   return recordImage(path);
  // }

  Future<void> pickImage() async {
    final pick = await ImagesPicker.pick();
    if (pick != null && pick.isNotEmpty) {
      final path = pick[0].path;
      displayImage(path);
      await recordImage(path);
    }
  }

  void displayImage(String path) {
    // ignore: invalid_use_of_protected_member
    _state?.setState(() {});

    _state?.child =
        Crop(controller: CropController(), child: Image.file(File(path)));
  }

  Future<bool> recordImage(String path) async {
    //
    var record = path != null && path.isNotEmpty;

    if (record) {
      //
      record = await _saveImage(path);
    }
    return record;
  }

  Future<bool> _saveImage(String path) async {
    //
    var save = path != null && path.isNotEmpty;

    if (save) {
      final model = card.con.model;

      final userId = model.users.items[0]['rowid'];

      final code = await encodeFile(path);

      if (userTask['user_id'] == null) {
        //
        userTask['user_id'] = userId;

        userTask['task_id'] = card.task['rowid'];
      }

      userTask['key_art'] = code;

      save = await model.usersTasks.table.save(userTask);

      if (save) {
        //
        final recList = model.tasksUnlocked.items
            .where((rec) =>
                rec['user_id'] == userId &&
                rec['task_id'] == card.task['rowid'])
            .toList();

        Map<String, dynamic> rec;

        if (recList.isEmpty) {
          rec = {
            'user_id': userId,
            'task_id': card.task['rowid'],
            'completed': true
          };
        } else {
          //
          rec = recList[0];

          // Don't bother if already 'completed'
          if (rec['completed'] == null || rec['completed'] == 0) {
            //
            if (rec['user_id'] == null) {
              //
              rec['user_id'] = userId;

              rec['task_id'] = card.task['rowid'];
            }
            rec['completed'] = 1; // true

            await model.tasksUnlocked.table.save(rec);
          }
        }
      }
    }
    return save;
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

  static Future<String> encodeFile(String path) async {
    //
    String code;

    try {
      //
      final file = File(path);

      final bytes = await file.readAsBytes();

      code = base64.encode(Uint8List.view(bytes.buffer));
    } catch (e) {
      //
      code = '';
    }
    return code;
  }

  static Future<String> printBytes(String name) async {
    ByteData bytes;
    String code;

    try {
      bytes = await rootBundle.load(name);
    } catch (ex) {
      bytes = null;
    }

    if (bytes == null) {
      //
      code = '';
    } else {
      //
      code = base64.encode(Uint8List.view(bytes.buffer));

      if (code.isNotEmpty) {
        //
        print(code);
      }
    }
    return code;
  }
}
