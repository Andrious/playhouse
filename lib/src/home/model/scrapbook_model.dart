// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

class AppModel {
  factory AppModel() => _this ??= AppModel._();
  AppModel._();
  static AppModel _this;

  static List<Map<String, dynamic>> modules = [];

  static List<Map<String, dynamic>> submodules = [];

  static List<Map<String, dynamic>> tasks = [];

  bool populateModule(Map<String, dynamic> data) => _tryMap(data, _mapModule);

  bool populateSubmodule(Map<String, dynamic> data) => _tryMap(data, _mapSubmodule);

  bool populateTask(Map<String, dynamic> data) => _tryMap(data, _mapTask);


  void _mapModule(Map<String, dynamic> data) =>  modules.add(data);

  void _mapSubmodule(Map<String, dynamic> data) => submodules.add(data);

  void _mapTask(Map<String, dynamic> data) => tasks.add(data);



  /// Attempts to 'map the data.'
  /// If errors returns false.
  bool _tryMap(Map<String, dynamic> data,
      void Function(Map<String, dynamic> data) mapper) {
    var pop = true;
    try {
      mapper(data);
    } catch (ex) {
      pop = false;
    }
    return pop;
  }
}


// void _mapModule(Map<String, dynamic> data) {
//   var rec = Module(
//     type: data['type'],
//     nextModId: data['nextModId'],
//     name: data['name'],
//     short: data['short'],
//     long: data['long'],
//     complete: data['complete'],
//   );
// }
//
// void _mapSubmodule(Map<String, dynamic> data) {
//   var rec = Submodule(
//     moduleId: data['moduleId'],
//     nextSubId: data['nextSubId'],
//     name: data['name'],
//     short: data['short'],
//     long: data['long'],
//     locked: data['locked'],
//     complete: data['complete'],
//     keyArt: data['keyArt'],
//   );
// }
//
//
// void _mapTask(Map<String, dynamic> data) {
//   var rec = Task(
//     submoduleId: data['submoduleId'],
//     name: data['name'],
//     short: data['short'],
//     long: data['long'],
//     type: data['type'],
//     locked: data['locked'],
//     complete: data['complete'],
//     keyArt: data['keyArt'],
//   );
// }



// class Module {
//   Module({
//     @required this.type,
//     @required this.nextModId,
//     @required this.name,
//     @required this.short,
//     @required this.long,
//     @required this.complete,
//   });
//
//   final String type; // Design | Build
//   final String nextModId;
//   final String name;
//   final String short;
//   final String long;
//   final bool complete;
// }
//
// class Submodule {
//   Submodule({
//     @required this.moduleId,
//     @required this.nextSubId,
//     @required this.name,
//     @required this.short,
//     @required this.long,
//     @required this.locked,
//     @required this.complete,
//     @required this.keyArt,
//   });
//
//   final String id;
//   final String moduleId;
//   final String nextSubId;
//   final String name;
//   final String short;
//   final String long;
//   final bool locked;
//   final bool complete;
//   final String keyArt;
// }
//
// class Task {
//   Task({
//     @required this.id,
//     @required this.submoduleId,
//     @required this.name,
//     @required this.short,
//     @required this.long,
//     @required this.type,
//     @required this.locked,
//     @required this.complete,
//     @required this.keyArt,
//   });
//
//   final String id;
//   final String submoduleId;
//   final String name;
//   final String short;
//   final String long;
//   final String type; // NetworkedImage|NetworkedVideo|DeviceImage|Question
//   final bool locked;
//   final bool complete;
//   final String keyArt;
// }
