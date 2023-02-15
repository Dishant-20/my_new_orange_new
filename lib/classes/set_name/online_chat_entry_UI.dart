// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:my_new_orange/header/utils/Utils.dart';

import 'package:firebase_core/firebase_core.dart';

class OnlineChatEntryRadioButton extends StatefulWidget {
  const OnlineChatEntryRadioButton({super.key});

  @override
  State<OnlineChatEntryRadioButton> createState() =>
      _OnlineChatEntryRadioButtonState();
}

class _OnlineChatEntryRadioButtonState
    extends State<OnlineChatEntryRadioButton> {
  String? gender = 'n.a.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text(
            "Male",
            style: TextStyle(
              fontFamily: font_family_name,
              fontSize: 16.0,
            ),
          ),
          value: "1",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text(
            "Female",
            style: TextStyle(
              fontFamily: font_family_name,
              fontSize: 16.0,
            ),
          ),
          value: "2",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: Text(
            "Prefer not to say",
            style: TextStyle(
              fontFamily: font_family_name,
              fontSize: 16.0,
            ),
          ),
          value: "3",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
      ],
    );
  }
}
