// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_new_orange/header/utils/Utils.dart';

class About_Us extends StatefulWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
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
      ),
      body: const Padding(
        padding: EdgeInsets.all(
          20.0,
        ),
        child: Text(
          'We are here to provide you a Chatting platform where you can chat with anyone without revealing your identity or any of your personal data. Your all data is Safe and Secured with us. ',
          style: TextStyle(
            fontFamily: 'Avenir Next',
          ),
        ),
      ),
    );
  }
}
