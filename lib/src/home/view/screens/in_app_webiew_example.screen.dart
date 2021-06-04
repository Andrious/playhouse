import 'dart:collection' show UnmodifiableListView;
import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:typed_data' show Uint8List;

import 'package:playhouse/src/view.dart';
import 'package:playhouse/src/controller.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class InAppWebViewExampleScreen extends StatefulWidget {
  const InAppWebViewExampleScreen({this.image, Key key}) : super(key: key);
  final PickImage image;
  @override
  _InAppWebViewExampleScreenState createState() =>
      _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
//      useHybridComposition: true,
      useHybridComposition: false,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  PullToRefreshController pullToRefreshController;
  ContextMenu contextMenu;

  final Uri initialUrl = Uri.parse('https://github.com/flutter');

  String url = '';

  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    //
    super.initState();

    contextMenu = ContextMenu(
      menuItems: [
        ContextMenuItem(
          androidId: 1,
          iosId: '1',
          title: 'Special',
          action: () async {
            // ignore: avoid_print
            print('Menu item Special clicked!');
            // ignore: avoid_print
            print(await webViewController?.getSelectedText());
            await webViewController?.clearFocus();
          },
        )
      ],
      options: ContextMenuOptions(
        hideDefaultSystemContextMenuItems: false,
      ),
      onCreateContextMenu: (hitTestResult) async {
        // ignore: avoid_print
        print('onCreateContextMenu');
        // ignore: avoid_print
        print(hitTestResult.extra);
        // ignore: avoid_print
        print(await webViewController?.getSelectedText());
      },
      onHideContextMenu: () {
        // ignore: avoid_print
        print('onHideContextMenu');
      },
      onContextMenuActionItemClicked: (contextMenuItemClicked) async {
        final id = (Platform.isAndroid)
            ? contextMenuItemClicked.androidId
            : contextMenuItemClicked.iosId;
        // ignore: avoid_print
        print(
            'onContextMenuActionItemClicked: $id ${contextMenuItemClicked.title}');
      },
    );

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      // Depending on the platform, 'refresh' the browser.
      onRefresh: _refresh,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Internl Browser Example')),
        body: SafeArea(
          child: Column(children: <Widget>[
            Theme(
              data: ThemeData(
                primaryColor: Colors.blue,
              ),
              child: TextField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Icons.search)),
                controller: urlController,
                keyboardType: TextInputType.url,
                onSubmitted: (value) {
                  var url = Uri.parse(value);
                  if (url.scheme.isEmpty) {
                    url = Uri.parse('https://www.google.com/search?q=$value');
                  }
                  webViewController?.loadUrl(urlRequest: URLRequest(url: url));
                },
              ),
            ),
            const Text(
              'For a Google search, replace the url above with text.',
            ),
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    contextMenu: contextMenu,
                    initialUrlRequest: URLRequest(url: initialUrl),
                    // initialFile: "assets/index.html",
                    initialUserScripts: UnmodifiableListView<UserScript>([]),
                    initialOptions: options,
//                    pullToRefreshController: pullToRefreshController,
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                    },
                    onLoadStart: (controller, url) {
                      _setUrl(url);
                    },
                    androidOnPermissionRequest:
                        (controller, origin, resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      //
                      final uri = navigationAction.request.url;

                      if (![
                        'http',
                        'https',
                        'file',
                        'chrome',
                        'data',
                        'javascript',
                        'about'
                      ].contains(uri.scheme)) {
                        if (await canLaunch(url)) {
                          // Launch the App
                          await launch(
                            url,
                          );
                          // and cancel the request
                          return NavigationActionPolicy.CANCEL;
                        }
                      }
                      return NavigationActionPolicy.ALLOW;
                    },
                    onLoadStop: (controller, url) async {
                      await pullToRefreshController.endRefreshing();
                      _setUrl(url);
                    },
                    onLoadError: (controller, url, code, message) {
                      pullToRefreshController.endRefreshing();
                    },
                    // onProgressChanged: (controller, progress) {
                    //   if (progress == 100) {
                    //     pullToRefreshController.endRefreshing();
                    //   }
                    //   setState(() {
                    //     this.progress = progress / 100;
                    //     urlController.text = url;
                    //   });
                    // },
                    // onUpdateVisitedHistory: (controller, url, androidIsReload) {
                    //   _setUrl(url);
                    // },
                    onConsoleMessage: (controller, consoleMessage) {
                      // ignore: avoid_print
                      print(consoleMessage);
                    },
                  ),
                  if (progress < 1.0)
                    LinearProgressIndicator(value: progress)
                  else
                    Container(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Tooltip(
                  message: I10n.s('Home'),
                  child: ElevatedButton(
                    onPressed: () {
                      webViewController?.loadUrl(
                          urlRequest: URLRequest(url: initialUrl));
                      _setUrl(initialUrl);
                    },
                    child: const Icon(Icons.home_filled),
                  ),
                ),
                ButtonBar(
                  //                   alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Tooltip(
                      message: I10n.s('Back'),
                      child: ElevatedButton(
                        onPressed: () {
                          webViewController?.goBack();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    Tooltip(
                      message: I10n.s('Forward'),
                      child: ElevatedButton(
                        onPressed: () {
                          webViewController?.goForward();
                        },
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ),
                    Tooltip(
                      message: I10n.s('Refresh'),
                      child: ElevatedButton(
                        onPressed: () {
                          webViewController?.reload();
                        },
                        child: const Icon(Icons.refresh),
                      ),
                    ),
                  ],
                ),
                Tooltip(
                  message: I10n.s('Screenshot'),
                  child: ElevatedButton(
                    // Function listed below
                    onPressed: _screenShot,
                    child: const Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ],
            ),
          ]),
        ),
      );

  /// Depending on the platform, 'refresh' the browser.
  Future<void> _refresh() async {
    if (Platform.isAndroid) {
      await webViewController?.reload();
    } else if (Platform.isIOS) {
      await webViewController?.loadUrl(
          urlRequest: URLRequest(url: await webViewController?.getUrl()));
    }
  }

  void _setUrl(Uri url) {
    if (url != null && !url.hasEmptyPath) {
      setState(() {
        this.url = url.toString();
        urlController.text = this.url;
      });
    }
  }

  Future<void> _screenShot() async {
    //
    final Uint8List screenshot = await webViewController.takeScreenshot();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Image.memory(screenshot),
        );
      },
    );

    return widget.image.saveJpg(screenshot);
  }
}