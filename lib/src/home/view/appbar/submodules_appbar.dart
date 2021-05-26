// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code
// For base64.decode()
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

// For rootBundle.loadString();
import 'package:flutter/services.dart';

// import 'package:image_size_getter/file_input.dart'; // For compatibility with flutter web.
// /// Get the image's size
// import 'package:image_size_getter/image_size_getter.dart';
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
    final initIndex = Prefs.getInt('${prefsLabel}SubmodulesIndex');

    // if(initIndex == 4){
    //   initIndex--;
    // }

    /// Return a list of 'Picture tabs'
    _tabs = _subModules();

    _tabController = TabController( // SubTabController(
//      initialIndex: initIndex,
      length: _tabs.length,
      vsync: provider,
//      state: provider,
    );

    /// Listener
    _tabController.addListener(() {
      Prefs.setInt('${prefsLabel}SubmodulesIndex', _tabController.index);
      tabIndicator.value = _tabController.index + 1;
//      if (_con.database) {
        _con.submodule = _con.model.submodules.items[_tabController.index];
//      } else {
        _con.submoduleName = _label(tabs[_tabController.index]);
//      }
    });

    /// Return the text label specified in the Tab object.
    ///todo To be removed.
//    if (_con.database) {
      _con.submodule = _con.model.submodules.items[initIndex];
//    } else {
      _con.submoduleName = _label(_tabs[initIndex]);
//    }

    tabIndicator = PageCircleIndicator(itemCount: _tabs.length);
    tabIndicator.value = initIndex + 1;
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  List<PicTab> get tabs => _tabs;
  List<PicTab> _tabs;

  List<Widget> get children {
    final screens = <Widget>[];
    for (final tab in _tabs) {
      screens.add(ScrapbookTasksScreen(tab: tab));
    }
    return screens;
    [
      ScrapbookTasksScreen(tab: _tabs[0]),
      ScrapbookTasksScreen(tab: _tabs[1]),
      ScrapbookTasksScreen(tab: _tabs[2]),
      ScrapbookTasksScreen(tab: _tabs[3]),
    ];
  }

  List<PicTab> _subModules() {
    //
    if (_con.inBuildScreen) {
      provider.sub03Locked = true;
      provider.sub04Locked = true;
    }

    if (_con.database) {
      List<Map<String, dynamic>> subs = [];

      final id = _con.module['rowid'];
      subs = _con.model.submodules.items
          .where((record) => record['module_id'] == id)
          .toList();

      final List<PicTab> pics = [];

      for (final sub in subs) {
        pics.add(PicTab(submodule: sub, state: provider));
      }
      return pics;
    } else {
      List<String> subPics = [];

      String subPic03;
      String subPic04;

      if (provider.sub03Locked) {
        subPic03 = 'warehouse_locked02';
      } else {
        subPic03 = 'warehouse02';
      }

      if (provider.sub04Locked) {
        subPic04 = 'city_night_locked02';
      } else {
        subPic04 = 'city_night02';
      }

      switch (_con.moduleName) {
        case 'Inspiration':
          subPics = ['river_bend02', 'construction_site02', subPic03, subPic04];
          break;
        case 'Site assessment':
          subPics = [
            'church_garbagetruck02',
            'city_park02',
            subPic03,
            'street_intersection02'
          ];
          break;
        case 'Floor Plan':
          subPics = [
            'country_trail02',
            'country_waterfall02',
            'winter_cabin02',
            subPic04
          ];
          break;
        case 'Elevation':
          subPics = [
            'desert_housing02',
            'riverbrook_pinktree02',
            subPic03,
            subPic04
          ];
          break;
        default:
          subPics = ['river_bend02', 'construction_site02', subPic03, subPic04];
      }
      return [
        PicTab(submodule: subPics[0], state: provider),
        PicTab(submodule: subPics[1], state: provider),
        PicTab(submodule: subPics[2], state: provider),
        PicTab(submodule: subPics[3], state: provider),
      ];
    }
  }

  /// Return the text label specified in the Tab object.
  String _label(PicTab tab) {
   String label;
   if(tab.submodule is String) {
     label = tab.submodule.trim();
   }else{
     label = '';
   }
   return label;
  }
}

class PicTab extends StatelessWidget {
  const PicTab({Key key, @required this.submodule, @required this.state})
      : super(key: key);
  final dynamic submodule;
  final SubmodulesState state;

  @override
  Widget build(BuildContext context) {
    //
    String name;
    ///todo To be removed
    if (submodule is String) {
      name = submodule;
    } else {
      name = submodule['image'];
    }
    return StackImage(name: name);
    // final stackImage = StackImage(name: name);
    // return Stack(
    //   children: [
    //     stackImage,
    //     // Positioned(
    //     //   bottom: 0,
    //     //   child: Container(
    //     //     width: 0,
    //     //     height: 0,
    //     //     decoration: BoxDecoration(
    //     //       borderRadius: BorderRadius.circular(32),
    //     //       color: Colors.white.withOpacity(0.5),
    //     //     ),
    //     //     child: Column(
    //     //         crossAxisAlignment: CrossAxisAlignment.start,
    //     //         children: const [
    //     //           Text(''),
    //     //         ]),
    //     //   ),
    //     // ),
    //   ],
    // );
  }
}

/// The Image has to be wrapped in a Stateful or Stateless widget
/// for the Positioned widget to work properly.
class StackImage extends StatelessWidget {
  StackImage({
    Key key,
    @required this.name,
  }) : super(key: key) {
//    imageSize();
  }

  final String name;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (name == null) {
      child = Image.asset('assets/images/river_bend02.jpg', fit: BoxFit.cover);
    } else if (name.length > 100) {
      child = Image.memory(base64.decode(name));
    } else {
      child = Image.asset('assets/images/$name.jpg', fit: BoxFit.cover);
//      _readImageBytes('assets/images/$name.jpg');
    }
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: child,
      ),
    );
  }

  Future<void> _readImageBytes(String name) async {
    ByteData bytes;
    try {
      bytes = await rootBundle.load(name);
    } catch (ex) {
      bytes = null;
    }
    if (bytes != null) {
      final code = base64.encode(Uint8List.view(bytes.buffer));
      if (code.isEmpty) {
        print(code);
      }
    }
  }

  // ///todo: Not used anymore?
  // void imageSize() {
  //   final file = File(name);
  //   final imageSize = ImageSizeGetter.getSize(FileInput(file));
  //   // size.add(imageSize.width);
  //   // size.add(imageSize.height);
  // }
}
