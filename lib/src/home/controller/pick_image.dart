// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

// For rootBundle.loadString();
import 'package:flutter/services.dart';

import 'package:image/image.dart' as i;
import 'package:images_picker/images_picker.dart';

import 'package:path_provider/path_provider.dart';

import 'package:uuid/uuid.dart';

class PickImage {
//
  TaskCard card;
  Map<String, dynamic> userTask = {};
  String key;

  void initState(TaskCard card) {
    //
    if (card != null && this.card == null) {
      this.card = card;

      userTask = card?.userTask[0];

      if (userTask == null || userTask.isEmpty) {
        userTask = {};
      }
    }
  }

  void dispose() {
    card = null;
  }

  Future<Widget> getImage() async {
    Widget image;

    final code = userTask['key_art_file'];

    if (code == null || code is! String) {
      return image;
    }

    if (code == "''") {
      return image;
    }

    if (code.isEmpty) {
      return image;
    }

    final file = File(code);

    if (!file.existsSync()) {
      return image;
    }

    //
    image = Crop(
      controller: CropController(),
      child: Image.file(file), //Image.memory(base64.decode(code)),
    );

    card?.icon = image;

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
      await _saveImage(path);
    }
  }

  void displayImage(String path) {
    // ignore: invalid_use_of_protected_member
    card?.setState(() {});

    card?.icon =
        Crop(controller: CropController(), child: Image.file(File(path)));
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
      save = await _saveImage(path);
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

  /// Save the specified file to the database as a 'key art' field.
  Future<bool> _saveImage(String path) async {
    //
    bool save = path != null && path.isNotEmpty;

    String file;

    if (save) {
      file = await _saveFileLocal(path);
      save = file.isNotEmpty;
    }

    if (save) {
      // The app's controller
      final con = card.con;

      if (userTask['user_id'] == null) {
        //
        userTask['user_id'] = con.userId;

        userTask['task_id'] = card.task['rowid'];
      }

      final String oldFile = userTask['key_art_file'];

      if (oldFile != null && oldFile.isNotEmpty && oldFile != file) {
        _deleteLocalFile(oldFile);
      }

      userTask['key_art_file'] = file; //encodeFile(path);

      save = await con.model.saveUserTask(userTask);

      userTask = con.model.usersTasks.savedRec;
    }
    return save;
  }

  /// Save the specified file a local folder.
  Future<String> _saveFileLocal(String file) async {
    //
    String newFilePath = '';

    bool save = file != null && file.isNotEmpty;

    if (!save) {
      return newFilePath;
    }

    final File pickedFile = File(file);

    final String fileName = basename(pickedFile.path);

    final path = await localDirectory('key_art');

    save = path.isNotEmpty;

    if (save) {
      //
      final File newFile = await pickedFile.copy('$path/$fileName');

      save = newFile.existsSync();

      if (save) {
        newFilePath = newFile.path;
      }
    }

    return newFilePath;
  }

  Future<String> localDirectory(String directory) async {
    //
    if (directory == null || directory.isEmpty) {
      return '';
    }

    final Directory appDir = await getApplicationDocumentsDirectory();

    final String newDirectory = '${appDir.path}/${directory.trim()}';

    Directory dir = Directory(newDirectory);

    bool exists = dir.existsSync();

    if (!exists) {
      //
      dir = await dir.create(recursive: true);

      exists = dir.existsSync();
    }

    String path;
    if (exists) {
      path = dir.path;
    } else {
      path = '';
    }
    return path;
  }

  bool _deleteLocalFile(String filePath) {
    //
    bool delete = false;

    if (filePath == null || filePath.isEmpty) {
      return delete;
    }

    final File file = File(filePath);

    delete = !file.existsSync();

    if (!delete) {
      try {
        file.deleteSync();
        delete = !file.existsSync();
      } catch (ex) {
        delete = false;
      }
    }
    return delete;
  }
}
