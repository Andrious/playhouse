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
    for (var i = 1; i <= 356; i++) {
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

            if (index == currentIndex) {
              return;
            }

            if (progress > lastProgress) {
              direction = 1;
            } else if (progress < lastProgress) {
              direction = -1;
            }
            lastProgress = progress;

            index = currentIndex;

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

  panelList.add(const MuskWidget(text: '''
I went wandering in the woods
Where the tallest trees have grown
When I came upon an old abandoned house
With tall, ivy covered walls of stone.

The windows had long since broken
The shards of glass scattered on the floor
and rust had crusted all the iron 
upon the beautiful, thick, wooden door.

I walked through the garden
With it's flowers long since overgrown 
And when I pulled upon the door
It issued a load and anguished moan.

My feet left trails amid the dust
The walls were yellowed and bare
And in the room not a single thing
Except an old, broken, wooden, chair.
'''));

  panelList.add(const MuskWidget(text: '''
I meandered from the main room
And upon the kitchen stumbled
Next to the old cast iron stove
Part of the wall had crumbled. ​

I made my way up the stairs
That creaked and groaned with every step
In the first room I found nothing
But a small nest where a bird once slept.

Upon the landing I paused
With only one room left to see
And I thought about the other rooms 
And wondered if empty it would be 

My hand grasped the copper knob
It turned and opened with ease
And I stood shocked in the doorway
For what I saw made me freeze.
'''));

  panelList.add(const MuskWidget(text: '''
A little bed sat in the corner
The fabric all rotted away
And on the floor, covered by dust
Lay dolls ready for play.

And upon a tiny table
Sat a cute porcelain tea set
Cups and plates, set for four
One of which was a stuffed toy pet.

I left the room without entering
Not wishing to disturb the scene
For though the sight was very sad
It was also peaceful and serene.

I walked away through the woods
Leaving the abandoned house behind
Trying to think of other things
To drive it from my mind.
'''));

  panelList.add(const MuskWidget(text: '''
But I couldn't help but wonder
Who left the house so bare
Emptied every room but one
As though the child still lived there.

I walked straight, not looking back 
Until the house was blocked by trees
And until those last few moments
I felt someone watching me.
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
      fontSize: 14,
//      fontWeight: FontWeight.bold,
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
