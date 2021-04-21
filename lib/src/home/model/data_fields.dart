// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';





mixin ModuleFields {
  //
  Id id;
  Name name;
  ShortDescription short;
  LongDescription long;
  ModuleType type;
  Deleted deleted;

  void populate([Map<String, dynamic> map]) {
    //
    final ma = MapClass(map);

    id = Id(ma.p('id'));
    name = Name(ma.p('name'));
    short = ShortDescription(ma.p('short_description'));
    long = LongDescription(ma.p('long_description'));
    type = ModuleType(ma.p('module_type'));
    deleted = Deleted(ma.p('deleted'));
  }
}

mixin SubmoduleFields {
  //
  Id id;
  ModuleId moduleId;
  Name name;
  ShortDescription short;
  LongDescription long;
  ModuleType type;
  Deleted deleted;

  void populate([Map<String, dynamic> map]) {
    //
    final ma = MapClass(map);

    id = Id(ma.p('id'));
    moduleId = ModuleId(ma.p('module_id'));
    name = Name(ma.p('name'));
    short = ShortDescription(ma.p('short_description'));
    long = LongDescription(ma.p('long_description'));
    type = ModuleType(ma.p('module_type'));
    deleted = Deleted(ma.p('deleted'));
  }
}

mixin TasksFields {
  //
  Id id;
  SubmoduleId submoduleId;
  Name name;
  ShortDescription short;
  LongDescription long;
  NextTaskId nextTaskId;
  Deleted deleted;

  void populate([Map<String, dynamic> map]) {
    //
    final ma = MapClass(map);

    id = Id(ma.p('id'));
    submoduleId = SubmoduleId(ma.p('submodule_id'));
    name = Name(ma.p('name'));
    short = ShortDescription(ma.p('short_description'));
    long = LongDescription(ma.p('long_description'));
    nextTaskId = NextTaskId(ma.p('next_task_id'));
    deleted = Deleted(ma.p('deleted'));
  }
}

mixin UsersTasksFields {
  //
  Id id;
  UserId userId;
  TaskId taskId;
  Name name;
  ShortDescription short;
  LongDescription long;
  NextTaskId nextTaskId;
  Deleted deleted;

  void populate([Map<String, dynamic> map]) {
    //
    final ma = MapClass(map);

    id = Id(ma.p('rowid'));
    userId = UserId(ma.p('user_id'));
    taskId = TaskId(ma.p('task_id'));
    name = Name(ma.p('name'));
    short = ShortDescription(ma.p('short_description'));
    long = LongDescription(ma.p('long_description'));
    deleted = Deleted(ma.p('deleted'));
  }
}

mixin UsersFields {
  //
  Id id;
  Name name;
  Email email;
  Phone phone;
  LoginProvider loginProvider;
  OrganizationId organizationId;
  ShortDescription short;
  LongDescription long;
  NextTaskId nextTaskId;
  KeyArt keyArt;
  Deleted deleted;

  void populate([Map<String, dynamic> map]) {
    //
    final ma = MapClass(map);

    id = Id(ma.p('id'));
    name = Name(ma.p('name'));
    email = Email(ma.p('emails'));
    phone = Phone(ma.p('phones'));
    loginProvider = LoginProvider(ma.p('login_provider'));
    organizationId = OrganizationId(ma.p('organization_id'));
    short = ShortDescription(ma.p('short_description'));
    long = LongDescription(ma.p('long_description'));
    keyArt = KeyArt(ma.p('keyart'));
    deleted = Deleted(ma.p('deleted'));
  }
}


mixin OrganizationsFields {
  //
  Id id;
  Name name;
  ShortDescription short;
  LongDescription long;
  KeyArt keyArt;
  TimeStamp timeStamp;
  Deleted deleted;

  void populate([Map<String, dynamic> map]) {
    //
    final ma = MapClass(map);

    id = Id(ma.p('id'));
    name = Name(ma.p('name'));
    short = ShortDescription(ma.p('short_description'));
    long = LongDescription(ma.p('long_description'));
    keyArt = KeyArt(ma.p('keyart'));
    timeStamp = TimeStamp(ma.p('time_stamp'));
    deleted = Deleted(ma.p('deleted'));
  }
}


/// Add to the class this:
/// `extends FieldWidgets<T> with FieldChange`
mixin FormFields on FieldWidgets<Map<String, dynamic>> {
  //
  Set<FieldWidgets<Map<String, dynamic>>> get changedFields => _changedFields;
  static final Set<FieldWidgets<Map<String, dynamic>>> _changedFields = {};

  /// If the field's value changed, that field is added to a Set.
  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    if (isChanged()) {
      _changedFields.add(this);
    }
  }

  bool changeIn<T>() => changedFields.whereType<T>().isNotEmpty;
}

class Id extends FieldWidgets<Map<String, dynamic>> with FormFields {
  Id(dynamic value) : super(label: 'Id', value: value);
}

class Name extends FieldWidgets<Map<String, dynamic>> with FormFields {
  //
  Name([Map<String, dynamic> rec])
      : super(
    object: rec,
    label: 'Name',
    value: rec['name'],
  );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    object['name'] = value = v;
  }

  @override
  String onValidator(String v) {
    super.onValidator(v);
    String errorText;
    if (v.isEmpty) {
      errorText = 'Item cannot be empty!';
    }
    return errorText;
  }
}

class ShortDescription extends FieldWidgets<Map<String, dynamic>> with FormFields {
  //
  ShortDescription([Map<String, dynamic> rec])
      : super(
    object: rec,
    label: 'Short Description',
    value: rec['short_description'],
  );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    object['short_description'] = value = v;
  }

  @override
  String onValidator(String v) {
    super.onValidator(v);
    String errorText;
    if (v.isEmpty) {
      errorText = 'Item cannot be empty!';
    }
    return errorText;
  }
}

