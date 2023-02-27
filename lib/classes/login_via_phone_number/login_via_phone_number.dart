// ignore_for_file: non_constant_identifier_names

import 'package:devicelocale/devicelocale.dart';
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
  //
  @override
  void initState() {
    super.initState();
    //
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
                          },
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
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
          ],
        ],
      ),
    );
  }
}
