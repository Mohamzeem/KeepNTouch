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
    apiKey: 'AIzaSyAXW1Cmj3iYDGcNUZAJnDoVaY3653xuSjs',
    appId: '1:56436627573:web:c8af2589e1cb678b89c03c',
    messagingSenderId: '56436627573',
    projectId: 'chat-app-df0f1',
    authDomain: 'chat-app-df0f1.firebaseapp.com',
    databaseURL: 'https://chat-app-df0f1-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chat-app-df0f1.appspot.com',
    measurementId: 'G-7N56X95TTM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwmlatXGM9EcsIbqbUGwtqG_sW875XIng',
    appId: '1:56436627573:android:1b3c33144bd9b6c689c03c',
    messagingSenderId: '56436627573',
    projectId: 'chat-app-df0f1',
    databaseURL: 'https://chat-app-df0f1-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chat-app-df0f1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJVuCAbBN12qPnFp22WrmMCBqEgtuihFI',
    appId: '1:56436627573:ios:6ccc5ad8723cbce289c03c',
    messagingSenderId: '56436627573',
    projectId: 'chat-app-df0f1',
    databaseURL: 'https://chat-app-df0f1-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chat-app-df0f1.appspot.com',
    iosBundleId: 'com.example.keepNTouch',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJVuCAbBN12qPnFp22WrmMCBqEgtuihFI',
    appId: '1:56436627573:ios:eff29256de6bce7289c03c',
    messagingSenderId: '56436627573',
    projectId: 'chat-app-df0f1',
    databaseURL: 'https://chat-app-df0f1-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chat-app-df0f1.appspot.com',
    iosBundleId: 'com.example.keepNTouch.RunnerTests',
  );
}
