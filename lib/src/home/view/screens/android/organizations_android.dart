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
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (BuildContext _) => InheritedTheme.captureAll(
                          context, _OrganizationEditAndroid(snapshot.data)),
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
                          child: Text(snapshot.data[index]['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        Flexible(
                          flex: 3,
                          child: Text(snapshot.data[index]['short_description'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ),
                        Flexible(
                          flex: 4,
                          child: Text(snapshot.data[index]['long_description'],
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
                              snapshot.data[index]['deleted'].toString(),
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

  Future<List<Map<String, dynamic>>> fetchData() async =>
      model.organizations.listAll;
}

class _OrganizationEditAndroid extends StatefulWidget {
  const _OrganizationEditAndroid(this.record, {Key key}) : super(key: key);
  final List<Map<String, dynamic>> record;
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
  List<Map<String, dynamic>> record;

  @override
  Widget build(BuildContext context) {
    onTap = () {
      editContact(record, context);
    };
    return Theme(
        data: App.themeData,
        child: Scaffold(
            appBar: AppBar(title: record.displayName.text, actions: [
              TextButton(
                onPressed: () {
                  showBox(text: 'Delete this contact?', context: context)
                      .then((bool delete) {
                    if (delete) {
                      record.delete().then((_) {
                        Navigator.of(context).pop();
                      });
                    }
                  });
                },
                child: const Icon(Icons.delete, color: Colors.white),
              ),
            ]),
            bottomNavigationBar: SimpleBottomAppBar(
              button01: HomeBarButton(onPressed: () {
                Navigator.of(context).pop();
              }),
              button03: EditBarButton(onPressed: onTap),
            ),
            body: CustomScrollView(slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  record.name.onListTile(tap: onTap),
                  record.short.onListItems(onTap: onTap),
                  record.long.onListItems(onTap: onTap),
                  record.timeStamp.onListTile(tap: onTap),
                ]),
              )
            ])));
  }

  Future<void> editContact(Contact contact, BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            AddContact(contact: contact, title: 'Edit a contact')));
    setState(() {});
  }


}

// class _OrganizationEditAndroid extends StatelessWidget {
//   _OrganizationEditAndroid({Key key})
//       : model = ScrapBookModel().organizations,
//         super(key: key);
//
//   final OrganizationsTable model;
//
//   @override
//   Widget build(BuildContext context) {
// //    _scaffoldButtons();
//     return Scaffold(
//       appBar: AppBar(
//         title: Settings.getLeftHanded() ? _leading : model.data.title,,
//         actions: _trailing == null ? null : [_trailing!],
//       ),
//       body: Form(
//         onWillPop: _onWillPop,
//         child: model.linkForm(ListView(
//           padding: const EdgeInsets.all(16),
//           children: _listWidgets(),
//         )),
//       ),
//     );
//   }
//
//   Future<bool> _onWillPop() async {
//     if (!model.hasChanged) {
//       return true;
//     }
//
//     final TextStyle dialogTextStyle = theme!.textTheme.subtitle1!
//         .copyWith(color: theme!.textTheme.caption!.color);
//
//     return await showDialog<bool>(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content:
//                   Text(I10n.s('Discard new event?'), style: dialogTextStyle),
//               actions: _listButtons(),
//             );
//           },
//         ) ??
//         false;
//   }

//   List<Widget> _listWidgets() {
//     final widgets = <Widget>[
//       Container(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         alignment: Alignment.bottomLeft,
//         child: model.field['name'].textFormField(
//           controller: model.controller,
//           decoration: const InputDecoration(
//             filled: true,
//           ),
//           validator: (v) {
//             if (v!.isEmpty) {
//               return I10n.s('Cannot be empty.');
//             }
//             return null;
//           },
//           onSaved: (value) {
//             _con.data.item = value!;
//           },
//         ),
//       ),
//     ];
//     return widgets;
//   }
// }

// class ToDoEdit extends DataFields<Map<String, dynamic>> {
//   ToDoEdit(this.con) {
//     _model = m.Model();
//   }
// }
