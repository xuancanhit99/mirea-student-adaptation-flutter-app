// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDVJYWJqwqSU9vjaJ2loeVii30UPsLUCqA',
    appId: '1:741215904307:web:4b1c85c8e4361b795d3946',
    messagingSenderId: '741215904307',
    projectId: 'mirea-student-adaptation',
    authDomain: 'mirea-student-adaptation.firebaseapp.com',
    storageBucket: 'mirea-student-adaptation.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5g1vK3QU6YoxWhwv2lFrC73hs4k3y5ac',
    appId: '1:741215904307:android:66d9954c5dae71835d3946',
    messagingSenderId: '741215904307',
    projectId: 'mirea-student-adaptation',
    storageBucket: 'mirea-student-adaptation.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5uVCxYNmpWMGeptLKqx5kiZMBTie6vJ4',
    appId: '1:741215904307:ios:1d6abc93aa7ce2465d3946',
    messagingSenderId: '741215904307',
    projectId: 'mirea-student-adaptation',
    storageBucket: 'mirea-student-adaptation.appspot.com',
    androidClientId: '741215904307-3bq24905f98guqfbqh2i7l3qsj720cru.apps.googleusercontent.com',
    iosClientId: '741215904307-krd3iifni166qbgbdfu7ingpv4nkhthm.apps.googleusercontent.com',
    iosBundleId: 'dev.xuancanhit.msa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5uVCxYNmpWMGeptLKqx5kiZMBTie6vJ4',
    appId: '1:741215904307:ios:1d6abc93aa7ce2465d3946',
    messagingSenderId: '741215904307',
    projectId: 'mirea-student-adaptation',
    storageBucket: 'mirea-student-adaptation.appspot.com',
    androidClientId: '741215904307-3bq24905f98guqfbqh2i7l3qsj720cru.apps.googleusercontent.com',
    iosClientId: '741215904307-krd3iifni166qbgbdfu7ingpv4nkhthm.apps.googleusercontent.com',
    iosBundleId: 'dev.xuancanhit.msa',
  );
}
