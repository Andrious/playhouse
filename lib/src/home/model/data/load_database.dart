// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart' show Database;
import 'package:playhouse/src/home/model/data/model.dart';

///
Future<void> loadScrapBookDatabase(Database db) async {
  // The order of these method calls is very important!
  await loadDesignModulesDB(db);
  await loadDesignSubmodulesDB(db);

  await loadDesignMod01Sub01Tasks(db);
  await loadDesignMod01Sub02Tasks(db);
  await loadDesignMod01Sub03Tasks(db);
  await loadDesignMod01Sub04Tasks(db);

  await loadDesignMod02Sub01Tasks(db);
  await loadDesignMod02Sub02Tasks(db);
  await loadDesignMod02Sub03Tasks(db);
  await loadDesignMod02Sub04Tasks(db);

  await loadDesignMod03Sub01Tasks(db);
  await loadDesignMod03Sub02Tasks(db);
  await loadDesignMod03Sub03Tasks(db);
  await loadDesignMod03Sub04Tasks(db);

  await loadDesignMod04Sub01Tasks(db);
  await loadDesignMod04Sub02Tasks(db);
  await loadDesignMod04Sub03Tasks(db);
  await loadDesignMod04Sub04Tasks(db);

  await loadBuildModulesDB(db);
  await loadBuildSubmodulesDB(db);

  await loadBuildMod01Sub01Tasks(db);
  await loadBuildMod01Sub02Tasks(db);
  await loadBuildMod01Sub03Tasks(db);
  await loadBuildMod01Sub04Tasks(db);

  await loadBuildMod02Sub01Tasks(db);
  await loadBuildMod02Sub02Tasks(db);
  await loadBuildMod02Sub03Tasks(db);
  await loadBuildMod02Sub04Tasks(db);

  await loadBuildMod03Sub01Tasks(db);
  await loadBuildMod03Sub02Tasks(db);
  await loadBuildMod03Sub03Tasks(db);
  await loadBuildMod03Sub04Tasks(db);

  await loadBuildMod04Sub01Tasks(db);
  await loadBuildMod04Sub02Tasks(db);
  await loadBuildMod04Sub03Tasks(db);
  await loadBuildMod04Sub04Tasks(db);

  await loadDiscoverModulesDB(db);
  await loadDiscoverSubmodulesDB(db);

  await loadDiscoverMod01Sub01Tasks(db);
  await loadDiscoverMod01Sub02Tasks(db);
  await loadDiscoverMod01Sub03Tasks(db);
  await loadDiscoverMod01Sub04Tasks(db);

  await loadDiscoverMod02Sub01Tasks(db);
  await loadDiscoverMod02Sub02Tasks(db);
  await loadDiscoverMod02Sub03Tasks(db);
  await loadDiscoverMod02Sub04Tasks(db);

  await loadDiscoverMod03Sub01Tasks(db);
  await loadDiscoverMod03Sub02Tasks(db);
  await loadDiscoverMod03Sub03Tasks(db);
  await loadDiscoverMod03Sub04Tasks(db);

  await loadDiscoverMod04Sub01Tasks(db);
  await loadDiscoverMod04Sub02Tasks(db);
  await loadDiscoverMod04Sub03Tasks(db);
  await loadDiscoverMod04Sub04Tasks(db);

  await loadOrganizationsDB(db);
  await loadOrganizationsModulesDB(db);
  await loadOrganizationsSubmodulesDB(db);
  await loadOrganizationsTasksDB(db);
}
