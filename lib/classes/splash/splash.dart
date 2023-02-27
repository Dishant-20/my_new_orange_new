// ignore_for_file: non_constant_identifier_names, unused_field

import 'dart:async';

// import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/get_started_now/get_started_now.dart';
// import 'package:my_new_orange/classes/set_name/online_chat_entry.dart';
import 'package:my_new_orange/classes/splash/home/home.dart';
// import 'package:my_new_orange/header/utils/custom/app_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
// import 'package:my_new_orange/login/login.dart';
// import 'package:my_new_orange/registration/registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //
  RemoteMessage? initialMessage;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  //
  FirebaseAuth firebase_auth = FirebaseAuth.instance;

  late Timer _timer;
  int _start = 2;
  //
  String? notifTitle, notifBody;
  //
  @override
  void initState() {
    super.initState();

    startTimer();
  }

// get notification in foreground
  func_get_full_data_of_notification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('=====> GOT NOTIFICATION IN FOREGROUND <=====');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        setState(() {
          notifTitle = message.notification!.title;
          notifBody = message.notification!.body;
        });
      }
    });
  }

  func_click_on_notification() {
// FirebaseMessaging.configure

    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      if (kDebugMode) {
        print('=====> CLICK NOTIFICATIONs <=====');
        print(remoteMessage.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBarScreen(
        str_app_bar_title: 'Splash',
        str_status: '0',
      ),*/
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(50),
              ),
              color: app_blue_color,
            ),
            height: 100,
            width: 100,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(50),
                ),
                color: app_blue_color,
              ),
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Align(
            // alignment: Alignment.bottomRight,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: Color.fromARGB(255, 236, 234, 234),
              ),
              height: 200,
              width: 200,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.transparent,
              // width: 48.0,
              // height: 48.0,
              child: Image.asset(
                'assets/gif/logo_3.png',
                fit: BoxFit.fitWidth,
              ),

              // height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ),
    );
  }

// CHECK USER ANONYMOUSLY FIREBASE LOGIN
  func_anonymously_firebase_check() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      if (kDebugMode) {
        print("Signed in with temporary account.");
      }

      print(userCredential);
      // print(userCredential.user!.uid);

      // push to home page after sign in
      startTimer();
      //
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          // print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
        // print("Unknown error.");
      }
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });

          FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user == null) {
              if (kDebugMode) {
                print('User is currently signed out!');
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GetStartedNowScreen(),
                ),
              );
            } else {
              if (kDebugMode) {
                print('User is signed in!');
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreenScreen(),
                ),
              );
            }
          });
        } else {
          setState(
            () {
              if (kDebugMode) {
                print(_start);
              }
              _start--;
            },
          );
        }
      },
    );
  }

  func_calculate() {
    // for (int i = 1; i < 100; i++) {
    //   // print(i);

    //   if (i % 3 == 0) {
    //     print('divisible by 3 ===> $i');
    //   }
    //   if (i % 5 == 0) {
    //     print('divisible by 5 ===> $i');
    //   }
    //   if (i % 3 == 0 && i % 5 == 0) {
    //     print('divisible by 3,5 ===> $i');
    //   } else {
    //     print('n.a.');
    //   }
    // }
  }
}
