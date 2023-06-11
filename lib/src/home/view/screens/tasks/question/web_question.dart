// // Copyright 2021 Grey & Ivy Inc. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// /// The database code
// import 'package:playhouse/src/model.dart';
//
// /// The UI code
// import 'package:playhouse/src/view.dart';
//
// /// The Event handling code
// import 'package:playhouse/src/controller.dart';
//
// /// State of the Task:  Favorite, Incomplete, etc.
// class WebQuestionScreen extends StatefulWidget {
//   const WebQuestionScreen(this.parent, {Key? key}) : super(key: key);
//   final PanelScreenState parent;
//   @override
//   State createState() => _WebQuestionScreenState();
// }
//
// class _WebQuestionScreenState extends StateMVC<WebQuestionScreen>
//     with StateSet {
//   _WebQuestionScreenState() : super(ScrapBookController()) {
//     con = controller as ScrapBookController;
//   }
//   late ScrapBookController con;
//   late PanelScreenState parent;
//
//   @override
//   void initState() {
//     super.initState();
//     parent = widget.parent;
//   }
//
//   @override
//   Widget build(BuildContext context) => TextField(
//         controller: TextEditingController(),
//         keyboardType: TextInputType.url,
//         cursorColor: Colors.black,
//         onSubmitted: (value) async {
//           var url = Uri.parse(value);
//           if (url.scheme.isEmpty) {
//             url = Uri.parse('https://www.google.com/search?q=$value');
//           }
//           final inBrowser = InAppWebViewExampleScreen(image: con.card!.image);
//           inBrowser.initialUrl = url;
//           await con.openFullScreenRoute(inBrowser);
//         },
//         decoration: InputDecoration(
//           suffixIcon: const Icon(Icons.search),
//           isCollapsed: true,
//           focusedBorder:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//           enabledBorder:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: Colors.red,
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//       );
//
//   bool completed() {
//     //
//     final userTask = con.model.usersTasks.savedRec;
//
//     final userId = userTask['user_id'];
//
//     final taskId = userTask['task_id'];
//
//     final userTasks = con.model.usersTasks.items
//         .where((rec) => rec['user_id'] == userId && rec['task_id'] == taskId)
//         .toList();
//
//     final completed = userTasks.length == 3;
//
//     if (completed) {
//       //
//       final recList = con.model.tasksUnlocked.items
//           .where((rec) => rec['user_id'] == userId && rec['task_id'] == taskId)
//           .toList();
//
//       Map<String, dynamic> rec;
//
//       if (recList.isEmpty) {
//         rec = {'user_id': userId, 'task_id': taskId};
//       } else {
//         //
//         rec = recList[0];
//       }
//       // Don't bother if already 'completed'
//       if (rec['completed'] == null || rec['completed'] == 0) {
//         //
//         if (rec['user_id'] == null) {
//           //
//           rec['user_id'] = userId;
//
//           rec['task_id'] = taskId;
//         }
//         rec['completed'] = 1; // true
//
//         con.model.tasksUnlocked.save(rec);
//       }
//     }
//     return completed;
//   }
// }
