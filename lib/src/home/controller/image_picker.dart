// // Copyright 2021 Grey & Ivy Inc. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
// //
//
//
// import 'package:image_picker/image_picker.dart' as i;
//
//
// class ImagePicker {
//   ImagePicker() {
//     _picker = i.ImagePicker();
//   }
//   i.ImagePicker _picker;
//
//   i.PickedFile get pickedFile => _pickedFile;
//   i.PickedFile _pickedFile;
//
//   /// Return an empty string if nothing picked successfully.
//   String get path => _pickedFile?.path ?? '';
//
//   Object get error => _error;
//   Object _error;
//
//   Exception get exception =>
//       (_error is Exception) ? _error as Exception : Exception();
//
//   Future<String> picker() async {
//     try {
//       // i.ImageSource.gallery | i.ImageSource.camera
//       _pickedFile = await _picker.getImage(source: i.ImageSource.gallery);
//       _error = null;
//     } catch (err) {
//       _pickedFile = null;
//       _error = err;
//     }
//     return path;
//   }
// }
