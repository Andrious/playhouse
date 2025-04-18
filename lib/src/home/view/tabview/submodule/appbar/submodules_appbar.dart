// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
// For base64.decode()
/// The Event Handler code
import 'package:playhouse/src/controller.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:path/path.dart' as p;

/// Tabs for the Submodules
///
class SubmodulesTabBar {
  ///
  SubmodulesTabBar(this.provider) {
    // Supply the Controller.
    _con = provider.con;
  }

  ///
  final SubmodulesState provider;
  late ScrapBookController _con;

  // SubTabController get controller => _tabController;
  /// SubTabController _tabController;
  TabController get subTabController => _subTabController;
  late TabController _subTabController;

  ///
  late PageCircleIndicator tabIndicator;

  ///
  List<PicTab> get picTabs => _picTabs;
  late List<PicTab> _picTabs;

  /// The Task Cards
  List<Widget>? get children {
    if (_children == null) {
      _children = <Widget>[];
      for (final tab in _picTabs) {
        _children!.add(ScrapbookTasksScreen(tab: tab));
      }
    }
    return _children;
  }

  List<Widget>? _children;

  ///
  void initState() {
    //
    /// Get the 'initial' index. Display the last viewed tab.
    var initIndex = Prefs.getInt('${_con.moduleType}SubmodulesIndex');

    /// Return a list of 'Picture tabs'
    _picTabs = _subModules();

    if (initIndex < 0 || initIndex > _picTabs.length - 1) {
      initIndex = 0;
    }

    _subTabController = TabController(
      length: _picTabs.length,
      vsync: provider,
    );

    /// Listener
    _subTabController.addListener(() {
      //
      if (!_subTabController.indexIsChanging) {
        //
        Prefs.setInt(
            '${_con.moduleType}SubmodulesIndex', _subTabController.index);

        tabIndicator.value = _subTabController.index + 1;

        _con.completer.setCompletion(_subTabController);

        const SubmodulesScreen().setStateOf(() {});
      }
    });

    tabIndicator = PageCircleIndicator(itemCount: _picTabs.length);

    tabIndicator.value = initIndex + 1;
  }

  /// Clean up after itself.
  void dispose() {
    _subTabController.dispose();
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

///
class PicTab extends StatelessWidget {
  ///
  const PicTab({
    Key? key,
    required this.submodule,
    required this.name,
    required this.state,
  }) : super(key: key);

  ///
  final String name;

  ///
  final dynamic submodule;

  ///
  final SubmodulesState state;

  @override
  Widget build(BuildContext context) {
    Widget image;
    String file;

    file = submodule['key_art_file'];

    if (file == null) {
      //
      file = 'assets/images/submodules/river_bend02.jpg';
    } else {
      //
      file = 'assets/images/submodules/$file';
    }

    // final extension = p.extension(file);
    //
    // if (extension == '.svg') {
    //   image = SvgPicture.asset(file, fit: BoxFit.cover);
    // } else {
    image = Image.asset(file, fit: BoxFit.cover);
    // }

    image = ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: image,
    );

    // image = Container(
    //   width: 960,
    //   height: 540,
    //   foregroundDecoration: BoxDecoration(
    //     image: DecorationImage(image: ExactAssetImage(file), fit: BoxFit.fill),
    //   ),
    // );

    if (submodule['first_locked'] == 1) {
      //
      image = Opacity(
        opacity: 0.5,
        child: image,
      );
    }
    return Center(
      child: image,
    );
  }
}

// /// The Image has to be wrapped in a Stateful or Stateless widget
// /// for the Positioned widget to work properly.
// class StackImage extends StatelessWidget {
//   const StackImage({
//     Key key,
//     @required this.file,
//   }) : super(key: key);
//
//   final String file;
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child;
//
//     ///todo To be removed.
//     if (file == null) {
//       //
//       child = Image.asset('assets/images/submodules/river_bend02.jpg', fit: BoxFit.cover);
//     } else {
//       //
//       child = Image.asset('assets/images/submodules/$file', fit: BoxFit.cover);
//     }
//
//     return Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(30),
//         child: Container(
//           child: child,
//         ),
//       ),
//     );
//   }
//
//   // ///todo: Not used anymore?
//   // void imageSize() {
//   //   final file = File(name);
//   //   final imageSize = ImageSizeGetter.getSize(FileInput(file));
//   //   // size.add(imageSize.width);
//   //   // size.add(imageSize.height);
//   // }
// }
