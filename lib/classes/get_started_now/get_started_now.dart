import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/login_via_phone_number/login_via_phone_number.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/login/login.dart';
import 'package:my_new_orange/registration/registration.dart';

class GetStartedNowScreen extends StatefulWidget {
  const GetStartedNowScreen({super.key});

  @override
  State<GetStartedNowScreen> createState() => _GetStartedNowScreenState();
}

class _GetStartedNowScreenState extends State<GetStartedNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
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
          ),
          // const Spacer(),
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              //color: Colors.blueAccent,
              // 80 160 214
              color: app_blue_color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  52,
                ),
                topRight: Radius.circular(
                  52,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 28.0,
                        left: 28.0,
                      ),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      "Anamak provides a way for people to Chat and to express their thoughts, opinions and feelings without the fear of being judged or identified.",
                      style: TextStyle(
                        fontFamily: font_family_name,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const LoginScreen(),
                          //   ),
                          // );
                          //
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginViaPhoneNumberScreen(),
                            ),
                          );
                          //
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontFamily: font_family_name,
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 20,
                          ),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: font_family_name,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
