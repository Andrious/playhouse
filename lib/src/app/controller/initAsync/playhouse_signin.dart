// // Copyright 2021 Grey & Ivy Inc. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
//
// import 'package:firebase_crashlytics/firebase_crashlytics.dart'
//     show FirebaseCrashlytics;
//
// import 'package:playhouse/src/model.dart';
//
// import 'package:playhouse/src/view.dart' show showBox;
//
// import 'package:playhouse/src/controller.dart' show App, Auth, BuildContext;
//
// class SignIn {
//   factory SignIn() => _this ??= SignIn._();
//   SignIn._() {
//     _auth = Auth();
//   }
//   static SignIn _this;
//   Auth _auth;
//
//   bool get loggedIn => _loggedIn;
//   bool _loggedIn;
//
//   Future<bool> signIn() async {
//     _loggedIn = await signInSilently();
//     if (!_loggedIn) {
//       _loggedIn = await signInAnonymously();
//     }
//     if (_auth.isAnonymous) {
// //      Firebase().removeAnonymous();
// //      _auth.listener = _con?.recordDump;
//     }
//     return _loggedIn;
//   }
//
//   // 'disconnect' from Firebase
//   Future<void> signOut() => _auth.signOut().then(logInUser);
//
//   Future<bool> signInAnonymously() => _auth.signInAnonymously();
//
//   Future<bool> signInSilently() => _auth.signInSilently();
//
//   Future<bool> signInWithFacebook() async {
//     //   FireBaseDB().removeAnonymous();
//     await _auth.delete();
//     await signOut();
//     final signIn = _auth.signInWithFacebook();
//     return signIn;
//   }
//   //    List<String> items = App.packageName.split(".");
//
//   Future<bool> signInWithTwitter() async {
//     return true;
//     //
// //    final PackageInfo info = await PackageInfo.fromPlatform();
// //
// //     final List<String> items = info.packageName.split('.');
// //
// //     final String one = await _remoteConfig.getStringed(items[0]);
// //     if (one.isEmpty) {
// //       return false;
// //     }
// //     final String two = await _remoteConfig.getStringed(items[1]);
// //     if (two.isEmpty) {
// //       return false;
// //     }
// //     FireBaseDB().removeAnonymous();
// //     await _auth.delete();
// //     await signOut();
// //
// //     final bool signIn = await _auth
// //         .signInWithTwitter(
// //       key: one,
// //       secret: two,
// //     )
// //         .catchError(getError);
// //
// //     if (!signIn) {
// //       final Exception ex = _auth.getError();
// //       await showBox(text: ex.toString(), context: _con?.state?.context);
// //     }
// //     return signIn;
//   }
//
//   Future<bool> signInEmailPassword(
//     BuildContext context, {
//     String email = '',
//     String password = '',
//   }) async {
//     //
//
//     FirebaseUser().removeAnonymous();
//     await _auth.delete();
//     await signOut();
//
//     final bool signIn = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//
//     if (!signIn) {
//       final Exception ex = _auth.getError();
//       await showBox(text: ex.toString(), context: context);
//     }
//     return signIn;
//   }
//
//   Future<bool> signInWithGoogle() async {
// //    FireBaseDB().removeAnonymous();
//     await _auth.delete();
//     await signOut();
//     final bool signIn = await _auth.signInWithGoogle();
//     if (!signIn) {
//       final Exception ex = _auth.getError();
//       await showBox(text: ex.toString(), context: App.context);
//     }
//     await rebuild();
//     return signIn;
//   }
//
//   Future<bool> delete() => _auth.delete();
//
//   // Stamp the user information to the firebase database.
// //  void userStamp() => FireBaseDB().userStamp();
//
//   Future<void> rebuild() async {
//     _loggedIn = _auth.isLoggedIn();
//     // refresh();
//     // // Pops only if on the stack and not on the first screen.
//     // final BuildContext context = _con?.state?.context;
//     // if (context != null) {
//     //   await Navigator.of(context).maybePop();
//     // }
//   }
//
//   String get uid => _auth.uid;
//
//   String get email => _auth.email;
//
//   String get name => _auth.displayName;
//
//   String get provider => _auth.signInProvider;
//
//   bool get isNewUser => _auth.isNewUser;
//
//   bool get isAnonymous => _auth.isAnonymous;
//
//   String get photo => _auth.photoUrl;
//
//   String get token => _auth.accessToken;
//
//   String get tokenId => _auth.idToken;
//
//   // /// Override if you like to customize error handling.
//   // @override
//   // void onError(FlutterErrorDetails details) {
//   //   super.onError(details);
//   // }
//
//   void logInUser(dynamic user) {
//     //
//     FirebaseUser().userStamp();
//     FirebaseCrashlytics.instance.setUserIdentifier(_auth.displayName);
//   }
//
//   String get message => _auth.message;
//
//   bool get hasError => _auth.hasError;
//
//   bool get inError => _auth.inError;
//
//   /// Get the last error but clear it.
//   Exception getError() => _auth.getError();
//
//   void setError(Object ex) => _auth.setError(ex);
//
//   List<Exception> getEventError() => _auth.getEventError();
// }
