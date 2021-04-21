// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

/// SQLite database
import 'package:playhouse/src/home/model/sqlite_db.dart' as s;

class Modules extends Descriptions {
  Modules({
    @required int rowid,
    @required this.name,
    @required String shortDescription,
    @required String longDescription,
    @required this.moduleType,
  })  : table = s.ModulesTable(),
        super(
          rowid: rowid,
          shortDescription: shortDescription,
          longDescription: longDescription,
        );

  final String name;
  final String moduleType;
  final s.ModulesTable table;
}

class Submodules extends Descriptions {
  Submodules({
    @required int rowid,
    @required this.name,
    @required String shortDescription,
    @required String longDescription,
    @required this.keyArt,
    @required this.moduleId,
    @required this.nextSubmoduleId,
  })  : table = s.SubmodulesTable(),
        super(
          rowid: rowid,
          shortDescription: shortDescription,
          longDescription: longDescription,
        );
  final String name;
  final int moduleId;
  final dynamic keyArt;
  final int nextSubmoduleId;
  s.SubmodulesTable table;
}

class Tasks extends Descriptions {
  Tasks({
    @required int rowid,
    @required this.name,
    @required String shortDescription,
    @required String longDescription,
    @required this.keyArt,
    @required this.submoduleId,
    @required this.nextTaskId,
  })  : table = s.TasksTable(),
        super(
          rowid: rowid,
          shortDescription: shortDescription,
          longDescription: longDescription,
        );
  final String name;
  final int submoduleId;
  final dynamic keyArt;
  final int nextTaskId;
  final s.TasksTable table;
}

class UsersTasks extends Descriptions {
  UsersTasks({
    @required int rowid,
    @required this.userId,
    @required this.taskId,
    @required String shortDescription,
    @required String longDescription,
    @required this.keyArt,
    @required this.timeStamp,
  })  : table = s.UsersTable(),
        super(
          rowid: rowid,
          shortDescription: shortDescription,
          longDescription: longDescription,
        );
  final int userId;
  final int taskId;
  final dynamic keyArt;
  final int timeStamp;
  final s.UsersTable table;
}

class Users extends Descriptions {
  Users({
    @required int rowid,
    @required this.name,
    @required this.emailAddress,
    @required this.phoneNumber,
    @required this.loginProvider,
    @required String shortDescription,
    @required String longDescription,
    @required this.keyArt,
    @required this.timeStamp,
  })  : table = s.UsersTable(),
        super(
          rowid: rowid,
          shortDescription: shortDescription,
          longDescription: longDescription,
        );
  final String name;
  final String emailAddress;
  final String phoneNumber;
  final String loginProvider;
  final dynamic keyArt;
  final int timeStamp;
  final s.UsersTable table;
}

class Organizations extends Descriptions {
  Organizations({
    @required int rowid,
    @required String shortDescription,
    @required String longDescription,
    @required this.keyArt,
    @required this.timeStamp,
  })  : table = s.OrganizationsTable(),
        super(
          rowid: rowid,
          shortDescription: shortDescription,
          longDescription: longDescription,
        );
  final dynamic keyArt;
  final int timeStamp;
  final s.OrganizationsTable table;
}

class OrganizationsUsers {
  OrganizationsUsers({
    this.rowid,
    this.organizationId,
    this.userId,
  });
  final int rowid;
  final int organizationId;
  final int userId;
}

class OrganizationsModules extends OrganizationsLocked {
  OrganizationsModules({
    @required int rowid,
    @required int companyId,
    @required bool locked,
  })  : table = s.OrganizationsModules(),
        super(
          rowid: rowid,
          companyId: companyId,
          locked: locked,
        );
  final s.OrganizationsModules table;
}

class OrganizationsSubmodules extends OrganizationsLocked {
  OrganizationsSubmodules({
    @required int rowid,
    @required int companyId,
    @required bool locked,
  })  : table = s.OrganizationsSubmodules(),
        super(
          rowid: rowid,
          companyId: companyId,
          locked: locked,
        );
  final s.OrganizationsSubmodules table;
}

class OrganizationsTasks extends OrganizationsLocked {
  OrganizationsTasks({
    @required int rowid,
    @required int companyId,
    @required bool locked,
  })  : table = s.OrganizationsTasks(),
        super(
          rowid: rowid,
          companyId: companyId,
          locked: locked,
        );
  final s.OrganizationsTasks table;
}

class OrganizationsLocked extends OrganizationsId {
  OrganizationsLocked({
    @required int rowid,
    @required int companyId,
    @required this.locked,
  }) : super(
          rowid: rowid,
          organizationId: companyId,
        );
  final bool locked;
}

class OrganizationsId extends KeyField {
  OrganizationsId({
    @required int rowid,
    @required this.organizationId,
  }) : super(rowid: rowid);
  final int organizationId;
}

class UsersModulesUnlocked extends Completed {
  UsersModulesUnlocked({
    @required int rowid,
    @required int userId,
    @required this.moduleId,
    @required bool completed,
  })  : table = s.UserModulesUnlocked(),
        super(
          rowid: rowid,
          userId: userId,
          completed: completed,
        );
  final int moduleId;
  final s.UserModulesUnlocked table;
}

class UsersSubmodulesUnlocked extends Completed {
  UsersSubmodulesUnlocked({
    @required int rowid,
    @required int userId,
    @required this.submoduleId,
    @required bool completed,
  })  : table = s.UserSubmodulesUnlocked(),
        super(
          rowid: rowid,
          userId: userId,
          completed: completed,
        );
  final int submoduleId;
  final s.UserSubmodulesUnlocked table;
}

class UsersTasksUnlocked extends Completed {
  UsersTasksUnlocked({
    @required int rowid,
    @required int userId,
    @required this.taskId,
    @required bool completed,
  })  : table = s.UserTasksUnlocked(),
        super(
          rowid: rowid,
          userId: userId,
          completed: completed,
        );
  final int taskId;
  final s.UserTasksUnlocked table;
}

class Completed extends UserId {
  Completed({
    @required int rowid,
    @required int userId,
    @required this.completed,
  }) : super(
          rowid: rowid,
          userId: userId,
        );
  final bool completed;
}

class UserId extends KeyField {
  UserId({
    @required int rowid,
    @required this.userId,
  }) : super(rowid: rowid);
  final int userId;
}

class Descriptions extends KeyField {
  Descriptions({
    @required int rowid,
    @required this.shortDescription,
    @required this.longDescription,
  }) : super(rowid: rowid);
  final String shortDescription;
  final String longDescription;
}

/// The primary key of every table record
class KeyField {
  KeyField({@required this.rowid});
  final int rowid;
}
