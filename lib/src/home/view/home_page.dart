// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/view.dart';

List<Widget> panelList;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  List<Image> images;
  int index = 0;
  int direction = 0;
  num lastProgress = 0;

  @override
  void initState() {
    super.initState();

    images = [];
    for (int i = 1; i <= 356; i++) {
      images.add(Image.asset(
        'assets/greyivy$i.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        gaplessPlayback: true,
      ));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!kIsWeb) {
      for (final image in images) {
        precacheImage(image.image, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    buildPanelList(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
              child: Text(
                'Grey & Ivy Playhouse',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ProductSans'),
              )),
        ),
        body: ScrollyWidget(
          showDebugConsole: !kIsWeb,
          initialOverlayWidget: Center(
            child: images[0], //Opacity(opacity: 1, child: images[0]),
          ),
          guidelinePosition: GuidelinePosition.center,
          panels: panelList,
          panelProgressCallback: (activePanelIndex, progress, func) {
            Widget widget;

            if (progress > lastProgress) {
              direction = 1;
            } else if (progress < lastProgress) {
              direction = -1;
            }
            lastProgress = progress;
            index = index + direction;

            if (index < 0) {
              index = 0;
            }

            if (index >= images.length) {
              index = images.length;
            }

            widget = Center(
                child: images[
                index]); //Opacity(opacity: 1, child: Center(child: images[index]));

            func(widget);
          },
        ));
  }
}

void buildPanelList(BuildContext context) {
  panelList = [];

  //Adding a fake panel as explained in the usage tips
  panelList.add(Container(
    height: MediaQuery.of(context).size.height * 0.42,
  ));
  panelList.add(const MuskWidget(text: 'Elon Musk'));
  panelList.add(const MuskWidget(
      text:
      'In 1995, Mr. Musk launched his first million-dollar company with his brother'));
  panelList.add(const MuskWidget(
      text:
      'In 1999, Musk Zip2 to compaq and start X.com which later became paypal'));
  panelList.add(const MuskWidget(
      text: r'In 2002, He poured $100 million into founding SpaceX'));
  panelList.add(const MuskWidget(
      text:
      'In Dec 2016, He was ranked 21st on Forbes Most Influential People List'));
}

class MuskWidget extends StatelessWidget {
  const MuskWidget({Key key, this.text}) : super(key: key);
  final String text;
  TextStyle get style => const TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      fontFamily: 'ProductSans');

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height * 0.8;
    return Center(
        child: Container(
            height: _screenHeight * .8,
            child: Text(
              text,
              style: style,
              textAlign: TextAlign.center,
            )));
  }
}
