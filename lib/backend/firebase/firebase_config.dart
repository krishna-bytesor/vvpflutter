import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCFzi-PZEJMQGqPCjSU6PWaAl63kOgCaQ4",
            authDomain: "vvp-swami-a787a.firebaseapp.com",
            projectId: "vvp-swami-a787a",
            storageBucket: "vvp-swami-a787a.firebasestorage.app",
            messagingSenderId: "687598630474",
            appId: "1:687598630474:web:86738041c7cb04a25818b3",
            measurementId: "G-2P88CLNJG6"));
  } else {
    await Firebase.initializeApp();
  }
}
