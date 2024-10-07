// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAkkHBCTEXrFVxuohrbxq4O2sbO8L93mF0',
    appId: '1:421562016749:web:a763d0f0be8c07a5f5fde4',
    messagingSenderId: '421562016749',
    projectId: 'e-commerce-92590',
    authDomain: 'e-commerce-92590.firebaseapp.com',
    storageBucket: 'e-commerce-92590.appspot.com',
    measurementId: 'G-RK1DSKDQHZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBS2VbhUHwgnIZA91RqoBQaPLBBNjGYbGw',
    appId: '1:421562016749:android:bc7246d0cae9a4c1f5fde4',
    messagingSenderId: '421562016749',
    projectId: 'e-commerce-92590',
    storageBucket: 'e-commerce-92590.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaAFv5B--FBkdRhVHv60SoZS5Csfn764k',
    appId: '1:421562016749:ios:e76425c81c29c326f5fde4',
    messagingSenderId: '421562016749',
    projectId: 'e-commerce-92590',
    storageBucket: 'e-commerce-92590.appspot.com',
    androidClientId: '421562016749-2p9v6778uohqt8vjbd46j7i6rsj2h505.apps.googleusercontent.com',
    iosClientId: '421562016749-cj03r3aha9h0itmbi743qe0o1qdn6no7.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaAFv5B--FBkdRhVHv60SoZS5Csfn764k',
    appId: '1:421562016749:ios:e76425c81c29c326f5fde4',
    messagingSenderId: '421562016749',
    projectId: 'e-commerce-92590',
    storageBucket: 'e-commerce-92590.appspot.com',
    androidClientId: '421562016749-2p9v6778uohqt8vjbd46j7i6rsj2h505.apps.googleusercontent.com',
    iosClientId: '421562016749-cj03r3aha9h0itmbi743qe0o1qdn6no7.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAkkHBCTEXrFVxuohrbxq4O2sbO8L93mF0',
    appId: '1:421562016749:web:cf5e5f0b7a13291bf5fde4',
    messagingSenderId: '421562016749',
    projectId: 'e-commerce-92590',
    authDomain: 'e-commerce-92590.firebaseapp.com',
    storageBucket: 'e-commerce-92590.appspot.com',
    measurementId: 'G-JGC1P52K97',
  );

}