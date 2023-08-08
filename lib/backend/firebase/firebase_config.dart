import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDLdKiVap7ZjNunX-38ev_6p_f2IadPCtQ",
            authDomain: "truechat-678cc.firebaseapp.com",
            projectId: "truechat-678cc",
            storageBucket: "truechat-678cc.appspot.com",
            messagingSenderId: "743840129040",
            appId: "1:743840129040:web:8e02ecccddaacee79faa95"));
  } else {
    await Firebase.initializeApp();
  }
}
