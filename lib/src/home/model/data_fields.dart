// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart' hide User;

/// SQLite database
import 'package:playhouse/src/home/model/sqlite_db.dart' as s;

/// The Fields consolidated Class
export 'package:playhouse/src/home/model/database_class.dart';

class ModuleFields extends PlayHouseFields<ModulesTable> {
  factory ModuleFields() => _this ??= ModuleFields._();
  ModuleFields._() {
    table = s.ModulesTable();
  }
  static ModuleFields _this;
}

class SubmoduleFields extends PlayHouseFields<SubmodulesTable> {
  factory SubmoduleFields() => _this ??= SubmoduleFields._();
  SubmoduleFields._() {
    table = s.SubmodulesTable();
  }
  static SubmoduleFields _this;
}

class TasksFields extends PlayHouseFields<TasksTable> {
  factory TasksFields() => _this ??= TasksFields._();
  TasksFields._() {
    table = s.TasksTable();
  }
  static TasksFields _this;
}

class UsersTasksFields extends PlayHouseFields<UsersTasksTable> {
  factory UsersTasksFields() => _this ??= UsersTasksFields._();
  UsersTasksFields._() {
    table = s.UsersTasksTable();
  }
  static UsersTasksFields _this;
}

class UsersFields extends PlayHouseFields<UsersTable> {
  factory UsersFields() => _this ??= UsersFields._();
  UsersFields._() {
    table = s.UsersTable();
  }
  static UsersFields _this;
}

class OrganizationsFields extends PlayHouseFields<OrganizationsTable> {
  factory OrganizationsFields() => _this ??= OrganizationsFields._();
  OrganizationsFields._() {
    table = s.OrganizationsTable();
  }
  static OrganizationsFields _this;
}

@mustCallSuper
class PlayHouseFields<T> extends DataFields<T> {
  SQLiteTable table;

  Future<bool> initAsync() async {
    bool init = true;
    try {
      //
      final _query = await query();

      for (final field in field.values) {
        field.forEach((String field, FieldWidgets<T> widget) {
          switch (field) {
            case 'deleted':
              widget.label = 'Deleted';
              break;
            case 'time_stamp':
              widget.label = 'Time Stamp';
              break;
            case 'key_art':
              widget.label = 'Key Art';
              break;
            case 'email_address':
              widget.label = 'Email Address';
              break;
            case 'phone_number':
              widget.label = 'Phone Number';

              break;
            case 'login_provider':
              widget.label = 'Login Provider';
              widget.keyboardType = TextInputType.name;
              break;
            case 'long_description':
              widget.label = 'Long Description';
              widget.keyboardType = TextInputType.name;
              widget.validator = notEmpty;
              widget.maxLines = 3;
              break;
            case 'short_description':
              widget.label = 'Short Description';
              widget.keyboardType = TextInputType.name;
              widget.validator = notEmpty;
              break;
            case 'name':
              widget.label = 'Name';
              widget.keyboardType = TextInputType.name;
              widget.validator = notEmpty;
              break;
            case 'module_type':
              widget.label = 'Module Type';
              widget.keyboardType = TextInputType.name;
              widget.validator = notEmpty;
              break;
            case 'rowid':
              widget.label = 'Id';
              break;
          }
        });
      }

      // for (final Map<String, dynamic> map in _query) {
      //   //
      //   final _organization = Organization(record: map);
      //
      //   organizationList.add(_organization);
      // }
    } catch (e) {
      init = false;
      rethrow;
    }
    return init;
  }

  @override
  Future<List<Map<String, dynamic>>> retrieve() => table.list;

  @override
  Future<bool> add(Map<String, dynamic> rec) async => false;

  @override
  Future<bool> save(Map<String, dynamic> rec) {
    //
    // final Map<String, dynamic> record = rec.map((key, value) {
    //   final test = value.value;
    //   final fld = (value as FieldWidgets<OrganizationsTable>).value;
    //   return
    // });
    return table.save(rec.map((key, value) => MapEntry(key, value.value)));
  }

  @override
  Future<bool> delete(Map<String, dynamic> rec) async => false;

  @override
  Future<bool> undo(Map<String, dynamic> rec) async => false;
}

/// Add to the class this:
/// `extends FieldWidgets<T> with FieldChange`
mixin FormFields<T> on FieldWidgets<T> {
  //
  Set<FieldWidgets<T>> get changedFields => _changedFields;
  final Set<FieldWidgets<T>> _changedFields = {};

  bool changeIn<U>() => changedFields.whereType<U>().isNotEmpty;

  /// If the field's value changed, that field is added to a Set.
  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    if (isChanged()) {
      _changedFields.add(this);
    }
  }
}

