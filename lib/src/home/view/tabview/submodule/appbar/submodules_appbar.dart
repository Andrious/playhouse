// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
// For base64.decode()
/// The Event Handler code
import 'package:playhouse/src/controller.dart';
import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// Tabs for the Submodules
///
class SubmodulesTabBar {
  //
  SubmodulesTabBar(this.provider) {
    // Supply the Controller.
    _con = provider.con;
  }
  final SubmodulesState provider;
  ScrapBookController _con;

  // SubTabController get controller => _tabController;
  // SubTabController _tabController;
  TabController get controller => _tabController;
  TabController _tabController;

  PageCircleIndicator tabIndicator;

  List<PicTab> get tabs => _tabs;
  List<PicTab> _tabs;

  /// The Task Cards
  List<Widget> get children {
    if (_children == null) {
      _children = <Widget>[];
      for (final tab in _tabs) {
        _children.add(ScrapbookTasksScreen(tab: tab));
      }
    }
    return _children;
  }

  List<Widget> _children;

  void initState() {
    //
    String prefsLabel;

    /// Determine if we're on the Design side or the Build side.
    if (_con.inBuildScreen) {
      prefsLabel = 'Build';
    } else {
      prefsLabel = 'Design';
    }

    /// Get the 'initial' index. Display the last viewed tab.
    var initIndex = Prefs.getInt('${prefsLabel}SubmodulesIndex');

    /// Return a list of 'Picture tabs'
    _tabs = _subModules();

    if (initIndex < 0 || initIndex > _tabs.length - 1) {
      initIndex = 0;
    }
    _tabController = TabController(
      // SubTabController(
//      initialIndex: initIndex,
      length: _tabs.length,
      vsync: provider,
//      state: provider,
    );

    /// Listener
    _tabController.addListener(() {
      //
      Prefs.setInt('${prefsLabel}SubmodulesIndex', _tabController.index);

      tabIndicator.value = _tabController.index + 1;

      _con.completer.setCompletion(_tabController);
    });

    tabIndicator = PageCircleIndicator(itemCount: _tabs.length);

    tabIndicator.value = initIndex + 1;
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  // Called in the initState()
  // Critical
  List<PicTab> _subModules() {
    //
    List<Map<String, dynamic>> subs = [];

    // Retrieve the 'current' submodules being viewed.
    subs = _con.initSubmodules();

    //
    final List<PicTab> pics = [];

    for (final sub in subs) {
      pics.add(PicTab(
        submodule: sub,
        name: sub['name'],
        state: provider,
      ));
    }
    return pics;
  }
}

class PicTab extends StatelessWidget {
  const PicTab({
    Key key,
    @required this.name,
    @required this.submodule,
    @required this.state,
  }) : super(key: key);
  final String name;
  final dynamic submodule;
  final SubmodulesState state;

  @override
  Widget build(BuildContext context) =>
      StackImage(file: submodule['key_art_file']);
}

/// The Image has to be wrapped in a Stateful or Stateless widget
/// for the Positioned widget to work properly.
class StackImage extends StatelessWidget {
  const StackImage({
    Key key,
    @required this.file,
  }) : super(key: key);

  final String file;

  @override
  Widget build(BuildContext context) {
    Widget child;

    ///todo To be removed.
    if (file == null) {
      //
      child = Image.asset('assets/images/river_bend02.jpg', fit: BoxFit.cover);
    } else {
      //
      child = Image.asset('assets/images/$file', fit: BoxFit.cover);
    }

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: child,
      ),
    );
  }

  // ///todo: Not used anymore?
  // void imageSize() {
  //   final file = File(name);
  //   final imageSize = ImageSizeGetter.getSize(FileInput(file));
  //   // size.add(imageSize.width);
  //   // size.add(imageSize.height);
  // }
}
