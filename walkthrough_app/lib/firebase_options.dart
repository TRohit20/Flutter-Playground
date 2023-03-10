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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC956nZd_8wn8IPfYUsjn-9y64ORtr9tW8',
    appId: '1:865574596931:android:22f9751f05eace650b3ff6',
    messagingSenderId: '865574596931',
    projectId: 'flutter-walkthrough-project',
    storageBucket: 'flutter-walkthrough-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9CzP-pnUiz-dEg0LEsk8Tfqauxhr7ozw',
    appId: '1:865574596931:ios:8746b1e990008d4d0b3ff6',
    messagingSenderId: '865574596931',
    projectId: 'flutter-walkthrough-project',
    storageBucket: 'flutter-walkthrough-project.appspot.com',
    iosClientId: '865574596931-ro5nemlco1aabadqhmd5d0n01q8vj41d.apps.googleusercontent.com',
    iosBundleId: 'com.example.walkthroughApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9CzP-pnUiz-dEg0LEsk8Tfqauxhr7ozw',
    appId: '1:865574596931:ios:8746b1e990008d4d0b3ff6',
    messagingSenderId: '865574596931',
    projectId: 'flutter-walkthrough-project',
    storageBucket: 'flutter-walkthrough-project.appspot.com',
    iosClientId: '865574596931-ro5nemlco1aabadqhmd5d0n01q8vj41d.apps.googleusercontent.com',
    iosBundleId: 'com.example.walkthroughApp',
  );
}
