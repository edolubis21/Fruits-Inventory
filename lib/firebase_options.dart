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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCwRxfvuY2mnFoyhqwisz3tTYXSvNis_DA',
    appId: '1:821571027034:web:0c84352b8fd885bf571863',
    messagingSenderId: '821571027034',
    projectId: 'fruits-inventory-flutter',
    authDomain: 'fruits-inventory-flutter.firebaseapp.com',
    storageBucket: 'fruits-inventory-flutter.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC67uB3J4kfiojf8Sd-2uLhk1bTxDcbvqo',
    appId: '1:821571027034:android:0c42dbab24f5010d571863',
    messagingSenderId: '821571027034',
    projectId: 'fruits-inventory-flutter',
    storageBucket: 'fruits-inventory-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaE_eW38qD-rbSv8JCThv8Y5UmGXJB4QA',
    appId: '1:821571027034:ios:a23592c79f62416c571863',
    messagingSenderId: '821571027034',
    projectId: 'fruits-inventory-flutter',
    storageBucket: 'fruits-inventory-flutter.appspot.com',
    iosClientId: '821571027034-qnhmmt0vg3lgr3rnaf9hoonhusdhsq7i.apps.googleusercontent.com',
    iosBundleId: 'com.edolubis.fruitsinventory.fruitsInventory',
  );
}