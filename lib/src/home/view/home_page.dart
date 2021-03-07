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
  int length = 0;

  @override
  void initState() {
    super.initState();

    images = [];
    for (var i = 1; i <= 356; i++) {
      images.add(Image.asset(
        'assets/greyivy$i.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        gaplessPlayback: true,
      ));
    }
    length = images.length;
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
            'Playhouse',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSans'),
          )),
        ),
        body: ScrollyWidget(
          showDebugConsole: App.inDebugger,
          initialOverlayWidget: Center(
            child: images[70],
          ),
          guidelinePosition: GuidelinePosition.center,
          panels: panelList,
          panelProgressCallback: (activePanelIndex, progress, func) {
            Widget widget;

            final panel = activePanelIndex - 1;

            final currentIndex = (panel > 0 ? panel * 100 : 0) +
                (double.parse(progress.toStringAsFixed(2)) * 100).toInt();

            if (index != currentIndex) {
              //
              if (progress > lastProgress) {
                //
                direction = 1;
              } else if (progress < lastProgress) {
                //
                direction = -1;
              }

              lastProgress = progress;

              index = currentIndex;

              index = index + direction;

              if (index < 0) {
                index = 0;
              }

              if (index >= length) {
                index = length;
              }
            }

            widget = Center(child: images[index]);

            func(widget);
          },
        ));
  }
}

void buildPanelList(BuildContext context) {
  panelList = [];

  panelList.add(const MuskWidget(text: '''
  
  
  
  
  
  
  
  
  
  
Mid pleasures and palaces though we may roam,
Be it ever so humble, there's no place like home;
A charm from the sky seems to hallow us there,
Which, seek through the world, is ne'er met with elsewhere.
Home, home, sweet, sweet home!
There's no place like home, oh, there's no place like home!
'''));

  panelList.add(const MuskWidget(text: '''

An exile from home, splendor dazzles in vain;
Oh, give me my lowly thatched cottage again!
The birds singing gayly, that come at my call --
Give me them -- and the peace of mind, dearer than all!
Home, home, sweet, sweet home!
There's no place like home, oh, there's no place like home!










I gaze on the moon as I tread the drear wild,
And feel that my mother now thinks of her child,
As she looks on that moon from our own cottage door
Thro' the woodbine, whose fragrance shall cheer me no more.
Home, home, sweet, sweet home!
There's no place like home, oh, there's no place like home!
'''));

  panelList.add(const MuskWidget(text: '''
  
  
  
How sweet 'tis to sit 'neath a fond father's smile,
And the caress of a mother to soothe and beguile!
Let others delight mid new pleasures to roam,
But give me, oh, give me, the pleasures of home.
Home, home, sweet, sweet home!
There's no place like home, oh, there's no place like home!
'''));

  panelList.add(const MuskWidget(text: '''
To thee I'll return, overburdened with care;
The heart's dearest solace will smile on me there;
No more from that cottage again will I roam;
Be it ever so humble, there's no place like home.
Home, home, sweet, sweet, home!
There's no place like home, oh, there's no place like home!

John Howard Payne
'''));
}

// void buildPanelList(BuildContext context) {
//   panelList = [];
//
//   panelList.add(const MuskWidget(text: '''
// There once was a house in the woods
// with coloured birds singing on its porch.
// There was a house on the soil full of stones
// and no one to hear their song.
//
// I found it one autumn afternoon;
// Walking on the leaves graves
// I knocked on the door when song
// vanished and silence remained.
//
// Wooden walls of every room
// brought the sadness to my soul.
// I felt your presence in the air
// though in my mind laid a hole.
//  '''));
//
//   panelList.add(const MuskWidget(text: '''
// Maybe it was in another life;
// was I too late or too soon?
// Only thing that remained true:
// I was alone without you.
//
// I left you a note on the kitchen table
// with few rhymes that you might like
// for if you ever come back here again
// you’ll find you and me alike.
//   '''));
//
//   panelList.add(const MuskWidget(text: '''
// Walking alone from that place
// with no destination in sight
// I remember the house on the soil full of stones
// and moon falling in the night.
//
// In the morning the birds cut out the heart of silence
// singing in the quiet sunbeams all day long
// while on the kitchen table laid my lines saying:
// within my heart you’re my only song.
//           '''));
//
//   panelList.add(const MuskWidget(text: '''
// Walking alone from that place
// with no destination in sight
// I remember the house on the soil full of stones
// and moon falling in the night.
//
// In the morning the birds cut out the heart of silence
// singing in the quiet sunbeams all day long
// while on the kitchen table laid my lines saying:
// within my heart you’re my only song.
//           '''));
// }

class MuskWidget extends StatelessWidget {
  const MuskWidget({Key key, this.text}) : super(key: key);
  final String text;
  TextStyle get style => const TextStyle(
      color: Colors.white,
      fontSize: kIsWeb ? 24 : 13,
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
//              textAlign: TextAlign.center,
            )));
  }
}
