// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event handling code
import 'package:playhouse/src/controller.dart';

class ModuleScreen extends StatefulWidget {
  const ModuleScreen({Key key}) : super(key: key);

  @override
  State createState() => _ModuleScreenState();
}

class _ModuleScreenState extends StateMVC<ModuleScreen>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children:const <Widget>[
      ScrapbookSubmodulesScreen(),
    ],
  );
}






