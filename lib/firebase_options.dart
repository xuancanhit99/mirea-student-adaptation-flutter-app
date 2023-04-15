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
    apiKey: 'AIzaSyAPNkp5KmVGa6BGN9LXV3LX7qh4LEe6Eo0',
    appId: '1:865289058733:web:01e816142c8f7d521a4924',
    messagingSenderId: '865289058733',
    projectId: 'misafu-de5a1',
    authDomain: 'misafu-de5a1.firebaseapp.com',
    storageBucket: 'misafu-de5a1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACVUe4TqPUl6dUmEfxysagEJMf-UZWEIY',
    appId: '1:865289058733:android:081fcd03f48e160e1a4924',
    messagingSenderId: '865289058733',
    projectId: 'misafu-de5a1',
    storageBucket: 'misafu-de5a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaX2itrWb2ZxZJKPd4efB_lyS9ahJl3cA',
    appId: '1:865289058733:ios:00cadd4794d727041a4924',
    messagingSenderId: '865289058733',
    projectId: 'misafu-de5a1',
    storageBucket: 'misafu-de5a1.appspot.com',
    iosClientId: '865289058733-8vi59ch0pqn55jmqm1utgd34m9kecrqt.apps.googleusercontent.com',
    iosBundleId: 'com.example.misafu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaX2itrWb2ZxZJKPd4efB_lyS9ahJl3cA',
    appId: '1:865289058733:ios:00cadd4794d727041a4924',
    messagingSenderId: '865289058733',
    projectId: 'misafu-de5a1',
    storageBucket: 'misafu-de5a1.appspot.com',
    iosClientId: '865289058733-8vi59ch0pqn55jmqm1utgd34m9kecrqt.apps.googleusercontent.com',
    iosBundleId: 'com.example.misafu',
  );
}