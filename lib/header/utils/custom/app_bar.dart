// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, override_on_non_overriding_member, annotate_overrides

import 'package:flutter/material.dart';
import 'package:my_new_orange/header/utils/Utils.dart';

class AppBarScreen extends StatefulWidget with PreferredSizeWidget {
  @override
  final String str_status;
  final String str_app_bar_title;
  final Size preferredSize;

  AppBarScreen({
    Key? key,
    required this.str_app_bar_title,
    required this.str_status,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<AppBarScreen> createState() => _AppBarScreenState();
}

class _AppBarScreenState extends State<AppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget.str_status == '0')
        ? AppBar(
            title: Text(
              //
              widget.str_app_bar_title,
              //
              style: TextStyle(
                fontFamily: font_family_name,
                fontSize: 16.0,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: app_blue_color,
          )
        : AppBar(
            title: Text(
              //
              widget.str_app_bar_title,
              //
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
            automaticallyImplyLeading: true,
            backgroundColor: const Color.fromRGBO(112, 202, 248, 1),
          );
  }
}
