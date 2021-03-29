import 'package:playhouse/src/controller.dart';

class ScrapBookController extends ControllerMVC {
  factory ScrapBookController() => _this ??= ScrapBookController._();

  ScrapBookController._();

  static ScrapBookController _this;

  bool inBuildScreen = false;

  String module = '';

  String submodule = '';

  List<Widget> _taskCards;

  List<Widget> get taskCards {
    return [
      Card(
        child: Image.asset(
          'assets/images/questionMark.jpg',
          //                   height: 80,
        ),
      ),
      Card(
        child: Image.asset(
          'assets/images/abc.jpg',
          //                   height: 80,
        ),
      ),
      Card(
        child: Image.asset(
          'assets/images/AR.jpg',
          //                   height: 80,
        ),
      ),
      Card(
        child: Image.asset(
          'assets/images/pencil.jpg',
          //                   height: 80,
        ),
      ),
      Card(
        child: Image.asset(
          'assets/images/picture.jpg',
//                    height: 80,
        ),
      ),
      Card(
        child: Image.asset(
          'assets/images/movieCamera.jpg',
          //                  height: 80,
        ),
      ),
    ];
  }
}