/// <<<<<<<<<<<<<<<<<<<< Then I delete all the rest of this.

class Id<T extends KeyField> extends FieldWidgets<T> with FormFields {
  Id(
    T object,
    dynamic value, {
    String label = 'id',
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: label,
          value: value,
          saved: onSaved,
        );
}

class Name<T extends Descriptions> extends FieldWidgets<T> with FormFields {
  //
  Name(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Name',
          value: value,
          saved: onSaved,
          keyboardType: TextInputType.name,
          validator: notEmpty,
        );

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

class ShortDescription<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  //
  ShortDescription(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Short Description',
          value: value,
          saved: onSaved,
          keyboardType: TextInputType.name,
          validator: notEmpty,
        );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    value = v;
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

class LongDescription<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  //
  LongDescription(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Long Description',
          value: value,
          saved: onSaved,
          maxLines: 3,
          keyboardType: TextInputType.name,
          validator: notEmpty,
        );

  @override
  void onSaved(dynamic v) {
    super.onSaved(v);
    value = v;
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

class ModuleType<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  //
  ModuleType(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Module Type',
          value: value,
          saved: onSaved,
          keyboardType: TextInputType.name,
          validator: notEmpty,
        );

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

class ModuleId<T extends Descriptions> extends Id {
  //
  ModuleId(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object,
          value,
          label: 'Id',
          onSaved: onSaved,
        );

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

class SubmoduleId<T extends Descriptions> extends Id {
  //
  SubmoduleId(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object,
          value,
          label: 'Id',
          onSaved: onSaved,
        );

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

class NextTaskId<T extends Descriptions> extends Id {
  NextTaskId(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object,
          value,
          label: 'Id',
          onSaved: onSaved,
        );
}

class UserId<T extends Descriptions> extends Id {
  UserId(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object,
          value,
          label: 'Id',
          onSaved: onSaved,
        );
}

class TaskId<T extends Descriptions> extends Id {
  TaskId(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object,
          value,
          label: 'Id',
          onSaved: onSaved,
        );
}

class OrganizationId<T extends Descriptions> extends Id {
  OrganizationId(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object,
          value,
          label: 'Id',
          onSaved: onSaved,
        );
}

class PhoneNumber<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  //
  PhoneNumber(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Phone',
          value: value,
          saved: onSaved,
          inputDecoration: const InputDecoration(labelText: 'Phone'),
          keyboardType: TextInputType.phone,
        ) {
    // Change the name of the map's key fields.
    keys(value: 'phone');
    // There may be more than one phone number
    one2Many<PhoneNumber<T>>(() => PhoneNumber(this.object, this.value));
  }

  PhoneNumber.init(DataFieldItem dataItem)
      : super(
          label: dataItem.label,
          value: dataItem.value,
          type: dataItem.type,
        );

  @override
  ListItems<T> onListItems({
    String title,
    List<FieldWidgets<T>> items,
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

class EmailAddress<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  EmailAddress(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Email',
          value: value,
          saved: onSaved,
          inputDecoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
        ) {
    // There may be more than one email address.
    one2Many<EmailAddress<T>>(() => EmailAddress(this.object, this.value));
  }

  EmailAddress.init(DataFieldItem dataItem)
      : super(
          label: dataItem.label,
          value: dataItem.value,
          type: dataItem.type,
        );

  @override
  ListItems<T> onListItems({
    String title,
    List<FieldWidgets<T>> items,
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

class LoginProvider<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  LoginProvider(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Provider',
          value: value,
          saved: onSaved,
          keyboardType: TextInputType.name,
        );
}

class KeyArt<T> extends FieldWidgets<T> with FormFields {
  KeyArt(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Key Art',
          value: value,
          saved: onSaved,
        );
}

class TimeStamp<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  TimeStamp(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Time Stamp',
          value: value.toString(),
          saved: onSaved,
        );
}

class Locked<T extends Descriptions> extends FieldWidgets<T> with FormFields {
  Locked(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Locked',
          value: value,
          saved: onSaved,
        );
}

class Completed<T extends Descriptions> extends FieldWidgets<T>
    with FormFields {
  Completed(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Completed',
          value: value,
          saved: onSaved,
        );
}

class Deleted<T extends KeyField> extends FieldWidgets<T> with FormFields {
  Deleted(
    T object,
    dynamic value, {
    void Function(String) onSaved,
  }) : super(
          object: object,
          label: 'Deleted',
          value: value,
          saved: onSaved,
        );
}

String notEmpty(String v) => v.isEmpty ? 'Cannot be empty' : null;

mixin FieldClass {}
