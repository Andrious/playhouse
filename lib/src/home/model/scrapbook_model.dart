// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/controller.dart';
import 'package:playhouse/src/model.dart';

///
class ScrapBookModel {
  ///
  factory ScrapBookModel() => _this ??= ScrapBookModel._();
  ScrapBookModel._()
      : app = AppController(),
        sqlDB = PlayhouseSQLiteDB(),
        modules = ModuleFields(),
        submodules = SubmoduleFields(),
        tasks = TasksFields(),
        usersTasks = UsersTasksFields(),
        usersScrapbook = UsersScrapbookFields(),
        users = UsersFields(),
        modulesUnlocked = UserModulesUnlockedFields(),
        submodulesUnlocked = UserSubmodulesUnlockedFields(),
        tasksUnlocked = UserTasksUnlockedFields(),
        organizationsModules = OrganizationsModuleFields(),
        organizationsSubmodules = OrganizationsSubmoduleFields(),
        organizationsTasks = OrganizationsTaskFields(),
        organizations = OrganizationsFields();

  static ScrapBookModel? _this;

  ///
  final AppController app;

  ///
  final PlayhouseSQLiteDB sqlDB;

  ///
  final ModuleFields modules;

  ///
  final SubmoduleFields submodules;

  ///
  final TasksFields tasks;

  ///
  final UsersTasksFields usersTasks;

  ///
  final UsersScrapbookFields usersScrapbook;

  ///
  final UsersFields users;

  ///
  final UserModulesUnlockedFields modulesUnlocked;

  ///
  final UserSubmodulesUnlockedFields submodulesUnlocked;

  ///
  final UserTasksUnlockedFields tasksUnlocked;

  ///
  final OrganizationsModuleFields organizationsModules;

  ///
  final OrganizationsSubmoduleFields organizationsSubmodules;

  ///
  final OrganizationsTaskFields organizationsTasks;

  ///
  final OrganizationsFields organizations;

  ///
  Future<bool> initAsync() async {
    //
    bool init = true;

    init = await sqlDB.initAsync(throwError: true);

    if (init) {
      init = await fetchData();
    }

    return init;
  }

  ///
  Future<bool> fetchData() async {
    bool fetch;
    try {
      await modules.initAsync();
      await submodules.initAsync();
      await tasks.initAsync();
      await usersTasks.initAsync();
      await usersScrapbook.initAsync();
      await users.initAsync();
      await modulesUnlocked.initAsync();
      await submodulesUnlocked.initAsync();
      await tasksUnlocked.initAsync();
      await organizationsModules.initAsync();
      await organizationsSubmodules.initAsync();
      await organizationsTasks.initAsync();
      await organizations.initAsync();
      fetch = true;
    } catch (e) {
      fetch = false;
      rethrow;
    }
    return fetch;
  }

  ///
  static List<Map<String, dynamic>> mapModules = [];

  ///
  static List<Map<String, dynamic>> mapSubmodules = [];

  ///
  static List<Map<String, dynamic>> mapTasks = [];

  ///
  static List<Map<String, dynamic>> mapUsers = [];

  ///
  static List<Map<String, dynamic>> mapScrapbook = [];

  ///
  static List<Map<String, dynamic>> mapOrganizations = [];

  ///
  bool populateModule(Map<String, dynamic> data) => _tryMap(data, _mapModule);

  ///
  bool populateSubmodule(Map<String, dynamic> data) =>
      _tryMap(data, _mapSubmodule);

  ///
  bool populateTask(Map<String, dynamic> data) => _tryMap(data, _mapTask);

  void _mapModule(Map<String, dynamic> data) => mapModules.add(data);

  void _mapSubmodule(Map<String, dynamic> data) => mapSubmodules.add(data);

  void _mapTask(Map<String, dynamic> data) => mapTasks.add(data);

  ///
  bool populateScrapbook(Map<String, dynamic> data) =>
      _tryMap(data, _mapScrapbook);

  void _mapScrapbook(Map<String, dynamic> data) => mapScrapbook.add(data);

  ///
  bool populateUsers(Map<String, dynamic> data) => _tryMap(data, _mapUsers);

  void _mapUsers(Map<String, dynamic> data) => mapUsers.add(data);

  ///
  bool populateOrganizations(Map<String, dynamic> data) =>
      _tryMap(data, _mapOrganizations);

  void _mapOrganizations(Map<String, dynamic> data) =>
      mapOrganizations.add(data);

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

  ///
  Future<bool> saveUserTask(Map<String, dynamic> userTask) =>
      usersTasks.save(userTask);
}
