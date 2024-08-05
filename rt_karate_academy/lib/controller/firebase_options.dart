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
    apiKey: "AIzaSyDKwwNDMOazOFFyAja_Ya5-ibE1FuLdiZs",
    appId: "1:135625632864:web:c60650601aa0955d9ce705",
    messagingSenderId: "135625632864",
    projectId: "karate-academy-9ae4b",
    authDomain: "karate-academy-9ae4b.firebaseapp.com",
    storageBucket: "karate-academy-9ae4b.appspot.com",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBClFmf3njMmSgLbfjhCxxumm3Kb4bP7-A",
    appId: "1:135625632864:android:470125729b9b752e9ce705",
    messagingSenderId: "135625632864",
    projectId: "karate-academy-9ae4b",
    storageBucket: "karate-academy-9ae4b.appspot.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyBClFmf3njMmSgLbfjhCxxumm3Kb4bP7-A",
    appId: "1:135625632864:ios:4b4f2f6a83f5afe59ce705",
    messagingSenderId: "135625632864",
    projectId: "karate-academy-9ae4b",
    storageBucket: "karate-academy-9ae4b.appspot.com",
    iosBundleId: "com.example.rtKarateAcademy",
  );
}