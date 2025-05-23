// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

///
mixin ScrapbookFields implements UseWhichWidgets {
  ///
  List<Widget> columnWidgets(
      Map<String, FieldWidgets<PlayHouseFields>> fldWidget) {
    //
    final List<Widget> _fieldWidgets = [];

    if (fldWidget['rowid'] != null && fldWidget['rowid']!.value != null) {
      final value = fldWidget['rowid']!.value;
      String text;
      if (value == null) {
        text = '';
      } else if (value is bool) {
        text = value ? 'true' : 'false';
      } else if (value is String) {
        text = value.trim();
      } else {
        text = value.toString().trim();
      }
      _fieldWidgets.add(_title(fldWidget['rowid']!.label!));
      _fieldWidgets.add(
        Flexible(
          child: Text(text, style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['name'] != null && fldWidget['name']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['name']!.label!));
      _fieldWidgets.add(
        Flexible(
          flex: 2,
          child: Text(fldWidget['name']!.value,
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['short_description'] != null &&
        fldWidget['short_description']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['short_description']!.label!));
      _fieldWidgets.add(
        Flexible(
          flex: 3,
          child: Text(fldWidget['short_description']!.value,
              style: const TextStyle(fontSize: 14)),
        ),
      );
      _fieldWidgets.add(_title(fldWidget['long_description']!.label!));
      _fieldWidgets.add(Flexible(
        flex: 4,
        child: Text(fldWidget['long_description']!.value,
            style: const TextStyle(fontSize: 14)),
      ));
    }

    if (useKeyArt &&
        fldWidget['key_art'] != null &&
        fldWidget['key_art']!.value != null) {
      _fieldWidgets.add(
        Flexible(
          child: Text(fldWidget['key_art']!.value,
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['time_stamp'] != null &&
        fldWidget['time_stamp']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['time_stamp']!.label!));
      _fieldWidgets.add(
        Flexible(
          child: Text(fldWidget['time_stamp']!.value.toString(),
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['email_address'] != null &&
        fldWidget['email_address']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['email_address']!.label!));
      _fieldWidgets.add(
        Flexible(
          child: Text(fldWidget['email_address']!.value.toString(),
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['phone_number'] != null &&
        fldWidget['phone_number']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['phone_number']!.label!));
      _fieldWidgets.add(
        Flexible(
          child: Text(fldWidget['phone_number']!.value.toString(),
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['organization_id'] != null &&
        fldWidget['organization_id']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['organization_id']!.label!));
      _fieldWidgets.add(
        Flexible(
          child: Text(fldWidget['organization_id']!.value.toString(),
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['module_id'] != null &&
        fldWidget['module_id']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['module_id']!.label!));
      _fieldWidgets.add(
        Flexible(
          child: Text(fldWidget['module_id']!.value.toString(),
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    if (fldWidget['next_module_id'] != null &&
        fldWidget['next_module_id']!.value != null) {
      _fieldWidgets.add(_title(fldWidget['next_module_id']!.label!));
      _fieldWidgets.add(
        Flexible(
          child: Text(fldWidget['next_module_id']!.value.toString(),
              style: const TextStyle(fontSize: 14)),
        ),
      );
    }

    _fieldWidgets
        .add(const Flexible(child: Divider(thickness: 4, color: Colors.black)));

    return _fieldWidgets;
  }

  Widget _title(String title) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(title,
            style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
      );
}

///
class UseWhichWidgets {
  ///
  late bool useModuleType;

  ///
  late bool useLocked;

  ///
  late bool useKeyArt;

  ///
  late bool useCompleted;

  ///
  late bool useDeleted;

  ///
  late bool useLockedFirst;

  ///
  late bool useNextId;
}
