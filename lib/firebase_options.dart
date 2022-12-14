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
    apiKey: 'AIzaSyBKiVfhBqyt8e7T52Pblh1z8N-KITAS7EM',
    appId: '1:110080492471:web:9e5d5607a574718e291e32',
    messagingSenderId: '110080492471',
    projectId: 'flutter-login-lauro',
    authDomain: 'flutter-login-lauro.firebaseapp.com',
    storageBucket: 'flutter-login-lauro.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgH_NiGCAMFCAcOYMuveAgDPM0KlaV8Uk',
    appId: '1:110080492471:android:3d15f8b502c5d413291e32',
    messagingSenderId: '110080492471',
    projectId: 'flutter-login-lauro',
    storageBucket: 'flutter-login-lauro.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFxALMLfty_UbzgYMHFEictf-Gw96kv8E',
    appId: '1:110080492471:ios:356f0cf5c8fa68af291e32',
    messagingSenderId: '110080492471',
    projectId: 'flutter-login-lauro',
    storageBucket: 'flutter-login-lauro.appspot.com',
    iosClientId: '110080492471-15nlr6o3d3jo7eut1o4mu79pmg1vhvji.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginui',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFxALMLfty_UbzgYMHFEictf-Gw96kv8E',
    appId: '1:110080492471:ios:356f0cf5c8fa68af291e32',
    messagingSenderId: '110080492471',
    projectId: 'flutter-login-lauro',
    storageBucket: 'flutter-login-lauro.appspot.com',
    iosClientId: '110080492471-15nlr6o3d3jo7eut1o4mu79pmg1vhvji.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginui',
  );
}
