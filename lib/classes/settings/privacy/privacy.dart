// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_new_orange/header/utils/Utils.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  //
  String str_project_name = 'Your-Own-words';
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy',
          style: TextStyle(
            fontFamily: font_family_name,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.brown,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const <Widget>[
            Text(
              'Privacy Policy:\n',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please note Your-Own-words assumes no liable for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, user or Member communications. Information is collected from users at several different points on our website, detailed in this statement. Cookies: A cookie is a piece of data stored on the user"s hard drive containing information about the user. Usage of a cookie is in no way linked to any personally identifiable information while on our site. Once the user closes their browser, the cookie simply terminates. By setting a cookie on our site, the user would not have to log in a password more than once, thereby saving time while on our site. If a user rejects the cookie, they may still use our site. Log Files: We use IP addresses to analyze trends, administer the site, track users, and gather broad demographic information for aggregate use. IP addresses are not linked to personally identifiable information.',
              style: TextStyle(
                fontFamily: 'Avenir',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
