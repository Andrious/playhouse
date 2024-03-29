// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

class OrganizationsList extends StatefulWidget {
  const OrganizationsList({Key? key}) : super(key: key);

  @override
  State createState() =>
      // ignore: no_logic_in_create_state
      App.useMaterial ? OrganizationsAndroid() : OrganizationsiOS();
}

class OrganizationsModuleList extends StatefulWidget {
  const OrganizationsModuleList({Key? key}) : super(key: key);

  @override
  State createState() =>
      // ignore: no_logic_in_create_state
      App.useMaterial ? OrganizationsModuleAndroid() : OrganizationsModuleiOS();
}

class OrganizationsSubmoduleList extends StatefulWidget {
  const OrganizationsSubmoduleList({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State createState() => App.useMaterial
      ? OrganizationsSubmoduleAndroid()
      : OrganizationsSubmoduleiOS();
}

class OrganizationsTaskList extends StatefulWidget {
  const OrganizationsTaskList({Key? key}) : super(key: key);

  @override
  State createState() =>
      // ignore: no_logic_in_create_state
      App.useMaterial ? OrganizationsTaskAndroid() : OrganizationsTaskiOS();
}
