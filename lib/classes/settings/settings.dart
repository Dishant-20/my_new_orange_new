// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/settings/about_us/about_us.dart';
import 'package:my_new_orange/classes/settings/privacy/privacy.dart';
import 'package:my_new_orange/classes/settings/terms/terms.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //
  var arr_setting_list = [];

  //
  @override
  void initState() {
    super.initState();
    arr_setting_list = [
      {
        'title': 'About Us',
        'image': 'assets/gif/about-us.png',
      },
      {
        'title': 'Privacy Policy',
        'image': 'assets/gif/privacy-policy.png',
      },
      {
        'title': 'Terms',
        'image': 'assets/gif/terms-and-conditions.png',
      },
      {
        'title': 'Contact Us',
        'image': 'assets/gif/contact-us.png',
      },
    ];
    if (kDebugMode) {
      print('length ===> ${arr_setting_list.length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: font_family_name,
            fontSize: 16.0,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('logout');
              func_logout_WB();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),*/
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 60.0,
              bottom: 0,
            ),
            color: Colors.transparent,
            // width: 48.0,
            height: 48.0,
            child: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      // margin: const EdgeInsets.all(10.0),

                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          24,
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontFamily: font_family_name,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //
                      // func_logout_WB();
                      func_alert_custom();
                      //
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, top: 40.0),
                color: Colors.transparent,
                width: 24.0,
                height: 24.0,
                child: Image.asset(
                  'assets/gif/music.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 40, left: 40, top: 40.0),
                color: Colors.transparent,
                width: 24,
                height: 24,
                child: Image.asset(
                  'assets/gif/link.png',
                ),
              ),
            ],
          ),
          //
          Expanded(
            child: Align(
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
                child: Image.asset(
                  'assets/gif/logo_3.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //
          // Expanded(
          //   child: Center(
          //     child: Container(
          //       margin: const EdgeInsets.all(10.0),
          //       color: Colors.amber,
          //       width: MediaQuery.of(context).size.width,
          //       // height: 48.0,
          //       child: Image.asset('assets/gif/logo_3.png'),
          //     ),
          //   ),
          // ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, top: 40.0, bottom: 40),
                color: Colors.transparent,
                width: 38.0,
                height: 38.0,
                child: Image.asset(
                  'assets/gif/ice-cream.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 40, left: 40, top: 40.0, bottom: 40),
                color: Colors.transparent,
                width: 38.0,
                height: 38.0,
                child: Image.asset(
                  'assets/gif/chat2.png',
                ),
              ),
            ],
          ),
          //
          Container(
            // margin: const EdgeInsets.only(left: 10.0),
            // color: Colors.amber[600],
            width: MediaQuery.of(context).size.width,
            // height: 300,
            decoration: BoxDecoration(
              color: app_blue_color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  52,
                ),
                topRight: Radius.circular(
                  52,
                ),
              ),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    _launchURL(
                      'https://lmocservices.com/index.html',
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, top: 40.0),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              fontFamily: font_family_name,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, top: 40.0),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 10,
                  ),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),
                InkWell(
                  onTap: () {
                    _launchURL(
                      'https://lmocservices.com/about-me',
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 10.0,
                        ),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontFamily: font_family_name,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, top: 10.0),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 10,
                  ),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),

                ///
                ///
                ///
                ///
                ///
                ///
                ///
                InkWell(
                  onTap: () {
                    _launchURL('https://lmocservices.com/terms');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 10.0,
                        ),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Terms and Condition',
                            style: TextStyle(
                              fontFamily: font_family_name,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, top: 10.0),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 10,
                  ),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),

                ///
                ///
                ///
                ///
                ///
                ///
                ///
                ///
                ///
                ///
                InkWell(
                  onTap: () {
                    /*_launchURL(
                      'https://lmocservices.com/about-me',
                    );*/
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          top: 10.0,
                        ),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontFamily: font_family_name,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //
                      Container(
                        margin: const EdgeInsets.only(
                            right: 20, left: 20, top: 10.0),
                        color: Colors.transparent,
                        // width: MediaQuery.of(context).size.width,
                        height: 48.0,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    top: 10,
                    right: 10,
                  ),
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                ),

                ///
                ///
                ///
                ///
                ///
                ///
                ///
                ///
                ///
                ///

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
      /*Column(
        children: [
          for (int i = 0; i < arr_setting_list.length; i++) ...[
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                if (kDebugMode) {
                  print(i);
                }
                if (i == 0) {
                  //
                  // _launchURL(
                  //   'https://www.google.co.in',
                  // );
                  //
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const About_Us(),
                  //   ),
                  // );
                  //
                  _launchURL('https://lmocservices.com/about-me');
                } else if (i == 1) {
                  _launchURL('https://lmocservices.com/privacy-policy');

                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy(),
                    ),
                  );*/
                } else if (i == 2) {
                  _launchURL('https://lmocservices.com/terms');
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndCondition(),
                    ),
                  );*/
                }
              },
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Image.asset(
                      //
                      arr_setting_list[i]['image'].toString(),
                      //
                      width: 50,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      //
                      arr_setting_list[i]['title'].toString(),
                      //
                      style: TextStyle(
                        fontFamily: font_family_name,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: .5,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
          ],
        ],
      ),*/
    );
    //
  }

  func_alert_custom() {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text("Alert Dialog"),
    //       content: Text("Dialog Content"),
    //       actions: [
    //         TextButton(
    //           child: Text("Close"),
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //         )
    //       ],
    //     );
    //   },
    // );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ), //this right here
            child: SizedBox(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Are you sure you want to logout?',
                      style: TextStyle(
                        fontFamily: font_family_name,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              func_logout_WB();
                            },
                            icon: const Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(230, 230, 230, 1),
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: 320.0,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       "Save",
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     // color: const Color(0xFF1BC0C5),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }

  //
  func_logout_WB() async {
    await FirebaseAuth.instance.signOut().then(
          (value) => {
            print(
              'success',
            ),
          },
        );
  }

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  // open browser
  _launchURL(String str_url) async {
    var url = str_url;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
/*
Introduction: These terms and conditions govern the use of the Chat Anonymously service, which is provided by [Company Name]. By using the service, you agree to be bound by these terms and conditions.
User Eligibility: You must be at least [age requirement] years old to use the Chat Anonymously service. Minors under the age of [age requirement] are not eligible to use the service.
User Conduct: You agree to use the Chat Anonymously service only for lawful purposes. You may not use the service to engage in any illegal activities or to violate any laws or regulations.
User Information: You understand that when using the Chat Anonymously service, you may be exposed to content that is offensive or inappropriate. [Company Name] is not responsible for any such content.
Privacy Policy: [Company Name] takes the privacy of its users very seriously. Our Privacy Policy, which is available on our website, explains how we collect, use, and protect your personal information.
Disclaimer of Warranty: The Chat Anonymously service is provided on an "as is" and "as available" basis. [Company Name] makes no representations or warranties of any kind, express or implied, as to the operation of the service or the information, content, or materials included on the service.
Limitation of Liability: [Company Name] will not be liable for any damages of any kind arising from the use of the Chat Anonymously service, including but not limited to direct, indirect, incidental, punitive, and consequential damages.
Indemnification: You agree to indemnify, defend, and hold harmless [Company Name], its officers, directors, employees, agents, and suppliers, from and against all claims, losses, expenses, damages, and costs, including reasonable attorneys' fees, resulting from any violation of these terms and conditions or any activity related to your use of the Chat Anonymously service.
Changes to Terms and Conditions: [Company Name] reserves the right to make changes to these terms and conditions at any time, without prior notice. Your continued use of the Chat Anonymously service constitutes your acceptance of any changes to these terms and conditions.
Governing Law: These terms and conditions are governed by the laws of the [jurisdiction]. Any dispute arising from or related to these terms and conditions will be resolved in the courts of the [jurisdiction].
*/

/*
Introduction:
The Chat Anonymously with Strangers platform (hereinafter referred to as "the Service") is provided by [Company Name], a [Company Location] based company (hereinafter referred to as "the Company"). By using the Service, you agree to the following terms and conditions.
Purpose:
The Service allows users to communicate with strangers anonymously. The Service is provided for entertainment and socializing purposes only. The Company is not responsible for any actions or statements made by users while using the Service.
User Account:
You do not need to create an account to use the Service. However, if you choose to create an account, you are responsible for maintaining the confidentiality of your account and password. You are also responsible for any activities that occur under your account.
User Conduct:
You agree not to use the Service for any illegal or malicious purposes. You also agree not to engage in any behavior that is threatening, abusive, harassing, defamatory, or otherwise harmful to other users. The Company reserves the right to remove any content that violates these terms and conditions.
Data Security:
The Company takes data security seriously and will implement reasonable measures to protect the privacy and security of your personal information. However, the Company cannot guarantee that the Service will be free from unauthorized access or hacking attempts. You acknowledge that you use the Service at your own risk.
Intellectual Property:
The Service, including all software, text, graphics, and other content, is the property of the Company or its licensors and is protected by applicable intellectual property laws. You may not use the Service for any commercial purposes without the express written consent of the Company.
Disclaimer:
The Service is provided on an "as is" and "as available" basis. The Company makes no representations or warranties of any kind, express or implied, as to the operation of the Service or the information, content, or materials included on the Service. The Company will not be liable for any damages of any kind arising from the use of the Service, including but not limited to, direct, indirect, incidental, punitive, and consequential damages.
Termination:
The Company reserves the right to terminate your access to the Service at any time, without notice, for any reason, including but not limited to, a violation of these terms and conditions.
Changes to Terms and Conditions:
The Company reserves the right to modify these terms and conditions at any time without notice. Your continued use of the Service after any such changes constitutes your acceptance of the new terms and conditions.
Governing Law:
These terms and conditions will be governed and interpreted by the laws of [Governing Law]. Any disputes arising out of or in connection with these terms and conditions will be resolved exclusively in the courts of [Jurisdiction].
By using the Service, you acknowledge that you have read and understood these terms and conditions and agree to be bound by them.
 */

/*
TERMS FOR STORY TELLING

Introduction:
The Storytelling Platform (hereinafter referred to as "the Service") is provided by [Company Name], a [Company Location] based company (hereinafter referred to as "the Company"). By using the Service, you agree to the following terms and conditions.
Purpose:
The Service allows users to share their stories with others. The Service is provided for entertainment and self-expression purposes only. The Company is not responsible for the accuracy or truthfulness of any stories shared on the Service.
User Conduct:
You agree not to use the Service for any illegal or malicious purposes. You also agree not to share any content that is threatening, abusive, harassing, defamatory, or otherwise harmful to others. The Company reserves the right to remove any content that violates these terms and conditions.
Intellectual Property:
By sharing your stories on the Service, you grant the Company a non-exclusive, perpetual, irrevocable, transferable, and sub-licensable license to use, copy, modify, distribute, and display your stories in connection with the Service and the promotion of the Service.
Data Security:
The Company takes data security seriously and will implement reasonable measures to protect the privacy and security of your personal information. However, the Company cannot guarantee that the Service will be free from unauthorized access or hacking attempts. You acknowledge that you use the Service at your own risk.
Disclaimer:
The Service is provided on an "as is" and "as available" basis. The Company makes no representations or warranties of any kind, express or implied, as to the operation of the Service or the information, content, or materials included on the Service. The Company will not be liable for any damages of any kind arising from the use of the Service, including but not limited to, direct, indirect, incidental, punitive, and consequential damages.
Termination:
The Company reserves the right to terminate your access to the Service at any time, without notice, for any reason, including but not limited to, a violation of these terms and conditions.
Changes to Terms and Conditions:
The Company reserves the right to modify these terms and conditions at any time without notice. Your continued use of the Service after any such changes constitutes your acceptance of the new terms and conditions.
Governing Law:
These terms and conditions will be governed and interpreted by the laws of [Governing Law]. Any disputes arising out of or in connection with these terms and conditions will be resolved exclusively in the courts of [Jurisdiction].
By using the Service, you acknowledge that you have read and understood these terms and conditions and agree to be bound by them.

*/

/*
contact us 
We at [Company Name] are always eager to hear from you. Whether you have a question, concern, or simply want to share your feedback, we are here to listen. Our goal is to provide excellent service and support to all of our customers, and your input is essential to achieving this objective. We invite you to get in touch with us by using the contact form on our website, sending an email to [Email Address], or giving us a call at [Phone Number]. Our friendly and knowledgeable support team is available [Hours of Operation] to assist you. Thank you for choosing [Company Name]!
*/

/*
At Anamak, we believe in the power of self-expression and the importance of having a safe and secure platform to share our thoughts and feelings. Our mission is to provide a space where anyone can freely express themselves without the fear of judgment or the risk of revealing their identity.

Our platform offers a simple and user-friendly interface that allows users to chat or express their feelings to anyone, anywhere, at any time. With Anamak, you can share your stories, opinions, and experiences with the world, knowing that your data is protected and your identity is confidential.

We understand that privacy and security are paramount, and we have taken the necessary steps to ensure that all of our users' data is kept safe and secure. We use the latest encryption technologies and adhere to strict privacy policies to ensure that our users' personal information is always protected.

At Anamak, we believe that everyone has a story to tell, and we are dedicated to providing a platform that makes it easy and safe for you to share your story with the world. Join us on our mission to spread joy, inspire others, and empower self-expression.
 */