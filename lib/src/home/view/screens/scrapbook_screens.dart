// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

typedef WidgetListFunc = List<Widget> Function(
    Map<String, FieldWidgets<PlayHouseFields>> record, VoidCallback onTap);

typedef WidgetEditFunc = List<Widget> Function(
    Map<String, FieldWidgets<PlayHouseFields>> record);

abstract class ScrapbookListScreen<T extends StatefulWidget,
    U extends PlayHouseFields> extends State<T> {
  ScrapbookListScreen([this.title]) {
    con = ScrapBookController();
  }

  final String title;
  ScrapBookController con;

  U get fields;

  @override
  void initState() {
    super.initState();
    _list = fetchData();
  }

  List<Map<String, FieldWidgets<PlayHouseFields>>> _list = [];

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(title ?? 'List'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final title = 'New ${this.title ?? ''} Record';
              await Navigator.of(context)
                  .push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext _) => ScrapbookEditScreen(
                        record: newRecord(),
                        widgetEdit: editWidgets,
                        title: title,
                      ),
                    ),
                  )
                  .then((value) => setState(() {}));
            },
            child: const Icon(Icons.add),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext _) =>
                              InheritedTheme.captureAll(
                            context,
                            detailsScreen(
                                _list[index], addedWidgets, editWidgets),
                          ),
                        ),
                      )
                      .then((_) => setState(() {}));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: columnWidgets(_list[index]),
                ),
              ),
            ),
          ),
        ),
      );

  /// Override this routine to supply your own details scrren.
  Widget detailsScreen(Map<String, FieldWidgets<PlayHouseFields>> record,
          WidgetListFunc widgetList, WidgetEditFunc widgetEdit) =>
      ScrapbookDetailsScreen(record, widgetList, widgetEdit);

  /// Optionally add any additional widgets from the record list.
  List<Widget> addedWidgets(Map<String, FieldWidgets<PlayHouseFields>> record,
          VoidCallback onTap) =>
      null;

  /// Optionally add any additional widgets from the record list.
  List<Widget> editWidgets(Map<String, FieldWidgets<PlayHouseFields>> record) =>
      null;

  List<Widget> columnWidgets(
      Map<String, FieldWidgets<PlayHouseFields>> fldWidget);

  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData();

  Map<String, FieldWidgets<PlayHouseFields>> newRecord();
}

class ScrapbookDetailsScreen extends StatefulWidget {
  const ScrapbookDetailsScreen(
    this.record,
    this.widgetList,
    this.widgetEdit, {
    Key key,
  }) : super(key: key);
  final Map<String, FieldWidgets<PlayHouseFields>> record;
  final WidgetListFunc widgetList;
  final WidgetEditFunc widgetEdit;
  @override
  State createState() => _ScrapbookDetailsScreenState();
}

class _ScrapbookDetailsScreenState extends State<ScrapbookDetailsScreen> {
  //
  @override
  void initState() {
    super.initState();
    record = widget.record;
    // Supply default widgets
    widgets = <Widget>[
      record['rowid'].onListTile(enabled: false, tap: onTap),
      record['name'].onListTile(tap: onTap),
      record['short_description'].onListTile(tap: onTap),
      record['long_description'].onListTile(tap: onTap),
    ];
    final func = widget.widgetList;
    final List<Widget> list = func == null ? null : func(record, onTap);
    if (list != null) {
      widgets.addAll(list);
    }
    final timeStamp = record['time_stamp'];
    if (timeStamp != null) {
      widgets.add(timeStamp.onListTile(
          tap: onTap, title: Text(timeStamp.value.toString())));
    }
  }

  List<Widget> widgets;
  VoidCallback onTap;
  Map<String, FieldWidgets<PlayHouseFields>> record;

  @override
  Widget build(BuildContext context) {
    onTap = () async {
      await Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (BuildContext context) => ScrapbookEditScreen(
                record: record,
                widgetEdit: widget.widgetEdit,
                title: 'Edit a contact',
              )));
      setState(() {});
    };
    return Scaffold(
      appBar: AppBar(title: record['name'].text, actions: [
        TextButton(
          onPressed: () {
            showBox(text: 'Delete this record?', context: context)
                .then((bool delete) {
              // if (delete) {
              //   record.delete(record.record).then((_) {
              //     Navigator.of(context).pop();
              //   });
              // }
            });
          },
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ]),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(widgets),
        )
      ]),
      bottomNavigationBar: SimpleBottomAppBar(
        button01: HomeBarButton(onPressed: () {
          Navigator.of(context).pop();
        }),
        button03: EditBarButton(onPressed: onTap),
      ),
    );
  }
}

/// To edit thr data
class ScrapbookEditScreen extends StatefulWidget {
  const ScrapbookEditScreen({
    this.record,
    this.widgetEdit,
    this.title,
    Key key,
  }) : super(key: key);
  final Map<String, FieldWidgets<PlayHouseFields>> record;
  final WidgetEditFunc widgetEdit;
  final String title;
  @override
  State createState() => _ScrapbookEditScreenState(ScrapBookController());
}

class _ScrapbookEditScreenState extends StateMVC<ScrapbookEditScreen> {
  _ScrapbookEditScreenState([ControllerMVC controller]) : super(controller);

  @override
  void initState() {
    super.initState();
    record = widget.record;
    fieldsObj = record.values.first.object;
    // final func = widget.widgetEdit;
    // widgets = func == null ? null : func(record);
    // if (widgets == null) {
    //   widgets = [];
    //   record.forEach((key, value) {
    //     widgets.add(value.textFormField);
    //   });
    // }
  }

  PlayHouseFields fieldsObj;
  Map<String, FieldWidgets<PlayHouseFields>> record;
  List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    widgets = _widgets(widget.widgetEdit);
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? 'Add New Record'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final pop = await fieldsObj.save(record);
                if (pop) {
                  Navigator.of(context).pop();
                }
              },
              child: const Icon(Icons.save, color: Colors.white),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: fieldsObj.formKey,
            child: ListView(
              children: widgets,
              // [
              //   record['name'].textFormField,
              //   record['short_description'].textFormField,
              //   record['long_description'].textFormField,
              // ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _widgets(WidgetEditFunc func) {
    var widgets = func == null ? null : func(record);
    if (widgets == null) {
      widgets = [];
      record.forEach((key, value) {
        widgets.add(value.textFormField);
      });
    }
    return widgets;
  }
}

String notEmpty(String v) => v.isEmpty ? 'Cannot be empty' : null;
