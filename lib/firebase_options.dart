import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD7XQw4xQF5Gg_zRBVMrC6xxUpPQDLLc4E', // apiKey
    appId: '1:210883893947:web:8d4fb8f4362b70cad6679e', // appId
    messagingSenderId: '210883893947', // messagingSenderId
    projectId: 'peliculas-3ff71', // projectId
    authDomain: 'peliculas-3ff71.firebaseapp.com', // authDomain
    storageBucket: 'peliculas-3ff71.firebasestorage.app', // storageBucket
    measurementId: 'G-7R2LT6YDJZ', // measurementId (opcional en Firebase JS, pero necesario para Firebase Analytics)
  );
}
