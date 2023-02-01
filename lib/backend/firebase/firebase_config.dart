import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCPbjR7R3kQMDPdM3Dhs6nd1zsZKHFmhzo",
            authDomain: "mobilechat-fc7f0.firebaseapp.com",
            projectId: "mobilechat-fc7f0",
            storageBucket: "mobilechat-fc7f0.appspot.com",
            messagingSenderId: "495245107415",
            appId: "1:495245107415:web:8e876e17fe1998d0dc9092"));
  } else {
    await Firebase.initializeApp();
  }
}
