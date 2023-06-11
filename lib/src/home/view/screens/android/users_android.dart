// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

/// Look to the mixin ScrapbookFields for the actual listing.
class UsersListAndroid extends ScrapbookListScreen<UsersList, UsersFields>
    with ScrapbookFields {
  UsersListAndroid() : super('User'.tr);

  @override
  UsersFields get fields => UsersFields();

  /// Flags indicating which fields are actually displayed.
  /// Note, flags are implemented in the mixin ScrapbookFields

  @override
  bool useModuleType = false;
  @override
  bool useLocked = false;

  @override
  bool useKeyArt = false;

  @override
  bool useLockedFirst = false;
  @override
  bool useNextId = false;
  @override
  bool useCompleted = false;
  @override
  bool useDeleted = false;

  /// Supply the widgets to 'list' the record.
  @override
  List<Widget> addedWidgets(
    Map<String, FieldWidgets<PlayHouseFields>> record,
    VoidCallback onTap,
  ) {
    final name = record['organization_name'];
    name!.label = 'Organization';
    final short = record['organization_short'];
    short!.label = 'Summary';
    final long = record['organization_long'];
    long!.label = 'Description';
    return [
      name.onListTile(tap: onTap),
      short.onListTile(tap: onTap),
      long.onListTile(tap: onTap),
    ];
  }

  /// Supply the fields required to 'edit' the current record.
  @override
  List<Widget> editWidgets(
    Map<String, FieldWidgets<PlayHouseFields>> record,
  ) {
    final org = record['organization_id'];
    final widgets = [
      record['rowid']!.onListTile(enabled: false),
      record['name']!.textFormField,
      record['short_description']!.textFormField,
      record['long_description']!.textFormField,
      record['email_address']!.textFormField,
      record['phone_number']!.textFormField,
      org!.onListItems(
        onChanged: (String? v) {
          con.setState(() {
            org.value = int.parse(v!);
          });
        },
        dropItems: _organizations(org),
      ),
    ];

    /// There may be additional 'organization' fields.
    if (record['organization_name'] != null) {
      widgets.addAll([
        record['organization_name']!.onListTile(enabled: false),
        record['organization_short']!.onListTile(enabled: false),
        record['organization_long']!.onListTile(enabled: false),
      ]);
    }
    return widgets;
  }

  /// List the user's organization
  List<String> _organizations(FieldWidgets<PlayHouseFields> record) =>
      OrganizationsFields().table.idList;

  @override
  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData() =>
      fields.field.values.toList();

  @override
  Map<String, FieldWidgets<PlayHouseFields<SQLiteTable>>> newRecord() =>
      fields.getNewRecord();
}

class ModulesUnlocked extends Unlocked<UsersModulesUnlocked> {
  ModulesUnlocked()
      : super(title: 'User Modules Unlocked', con: ScrapBookController());

  @override
  PlayHouseFields get fields => UserModulesUnlockedFields();
}

class SubmodulesUnlocked extends Unlocked<UsersSubmodulesUnlocked> {
  SubmodulesUnlocked()
      : super(title: 'User Submodules Unlocked', con: ScrapBookController());

  @override
  PlayHouseFields get fields => UserSubmodulesUnlockedFields();
}

class TasksUnlocked extends Unlocked<UsersTasksUnlocked> {
  TasksUnlocked()
      : super(title: 'User Tasks Unlocked', con: ScrapBookController());

  @override
  PlayHouseFields get fields => UserTasksUnlockedFields();
}

abstract class Unlocked<T extends StatefulWidget> extends StateX<T> {
  Unlocked({this.title = 'Unlocked', this.con}) : super(controller: con);
  StateXController? con;
  String title;

  PlayHouseFields get fields;

  @override
  void initState() {
    super.initState();
    _list = fields.items.map((e) => null).cast<Widget>().toList();
    if (_list.first == null) {
      _list = [Container()];
    }
  }

  /// List of widgets displayed.
  late List<Widget> _list;

  @override
  Widget buildAndroid(BuildContext context) => Theme(
        data: ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: _list,
            ),
          ),
        ),
      );
}
