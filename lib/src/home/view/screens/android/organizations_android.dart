// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

import 'package:playhouse/src/view.dart';

import 'package:playhouse/src/controller.dart';

class OrganizationsAndroid extends State<OrganizationsList> {
  OrganizationsAndroid()
      : model = ScrapBookModel(),
        super();
  final ScrapBookModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organizations List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child:
            FutureBuilder<List<Map<String, FieldWidgets<OrganizationsTable>>>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext _) => InheritedTheme.captureAll(
                          context,
                          _OrganizationEditAndroid(snapshot.data[index])),
                    ));
                    //     .then((_) {
                    //   con.refresh();
                    // });
                  },
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Text(snapshot.data[index]['name'].value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(
                              snapshot.data[index]['short_description'].value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Flexible(
                          flex: 4,
                          child: Text(
                              snapshot.data[index]['long_description'].value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        // Flexible(
                        //   child: Text(snapshot.data[index]['key_art'],
                        //       style: const TextStyle(
                        //           fontWeight: FontWeight.bold, fontSize: 14)),
                        // ),
                        Flexible(
                          child: Text(
                              snapshot.data[index]['time_stamp'].value
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        const Flexible(child: Divider())
                      ]),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null &&
                snapshot.data.isEmpty) {
              return const Text('No Data found');
            }
            return Container(
              alignment: AlignmentDirectional.center,
              child: const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Future<List<Map<String, FieldWidgets<OrganizationsTable>>>>
      fetchData() async => OrganizationsFields().field.values.toList();
}

class _OrganizationEditAndroid extends StatefulWidget {
  const _OrganizationEditAndroid(this.record, {Key key}) : super(key: key);
  final Map<String, FieldWidgets<OrganizationsTable>> record;
  @override
  State createState() => _OrganizationEditAndroidState();
}

class _OrganizationEditAndroidState extends State<_OrganizationEditAndroid> {
  @override
  void initState() {
    super.initState();
    record = widget.record;
  }

  VoidCallback onTap;
  Map<String, FieldWidgets<OrganizationsTable>> record;

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

  Future<void> _edit(Map<String, FieldWidgets<OrganizationsTable>> organization,
      BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            _AddOrganization(organization, title: 'Edit a contact')));
    setState(() {});
  }
}

class _AddOrganization extends StatefulWidget {
  const _AddOrganization(
    this.map, {
    this.title,
    Key key,
  }) : super(key: key);
  final Map<String, FieldWidgets<OrganizationsTable>> map;
  final String title;
  @override
  State createState() => _AddOrganizationState();
}

class _AddOrganizationState extends StateMVC<_AddOrganization> {
  _AddOrganizationState([ControllerMVC controller])
      : table = OrganizationsFields(),
        super(controller);

  final OrganizationsFields table;

  @override
  void initState() {
    super.initState();
    orgMap = widget.map;
//    organization ??= Organization();
    // ignore: cascade_invocations
//   organization?.initState(this);
  }

  Map<String, FieldWidgets<OrganizationsTable>> orgMap;

  @override
  void dispose() {
//    organization.dispose();
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
                final pop = await table.save(orgMap);
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
//              key: organization.formKey,
              child: ListView(
            children: [
              orgMap['name'].textFormField,
              orgMap['short_description'].textFormField,
              orgMap['long_description'].textFormField,
            ],
          )),
        ),
      ),
    );
  }
}
