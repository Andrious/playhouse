// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

/// SQLite database
import 'package:playhouse/src/home/model/sqlite_db.dart' as s;

class Module extends Descriptions {
  Module({Map<String, dynamic> record})
      : table = s.ModulesTable(),
        super(record: record) {
    if (ma != null) {
      name = Name<Module>(this, ma.p('name'), onSaved: (String v) {
        name.value = v;
      });
      moduleType = ModuleType<Module>(this, ma.p('name'), onSaved: (String v) {
        moduleType.value = v;
      });
    }
  }

  Name name;
  ModuleType moduleType;
  final s.ModulesTable table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class Submodule extends Descriptions {
  Submodule({Map<String, dynamic> record})
      : table = s.SubmodulesTable(),
        super(record: record) {
    if (ma != null) {
      name = Name<Submodule>(this, ma.p('name'), onSaved: (String v) {
        name.value = v;
      });
      keyArt = KeyArt<Submodule>(this, ma.p('key_art'), onSaved: (art) {
        keyArt.value = art;
      });
    }
  }
  Name name;
  ModuleId moduleId;
  KeyArt keyArt;
  Id nextSubmoduleId;
  final s.SubmodulesTable table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class Task extends Descriptions {
  Task({Map<String, dynamic> record})
      : table = s.TasksTable(),
        super(record: record) {
    if (ma != null) {
      name = Name<Task>(this, ma.p('name'), onSaved: (String v) {
        name.value = v;
      });
      keyArt = KeyArt<Task>(this, ma.p('key_art'), onSaved: (art) {
        keyArt.value = art;
      });
    }
  }
  Name name;
  Id submoduleId;
  KeyArt keyArt;
  NextTaskId nextTaskId;
  final s.TasksTable table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class UsersTask extends Descriptions {
  UsersTask({Map<String, dynamic> record})
      : table = s.UsersTable(),
        super(record: record) {
    if (ma != null) {
      keyArt = KeyArt<UsersTask>(this, ma.p('key_art'), onSaved: (art) {
        keyArt.value = art;
      });
      timeStamp = TimeStamp<UsersTask>(
          this,
          ma.p(
            'time_stamp',
          ), onSaved: (time) {
        timeStamp.value = time;
      });
    }
  }
  UserId userId;
  TaskId taskId;
  KeyArt keyArt;
  TimeStamp timeStamp;
  final s.UsersTable table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class User extends Descriptions {
  User({Map<String, dynamic> record})
      : table = s.UsersTable(),
        super(record: record) {
    if (ma != null) {
      name = Name<User>(this, ma.p('name'), onSaved: (String v) {
        name.value = v;
      });
      emailAddress =
          EmailAddress<User>(this, ma.p('email_address'), onSaved: (name) {
        emailAddress.value = name;
      });
      phoneNumber =
          PhoneNumber<User>(this, ma.p('phone_number'), onSaved: (name) {
        phoneNumber.value = name;
      });
      loginProvider =
          LoginProvider<User>(this, ma.p('login_provider'), onSaved: (name) {
        loginProvider.value = name;
      });
      keyArt = KeyArt<User>(this, ma.p('key_art'), onSaved: (art) {
        keyArt.value = art;
      });
      timeStamp = TimeStamp<User>(
          this,
          ma.p(
            'time_stamp',
          ), onSaved: (time) {
        timeStamp.value = time;
      });
    }
  }
  Name name;
  EmailAddress emailAddress;
  PhoneNumber phoneNumber;
  LoginProvider loginProvider;
  KeyArt keyArt;
  TimeStamp timeStamp;
  final s.UsersTable table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class Organization extends Descriptions {
  Organization({Map<String, dynamic> record})
      : table = s.OrganizationsTable(),
        super(record: record) {
    if (ma != null) {
      name = Name<Organization>(this, ma.p('name'), onSaved: (String v) {
        name.value = v;
      });
      keyArt = KeyArt<Organization>(this, ma.p('key_art'), onSaved: (art) {
        keyArt.value = art;
      });
      timeStamp = TimeStamp<Organization>(
          this,
          ma.p(
            'time_stamp',
          ), onSaved: (time) {
        timeStamp.value = time;
      });
    }
  }
  Name name;
  KeyArt keyArt;
  TimeStamp timeStamp;
  final s.OrganizationsTable table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async {
    Map<String, dynamic> rec;
    return table.retrieve();
  }

  @override
  Future<bool> add(Map<String, dynamic> rec) async {
    Map<String, dynamic> rec;
    return table.add(rec);
  }

  @override
  Future<bool> save(Map<String, dynamic> rec) async {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    _formKey.currentState.save();
    _inForm = false;
    return add(rec);
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async {
    return table.delete(rec);
  }

  @override
  Future<bool> undo(Map<String, dynamic> rec) async {
    Map<String, dynamic> rec;
    return table.undo(rec);
  }
}

class OrganizationUser {
  Id rowid;
  OrganizationId organizationId;
  UserId userId;
}

class OrganizationModule extends OrganizationLocked {
  OrganizationModule()
      : table = s.OrganizationsModules(),
        super();
  final s.OrganizationsModules table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class OrganizationSubmodule extends OrganizationLocked {
  OrganizationSubmodule()
      : table = s.OrganizationsSubmodules(),
        super();
  final s.OrganizationsSubmodules table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class OrganizationTask extends OrganizationLocked {
  OrganizationTask()
      : table = s.OrganizationsTasks(),
        super();
  final s.OrganizationsTasks table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class OrganizationLocked extends OrganizationId {
  Locked locked;
}

class OrganizationId extends KeyField {
  OrganizationId organizationId;
}

class UsersModuleUnlocked extends Complete {
  UsersModuleUnlocked()
      : table = s.UserModulesUnlocked(),
        super();
  Id moduleId;
  final s.UserModulesUnlocked table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class UserSubmoduleUnlocked extends Complete {
  UserSubmoduleUnlocked()
      : table = s.UserSubmodulesUnlocked(),
        super();
  Id submoduleId;
  final s.UserSubmodulesUnlocked table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class UserTaskUnlocked extends Complete {
  UserTaskUnlocked()
      : table = s.UserTasksUnlocked(),
        super();
  Id taskId;
  final s.UserTasksUnlocked table;

  @override
  Future<List<Map<String, dynamic>>> retrieve() async => table.retrieve();

  @override
  Future<bool> add(Map<String, dynamic> rec) async => table.add(rec);

  @override
  Future<bool> save(Map<String, dynamic> rec) async => table.save(rec);

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => table.delete(rec);

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => table.undo(rec);
}

class Complete extends UsersId {
  Completed completed;
}

class UsersId extends KeyField {
  UserId userId;
}

class Descriptions extends KeyField {
  Descriptions({Map<String, dynamic> record}) : super(record: record) {
    _formKey = GlobalKey<FormState>();
    if (ma != null) {
      short = ShortDescription<Descriptions>(this, ma.p('short_description'));
      long = LongDescription<Descriptions>(this, ma.p('long_description'));
    }
  }
  ShortDescription short;
  LongDescription long;

  GlobalKey<FormState> get formKey {
    if (!_inForm) {
      _inForm = true;
    }
    return _formKey;
  }

  GlobalKey<FormState> _formKey;
  bool _inForm = false;

// Future<bool> onPressed([BuildContext context]) async {
//   if (!_formKey.currentState.validate()) {
//     return false;
//   }
//   _formKey.currentState.save();
//   _inForm = false;
//   return add();
// }
}

/// The primary key of every table record
class KeyField extends FieldsRecord {
  KeyField({Map<String, dynamic> record}) : super(record: record) {
    if (ma != null) {
      //
      id = Id<KeyField>(this, ma.p('rowid'));
      deleted = Deleted<KeyField>(
        this,
        ma.p('deleted'),
        onSaved: (delete) {
          deleted.value = delete;
        },
      );
    }
  }
  Id id;
  Deleted deleted;
}

/// the base class
class FieldsRecord {
  FieldsRecord({Map<String, dynamic> record}): super() {
    this.record = record;
    ma = MapClass(record);
  }
  MapClass ma;

  Map<String, dynamic> _record = {};
  Map<String, dynamic> get record => _record;
  List<String> fieldList;

  set record(Map<String, dynamic> record) {
    if (record == null) {
      fieldList = [];
    } else {
      _record = record;
      fieldList = record.keys.toList();
    }
  }

  Future<List<Map<String, dynamic>>> retrieve() async => [{}];

  Future<bool> add(Map<String, dynamic> rec) async => false;

  Future<bool> save(Map<String, dynamic> rec) async => false;

  Future<bool> delete(Map<String, dynamic> rec) async => false;

  Future<bool> undo(Map<String, dynamic> rec) async => false;

}
