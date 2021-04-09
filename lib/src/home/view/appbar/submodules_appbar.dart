// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The database code

import 'dart:io';

import 'package:playhouse/src/model.dart';

/// The UI code
import 'package:playhouse/src/view.dart';

/// The Event Handler code
import 'package:playhouse/src/controller.dart';

/// Get the image's size
import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter/file_input.dart'; // For compatibility with flutter web.

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

  TabController _tabController;

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

    _tabController = GITabController(
      initialIndex: initIndex,
      length: 4,
      vsync: provider,
      state: provider,
    );

    _tabController.addListener(() {
      Prefs.setInt('${prefsLabel}SubmodulesIndex', _tabController.index);
      _con.submodule = _label(tabs[_tabController.index]);
    });

    /// Return a list of 'Picture tabs'
    _tabs = _subModules();

    /// Return the text label specified in the Tab object.
    _con.submodule = _label(_tabs[initIndex]);
  }

  /// Clean up after itself.
  void dispose() {
    _tabController.dispose();
  }

  TabController get controller => _tabController;

  List<PicTab> get tabs => _tabs;
  List<PicTab> _tabs;

  List<Widget> get children => [
        ScrapbookTasksScreen(tab: _tabs[0]),
        ScrapbookTasksScreen(tab: _tabs[1]),
        ScrapbookTasksScreen(tab: _tabs[2]),
        ScrapbookTasksScreen(tab: _tabs[3]),
      ];

  List<PicTab> _subModules() {
    //
    if (_con.inBuildScreen) {
      provider.sub03Locked = true;
      provider.sub04Locked = true;
    }

    String subPic03;
    String subPic04;

    if (provider.sub03Locked) {
      subPic03 = 'warehouse_locked';
    } else {
      subPic03 = 'warehouse';
    }

    if (provider.sub04Locked) {
      subPic04 = 'city_night_locked';
    } else {
      subPic04 = 'city_night';
    }

    List<String> subPics = [];

    switch (_con.module) {
      case 'Inspiration':
        subPics = ['river_bend', 'construction_site', subPic03, subPic04];
        break;
      case 'Site assessment':
        subPics = [
          'church_garbagetruck',
          'city_park',
          subPic03,
          'street_intersection'
        ];
        break;
      case 'Floor Plan':
        subPics = [
          'country_trail',
          'country_waterfall',
          'winter_cabin',
          subPic04
        ];
        break;
      case 'Elevation':
        subPics = ['desert_housing', 'riverbrook_pinktree', subPic03, subPic04];
        break;
      default:
        subPics = ['river_bend', 'construction_site', subPic03, subPic04];
    }
    return [
      PicTab(name: subPics[0], state: provider),
      PicTab(name: subPics[1], state: provider),
      PicTab(name: subPics[2], state: provider),
      PicTab(name: subPics[3], state: provider),
    ];
  }

  /// Return the text label specified in the Tab object.
  String _label(PicTab tab) => tab.name.trim();
}

class PicTab extends StatelessWidget {
  const PicTab({Key key, @required this.name, @required this.state})
      : super(key: key);
  final String name;
  final SubmodulesState state;

  @override
  Widget build(BuildContext context) {
    //
    String name;

    if (name == null || name.isEmpty) {
      name = 'river_bend';
    } else {
      name = name.trim();
    }
    final stackImage = StackImage(name: 'assets/images/${name}02.jpg');
    return Stack(
      children: [
        stackImage,
        Positioned(
          bottom: 0,
          child: Container(
            width: 0,
            height: 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white.withOpacity(0.5),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(''),
                ]),
          ),
        ),
      ],
    );
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
  // double get width => size[0].toDouble();
  // double get height => size[1].toDouble();
  // final List<int> size = [];

  @override
  Widget build(BuildContext context) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(name, fit: BoxFit.cover),
        ),
      );

  void imageSize() {
    final file = File(name);
    final imageSize = ImageSizeGetter.getSize(FileInput(file));
    // size.add(imageSize.width);
    // size.add(imageSize.height);
  }
}
