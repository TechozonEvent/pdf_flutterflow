import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBVVMzZzVX2siZ_6gOzT0QoBN-9RE6QJrY",
            authDomain: "pdf-maker-d6b7a.firebaseapp.com",
            projectId: "pdf-maker-d6b7a",
            storageBucket: "pdf-maker-d6b7a.appspot.com",
            messagingSenderId: "393147038534",
            appId: "1:393147038534:web:ebf17c407480ff2f7ac347",
            measurementId: "G-SM6MJBRTJZ"));
  } else {
    await Firebase.initializeApp();
  }
}
