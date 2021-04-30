// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:playhouse/src/controller.dart';
import 'package:playhouse/src/view.dart';
import 'package:state_set/state_set.dart';

import 'package:crop/crop.dart';

class TaskCard extends StatefulWidget with StateSetWidget {
  TaskCard({
    Key key,
    this.submodule,
    this.name,
  })  : con = ScrapBookController(),
        image = PickImage(),
        super(key: key);

  final String submodule;
  final String name;

  final ScrapBookController con;
  final PickImage image;

  @override
  void dispose() {
    image._state = null;
    super.dispose();
  }

  /// Override with subclasses.
  void onTap() {}

  /// Override with subclasses.
  void onTapInfo() {}

  @override
  // ignore: no_logic_in_create_state
  State createState() => _TaskCardsState();
}

class _TaskCardsState extends State<TaskCard> {
  Widget child;

  @override
  void initState() {
    super.initState();
    widget.withState(this);
    widget.initState();
    widget.image._state = this;
//    widget.image.getImage(widget);
    child ??= Image.asset('assets/images/${widget.name.trim()}.jpg');
  }

  @override
  void dispose() {
    widget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widget = this.widget;
    if (widget.name.isEmpty) {
      return Container();
    }
    return Card(
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          InkWell(
            onTap: widget.onTapInfo,
            highlightColor: const Color(0xffbb86fc),
            child: FutureBuilder<Widget>(
                future: widget.image.getImage(widget),
                initialData: child,
                builder: (_, snapshot) => _futureBuilder(snapshot)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 25),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: widget.onTap,
                highlightColor: const Color(0xffbb86fc),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _futureBuilder(AsyncSnapshot<Widget> snapshot) {
    if (snapshot.hasError) {
      final dynamic exception = snapshot.error;
      final details = FlutterErrorDetails(
        exception: exception,
        stack: exception is Error ? exception.stackTrace : null,
        library: 'app_statefulwidget',
        context: ErrorDescription('While getting ready in FutureBuilder Async'),
      );
      return App.errorHandler.displayError(details);
    } else if (snapshot.connectionState == ConnectionState.done) {
      return child;
    } else {
      Widget widget;
      if (UniversalPlatform.isAndroid) {
        widget = const Center(child: CircularProgressIndicator());
      } else {
        widget = const Center(child: CupertinoActivityIndicator());
      }
      return widget;
    }
  }
}

class PickImage {
//
  TaskCard card;
  String key;

  _TaskCardsState _state;

  Future<Widget> getImage(TaskCard card) async {
    this.card = card;
    double widthAmount = 1;
    final con = card.con;
    Widget image;
    ui.Image imageInfo;

    key =
        '${con.moduleType}${con.module}${card.submodule}${card.name}${card.runtimeType.toString()}';

    final path = Prefs.getString(key);

    if (path.isNotEmpty) {
      //
 //     image = Image.file(File(path)); //, fit: BoxFit.fitWidth);

//      imageInfo = await _getImageInfo(image);

      _state?.child = Crop(controller: CropController(), child: Image.file(File(path)));

//       _state?.child = LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//         int smaller;
//         bool heightSmaller;
//         if (imageInfo.height <= imageInfo.width) {
//           heightSmaller = true;
//           smaller = imageInfo.height;
//         } else {
//           heightSmaller = false;
//           smaller = imageInfo.width;
//         }
//
// //    double scaleFactor = smaller / size.width;
//
//         double offset;
//         double widthOffset = 0;
//         double heightOffset = 0;
//
//         if (heightSmaller) {
//           widthOffset = (imageInfo.width - constraints.maxWidth) * 0.5;
//           widthOffset = 0;
//         } else {
//           heightOffset = (imageInfo.height - constraints.maxWidth) * 0.5;
//         }
//
//         final widget = ClipRect(
//           clipper: CustomRect(imageInfo),
//           child: Row(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [image]),
//         );
//
//         final con = CropController();
//         con.offset = Offset(widthOffset, heightOffset);
//         return Crop(controller: con, child: image);
//
//         return Transform.translate(
//           offset: Offset(CustomRect.widthOffset, CustomRect.heightOffset),
//           child: widget,
//         );
//
//         return ClipRect(
//           child: Transform.translate(
//               offset: Offset(widthOffset, heightOffset), child: image),
//         );
//
//         // return Transform.translate(
//         //   offset: Offset(widthOffset, heightOffset),
//         //   child: Row(
//         //     crossAxisAlignment: CrossAxisAlignment.stretch,
//         //     children: [Expanded(child: image)],
//         //   ),
//         // );
//       });

      // _state?.child = ClipRect(
      //   clipper: CustomRect(widthAmount, info),
      //   clipBehavior: Clip.antiAlias,
      //   child: image,
      // );

      // _state?.child = ClipRect(
      //   clipper: CustomRect(widthAmount, info),
      //   child: Transform(
      //     transform: Matrix4.translation(Vector3(-widthAmount, 0, 0)),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [Expanded(child: image)],
      //     ),
      //   ),
      // );

      // _state?.child = Row(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Expanded(
      //       child: ClipRect(
      //         child: Transform(
      //           transform: Matrix4.translation(
      //             Vector3(-widthAmount, 0, 0),
      //           ),
      //           child: image,
      //         ),
      //       ),
      //     )
      //   ],
      // );

//       _state?.child = ClipRect(
//         child: Align(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [image],
// //          children: [Container(child: image)],
//           ),
//         ),
//       );
      // ignore: invalid_use_of_protected_member
//      _state?.setState(() {});
    }
    return image;
  }

  Future<void> pickImage() async {
    final image = ImagePicker();
    final path = await image.picker();
    if (path.isNotEmpty) {
      var state = card.stateOf<_TaskCardsState>();
      state ??= _state;
      state?.child = Image.file(File(path), fit: BoxFit.fitHeight);
      // ignore: invalid_use_of_protected_member
      state?.setState(() {});
      await Prefs.setString(key, path);
    }
  }

  Future<ui.Image> _getImageInfo(Image image) async {
    final completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, _) {
          completer.complete(info.image);
        },
      ),
    );
    final ui.Image info = await completer.future;
    return info;
  }
}

class CustomRect extends CustomClipper<Rect> {
  CustomRect(this.imageInfo);
  final ui.Image imageInfo;

  static double widthOffset = 0;
  static double heightOffset = 0;

  @override
  Rect getClip(Size size) {
    int smaller;
    bool heightSmaller;
    if (imageInfo.height <= imageInfo.width) {
      heightSmaller = true;
      smaller = imageInfo.height;
    } else {
      heightSmaller = false;
      smaller = imageInfo.width;
    }

//    double scaleFactor = smaller / size.width;

    double offset;

    if (heightSmaller) {
      widthOffset = (imageInfo.width - size.width) * 0.5;
      widthOffset = 0;
    } else {
      heightOffset = (imageInfo.height - size.height) * 0.5;
    }

    final rect = Rect.fromLTRB(
        widthOffset, heightOffset, size.width - widthOffset, size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomRect oldClipper) {
    return true; //oldClipper.widthAmount != widthAmount;
  }
}
