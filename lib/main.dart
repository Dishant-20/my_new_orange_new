// ignore_for_file: unused_element

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_new_orange/classes/splash/splash.dart';

import 'firebase_options.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final token = await _firebaseMessaging.getToken();

  // if (kDebugMode) {
  // print(token);
  // }

  FirebaseMessaging.onMessage.listen(
    (event) {
      print("event ${event.notification!.body}");
    },
  );

// lets change ,a,a,a

  runApp(
    const MaterialApp(
// remove debug banner from top right corner
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: HomeScreenScreen(),
    ),
  );
}
