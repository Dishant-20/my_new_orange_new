// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var str_sign_up_alert_message =
    'We will not share any type of your personal information with anyone. This information is only for security purpose.';

var font_family_name = 'Avenir Next';

//
var app_blue_color = const Color.fromARGB(255, 85, 137, 226);
var app_color = const Color.fromRGBO(112, 202, 248, 1);

// navigation title
var str_n_t_set_name = 'Set name';

// public messgae count
var public_message_count = 40;

/* ================================================================ */

// text with regular
Text text_with_regular_style(str) {
  return Text(
    str.toString(),
    style: GoogleFonts.montserrat(
      fontSize: 16.0,
    ),
  );
}

// text with bold
Text text_with_bold_style(str) {
  return Text(
    str.toString(),
    style: GoogleFonts.montserrat(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    ),
  );
}

/* ================================================================ */