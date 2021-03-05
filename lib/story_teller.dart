import 'package:flutter/material.dart';
import 'package:scrollytell/scrollytell.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life In Images',
      home: HomePage(),
    );
  }
}

List<Widget> panelList;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Image> images;
  int index = 0;
  int direction = 1;
  int lastPanel = 1;

  @override
  void initState() {
    super.initState();

    images = [];
    for (int i = 1; i <= 100; i++) {
      images.add(Image.asset(
        'assets/greyivy$i.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ));
    }
    // images.add(Image.asset(
    //   'assets/greyivy1.jpg',
    //   fit: BoxFit.cover,
    //   height: double.infinity,
    //   width: double.infinity,
    // ));
    // images.add(Image.asset(
    //   'assets/greyivy2.jpg',
    //   fit: BoxFit.cover,
    //   height: double.infinity,
    //   width: double.infinity,
    // ));
    // images.add(Image.asset(
    //   'assets/greyivy3.jpg',
    //   fit: BoxFit.cover,
    //   height: double.infinity,
    //   width: double.infinity,
    // ));
    // images.add(Image.asset(
    //   'assets/greyivy4.jpg',
    //   fit: BoxFit.cover,
    //   height: double.infinity,
    //   width: double.infinity,
    // ));
    // images.add(Image.asset(
    //   'assets/greyivy5.jpg',
    //   fit: BoxFit.cover,
    //   height: double.infinity,
    //   width: double.infinity,
    // ));
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   for (final image in images) {
  //     precacheImage(image.image, context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    buildPanelList(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(
              child: Text(
            'Life in images',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSans'),
          )),
        ),
        body: ScrollyWidget(
          showDebugConsole: true,
          initialOverlayWidget: Center(
            child: images[0], //Opacity(opacity: 1, child: images[0]),
          ),
          guidelinePosition: GuidelinePosition.center,
          panels: panelList,
          panelStartCallback: (activePanelIndex, func) {
            // Opacity overlaywidget;
            //
            // switch (activePanelIndex) {
            //   case 2:
            //     overlaywidget =
            //         Opacity(opacity: 0.5, child: Center(child: images[0]));
            //     break;
            //   case 3:
            //     overlaywidget =
            //         Opacity(opacity: 0.5, child: Center(child: images[1]));
            //     break;
            //   case 4:
            //     overlaywidget =
            //         Opacity(opacity: 0.5, child: Center(child: images[2]));
            //     break;
            //   case 5:
            //     overlaywidget =
            //         Opacity(opacity: 0.5, child: Center(child: images[3]));
            //     break;
            //   case 6:
            //     overlaywidget =
            //         Opacity(opacity: 0.5, child: Center(child: images[4]));
            //     break;
            //   default:
            //     overlaywidget =
            //         Opacity(opacity: 0.5, child: Center(child: images[5]));
            //     break;
            // }
            // func(overlaywidget);
          },
          panelEndCallback: (activePanelIndex, func) {
            print('test');
          },
          panelProgressCallback: (activePanelIndex, progress, func) {
            Widget widget;

            if (activePanelIndex > lastPanel) {
              direction = 1;
              index++;
            } else if (activePanelIndex < lastPanel) {
              direction = -1;
              index--;
            } else {
              index = index + direction;
            }

            if (index < 0) {
              index = 0;
            }

            if (index >= images.length) {
              index = images.length;
            }

            widget =  Center(child: images[index]); //Opacity(opacity: 1, child: Center(child: images[index]));

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
