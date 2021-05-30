import 'package:flutter/material.dart';

import 'package:playhouse/src/view.dart';

import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class SimpleUnityScreen extends StatefulWidget {
  const SimpleUnityScreen({Key key}) : super(key: key);

  @override
  State createState() => _SimpleUnityScreen();
}

class _SimpleUnityScreen extends StateMVC<SimpleUnityScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  UnityWidgetController _unityWidgetController;
  double _sliderValue = 0;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _unityWidgetController.resume();
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        _unityWidgetController.pause();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _unityWidgetController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Simple Screen'),
      ),
      body: Card(
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            UnityWidget(
              // Callback that connects the created controller to the unity controller
              onUnityCreated: (controller) {
                _unityWidgetController = controller;
              },
              onUnityMessage: (message) {
                // ignore: avoid_print
                print('Received message from unity: ${message.toString()}');
              },
              onUnitySceneLoaded: (SceneLoaded scene) {
                // ignore: avoid_print
                print('Received scene loaded from unity: ${scene.name}');
                // ignore: avoid_print
                print(
                    'Received scene loaded from unity buildIndex: ${scene.buildIndex}');
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Card(
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text('Rotation speed:'),
                    ),
                    Slider(
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                        _unityWidgetController.postMessage(
                          'Cube',
                          'SetRotationSpeed',
                          value.toString(),
                        );
                      },
                      value: _sliderValue,
                      max: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
