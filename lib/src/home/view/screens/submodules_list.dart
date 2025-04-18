// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

///
class SubmodulesList extends StatefulWidget {
  ///
  const SubmodulesList({super.key});

  @override
  State createState() =>
      // ignore: no_logic_in_create_state
      App.useMaterial ? SubmodulesListAndroid() : SubmodulesListiOS();
}
