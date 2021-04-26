// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

abstract class ScrapbookListScreen<T extends StatefulWidget,
    U extends PlayHouseFields> extends State<T> {
  //

  String title;

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
            title: Text(title),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.of(context)
                  .push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext _) => ScrapbookEditScreen(),
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
                            ScrapbookDetailsScreen(_list[index]),
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

  List<Widget> columnWidgets(
      Map<String, FieldWidgets<PlayHouseFields>> fldWidget);

  List<Map<String, FieldWidgets<PlayHouseFields>>> fetchData();
}

class ScrapbookDetailsScreen extends StatefulWidget {
  const ScrapbookDetailsScreen(this.record, {Key key}) : super(key: key);
  final Map<String, FieldWidgets<PlayHouseFields>> record;
  @override
  State createState() => _ScrapbookDetailsScreenState();
}

class _ScrapbookDetailsScreenState extends State<ScrapbookDetailsScreen> {
  //

  @override
  void initState() {
    super.initState();
    record = widget.record;
  }

  VoidCallback onTap;
  Map<String, FieldWidgets<PlayHouseFields>> record;

  @override
  Widget build(BuildContext context) {
    onTap = () {
      _edit(record, context);
    };
    return Scaffold(
      appBar: AppBar(title: record['name'].text, actions: [
        TextButton(
          onPressed: () {
            showBox(text: 'Delete this record?', context: context)
                .then((bool delete) {
              if (delete) {
                // record.delete(record.record).then((_) {
                //   Navigator.of(context).pop();
                // });
              }
            });
          },
          child: const Icon(Icons.delete, color: Colors.white),
        ),
      ]),
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            record['name'].onListTile(tap: onTap),
            record['short_description'].onListTile(tap: onTap),
            record['long_description'].onListTile(tap: onTap),
            record['time_stamp'].onListTile(
                tap: onTap, title: Text(record['time_stamp'].value.toString())),
          ]),
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

  Future<void> _edit(Map<String, FieldWidgets<PlayHouseFields>> record,
      BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            ScrapbookEditScreen(map: record, title: 'Edit a contact')));
    setState(() {});
  }
}

class ScrapbookEditScreen extends StatefulWidget {
  const ScrapbookEditScreen({
    this.map,
    this.title,
    Key key,
  }) : super(key: key);
  final Map<String, FieldWidgets<PlayHouseFields>> map;
  final String title;
  @override
  State createState() => _ScrapbookEditScreenState();
}

class _ScrapbookEditScreenState extends StateMVC<ScrapbookEditScreen> {
  _ScrapbookEditScreenState([ControllerMVC controller]) : super(controller);

  @override
  void initState() {
    super.initState();
    fieldsMap = widget.map;
    fieldsObj = fieldsMap.values.first.object;
  }

  PlayHouseFields fieldsObj;

  Map<String, FieldWidgets<PlayHouseFields>> fieldsMap;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? 'Add an Organization'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final pop = await fieldsObj.save(fieldsMap);
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
              children: [
                fieldsMap['name'].textFormField,
                fieldsMap['short_description'].textFormField,
                fieldsMap['long_description'].textFormField,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String notEmpty(String v) => v.isEmpty ? 'Cannot be empty' : null;
