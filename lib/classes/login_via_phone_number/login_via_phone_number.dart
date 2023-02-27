// ignore_for_file: non_constant_identifier_names

import 'package:devicelocale/devicelocale.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:my_new_orange/header/utils/Utils.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class LoginViaPhoneNumberScreen extends StatefulWidget {
  const LoginViaPhoneNumberScreen({super.key});

  @override
  State<LoginViaPhoneNumberScreen> createState() =>
      _LoginViaPhoneNumberScreenState();
}

class _LoginViaPhoneNumberScreenState extends State<LoginViaPhoneNumberScreen> {
  //
  var str_call_one = '0';
  var save_entered_phone_number = '';
  var str_phone_verification_token_id = '0';
  //
  @override
  void initState() {
    super.initState();
    //
    if (kDebugMode) {
      print(str_call_one);
    }
    initCountry();

    //
  }

  void initCountry() async {
    List? languages = await Devicelocale.preferredLanguages;
    String? locale = await Devicelocale.currentLocale;

    if (kDebugMode) {
      print(languages);
      print(locale);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          'Phone Number',
          style: TextStyle(
            fontFamily: font_family_name,
            fontSize: 16.0,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),*/
      body: Column(
        children: [
          // back button
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 80),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  border: Border.all()),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),

          if (str_call_one == '0') ...[
            // enter phone number
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                // height: 120,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Enter Phone Number',
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        // height: 60,
                        child: IntlPhoneField(
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            if (kDebugMode) {
                              print('ok${phone.completeNumber}');
                            }
                            //
                            save_entered_phone_number = phone.completeNumber;
                            if (kDebugMode) {
                              print(save_entered_phone_number);
                            }
                            //
                          },
                        ),
                      ),
                    ),
                    //
                    Center(
                      child: InkWell(
                        onTap: () {
                          func_verify_phone_number(
                            save_entered_phone_number,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          color: Colors.amber[600],
                          width: 48.0,
                          height: 48.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            // OTP

            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Verify',
                style: TextStyle(
                  fontFamily: font_family_name,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'Enter your OTP code here',
                style: TextStyle(
                  fontFamily: font_family_name,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                //

                //
                func_verify_number_after_get_OTP_and_token(
                  verificationCode,
                );
                //

                //
                // func_verify_phone_number(verificationCode);
                //
                /*showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });*/
              }, // end onSubmit
            ),
          ],
        ],
      ),
    );
  }

  //
  func_verify_number_after_get_OTP_and_token(get_verification_code) async {
    if (kDebugMode) {
      print('CODE ====> $get_verification_code');
      print('TOKEN ====> $str_phone_verification_token_id');
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: str_phone_verification_token_id.toString(),
      smsCode: get_verification_code.toString(),
    );
    //
    await FirebaseAuth.instance.signInWithCredential(credential);
    //
  }

  //
  func_verify_phone_number(entered_phone_number) async {
    //
    // FirebaseAuth.instance.app.settings?.isAppVerificationDisabledForTesting = true;
    //
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: entered_phone_number.toString(),
      verificationCompleted: (PhoneAuthCredential credential) {
        if (kDebugMode) {
          print('VERIFICATION SUCCESSFULLY DONE');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print('VERIFICATION FAILED====> ${e.code}');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        if (kDebugMode) {
          print('CODE SENT : $resendToken');
          print('VERIFICATION ID IS ==========> : $verificationId');
        }
        //
        str_phone_verification_token_id = verificationId.toString();
        // print(str_phone_verification_token_id);
        //
        setState(() {
          // print('rajpu');
          str_call_one = '1';
        });
        //
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (kDebugMode) {
          print('CODE AUTO TIMEOUT: $verificationId');
        }
      },
    );
  }
}