class LongDescription extends FieldWidgets<Map<String, dynamic>> with FormFields {
  //
  LongDescription([Map<String, dynamic> rec])
      : super(
    object: rec,
    label: 'Long Description',
    value: rec['long_description'],
  );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    object['long_description'] = value = v;
  }

  @override
  String onValidator(String v) {
    super.onValidator(v);
    String errorText;
    if (v.isEmpty) {
      errorText = 'Item cannot be empty!';
    }
    return errorText;
  }
}

class ModuleType extends FieldWidgets<Map<String, dynamic>> with FormFields {
  //
  ModuleType([Map<String, dynamic> rec])
      : super(
    object: rec,
    label: 'Module Type',
    value: rec['module_type'],
  );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    object['module_type'] = value = v;
  }

  @override
  String onValidator(String v) {
    super.onValidator(v);
    String errorText;
    if (v.isEmpty) {
      errorText = 'Item cannot be empty!';
    }
    return errorText;
  }
}

class ModuleId extends FieldWidgets<Map<String, dynamic>> with FormFields {
  //
  ModuleId([Map<String, dynamic> rec])
      : super(
    object: rec,
    label: 'Module Id',
    value: rec['module_id'],
  );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    object['module_id'] = value = v;
  }

  @override
  String onValidator(String v) {
    super.onValidator(v);
    String errorText;
    if (v.isEmpty) {
      errorText = 'Id cannot be empty!';
    }
    return errorText;
  }
}

class SubmoduleId extends FieldWidgets<Map<String, dynamic>> with FormFields {
  //
  SubmoduleId([Map<String, dynamic> rec])
      : super(
    object: rec,
    label: 'Submodule Id',
    value: rec['submodule_id'],
  );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    object['submodule_id'] = value = v;
  }

  @override
  String onValidator(String v) {
    super.onValidator(v);
    String errorText;
    if (v.isEmpty) {
      errorText = 'Id cannot be empty!';
    }
    return errorText;
  }
}

class NextTaskId extends FieldWidgets<Map<String, dynamic>> with FormFields {
  NextTaskId(dynamic value) : super(label: 'Id', value: value);
}

class UserId extends FieldWidgets<Map<String, dynamic>> with FormFields {
  UserId(dynamic value) : super(label: 'Id', value: value);
}

class TaskId extends FieldWidgets<Map<String, dynamic>> with FormFields {
  TaskId(dynamic value) : super(label: 'Id', value: value);
}

class OrganizationId extends FieldWidgets<Map<String, dynamic>> with FormFields {
  OrganizationId(dynamic value) : super(label: 'Id', value: value);
}

class Phone extends FieldWidgets<Map<String, dynamic>> with FormFields {
  //
  Phone([dynamic value])
      : super(
    label: 'Phone',
    value: value,
    inputDecoration: const InputDecoration(labelText: 'Phone'),
    keyboardType: TextInputType.phone,
  ) {
    // Change the name of the map's key fields.
    keys(value: 'phone');
    // There may be more than one phone number
    one2Many<Phone>(() => Phone());
  }

  Phone.init(DataFieldItem dataItem)
      : super(
    label: dataItem.label,
    value: dataItem.value,
    type: dataItem.type,
  );

  @override
  ListItems<Map<String, dynamic>> onListItems({
    String title,
    List<FieldWidgets<Map<String, dynamic>>> items,
    MapItemFunction mapItem,
    GestureTapCallback onTap,
    ValueChanged<String> onChanged,
    List<String> dropItems,
  }) =>
      super.onListItems(
        title: title,
        items: items,
        mapItem: mapItem,
        onTap: onTap,
        onChanged: onChanged ?? (String value) => App.refresh(),
        dropItems:
        dropItems ?? const ['home', 'work', 'landline', 'modile', 'other'],
      );
}

class Email extends FieldWidgets<Map<String, dynamic>> with FormFields {
  Email([dynamic value])
      : super(
    label: 'Email',
    value: value,
    inputDecoration: const InputDecoration(labelText: 'Email'),
    keyboardType: TextInputType.emailAddress,
  ) {
    // There may be more than one email address.
    one2Many<Email>(() => Email());
  }

  Email.init(DataFieldItem dataItem)
      : super(
    label: dataItem.label,
    value: dataItem.value,
    type: dataItem.type,
  );

  @override
  ListItems<Map<String, dynamic>> onListItems({
    String title,
    List<FieldWidgets<Map<String, dynamic>>> items,
    MapItemFunction mapItem,
    GestureTapCallback onTap,
    ValueChanged<String> onChanged,
    List<String> dropItems,
  }) =>
      super.onListItems(
        title: title,
        items: items,
        mapItem: mapItem,
        onTap: onTap,
        dropItems: dropItems ?? ['home', 'work', 'other'],
        onChanged: onChanged ?? (String value) => App.refresh(),
      );
}

class LoginProvider extends FieldWidgets<Map<String, dynamic>> with FormFields {
  LoginProvider(dynamic value) : super(label: 'Provider', value: value);
}

class KeyArt extends FieldWidgets<Map<String, dynamic>> with FormFields {
  KeyArt(dynamic value) : super(label: 'Key Art', value: value);
}

class TimeStamp extends FieldWidgets<Map<String, dynamic>> with FormFields {
  TimeStamp(dynamic value) : super(label: 'Time Stamp', value: value);
}

class Deleted extends FieldWidgets<Map<String, dynamic>> with FormFields {
  Deleted(dynamic value) : super(label: 'Deleted', value: value);
}


