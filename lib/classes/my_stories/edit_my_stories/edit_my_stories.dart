// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

class EditMyStoriesScreen extends StatefulWidget {
  const EditMyStoriesScreen(
      {super.key,
      required this.str_feed_name,
      required this.str_feed_title,
      required this.str_feed_description,
      required this.str_feed_id,
      required this.str_hide_status});

  final String str_hide_status;
  final String str_feed_id;
  final String str_feed_name;
  final String str_feed_title;
  final String str_feed_description;

  @override
  State<EditMyStoriesScreen> createState() => _EditMyStoriesScreenState();
}

class _EditMyStoriesScreenState extends State<EditMyStoriesScreen> {
  //
  var str_save_and_continue_loader = '0';
  //
  final _formKey = GlobalKey<FormState>();
  //
  late final TextEditingController cont_title;
  late final TextEditingController cont_category;
  late final TextEditingController cont_description;
  //
  var str_hide_unhide_status = '';
  //
  @override
  void initState() {
    super.initState();
    //
    cont_title = TextEditingController(text: widget.str_feed_title.toString());
    cont_category =
        TextEditingController(text: widget.str_feed_name.toString());
    cont_description =
        TextEditingController(text: widget.str_feed_description.toString());
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(
        str_app_bar_title: 'edit',
        str_status: '1',
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              /*Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      color: Colors.amber[600],
                      // width: MediaQuery.of(context).size.width,
                      height: 48.0,
                      child: Align(
                        child: Text(
                          'Hide your post from Everyone',
                          style: TextStyle(
                            fontFamily: font_family_name,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  (widget.str_hide_status == 'yes')
                      ? Container(
                          margin: const EdgeInsets.all(10.0),
                          color: Colors.amber[600],
                          // width: MediaQuery.of(context).size.width,
                          height: 48.0,
                          child: const Align(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Yes',
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.all(10.0),
                          color: Colors.amber[600],
                          // width: MediaQuery.of(context).size.width,
                          height: 48.0,
                          child: const Align(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Yes',
                              ),
                            ),
                          ),
                        ),
                ],
              ),*/
              Container(
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                // height: 54,
                decoration: BoxDecoration(
                  // color: Colors.amber[600],
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: TextFormField(
                  readOnly: false,
                  controller: cont_category,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Category',
                      hintText: 'ex.Love, Hate, Comedy...'
                      // suffixIcon: Icon(
                      //   Icons.arrow_drop_down,
                      // ),
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                // height: 54,
                decoration: BoxDecoration(
                  // color: Colors.amber[600],
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: TextFormField(
                  controller: cont_title,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                ),
                child: TextFormField(
                  controller: cont_description,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLines: 10,
                ),
              ),
              if (str_save_and_continue_loader == '1')
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              else
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (kDebugMode) {
                        print('value all fill now');
                      }
                      func_edit_my_story();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(
                      10.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      color: const Color.fromRGBO(112, 202, 248, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                            0,
                            3,
                          ), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Create',
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // edit story in XMPP Server
  func_edit_my_story() {
    setState(() {
      str_save_and_continue_loader = '1';
    });
    FirebaseFirestore.instance
        .collection('story')
        .doc('India')
        .collection('details')
        .doc(widget.str_feed_id.toString())
        .set(
      {
        'story_category_name': cont_category.text.toString(),
        'story_title': cont_title.text.toString(),
        'story_description': cont_description.text.toString(),
      },
      SetOptions(merge: true),
    ).then(
      (value) {
        //Do your stuff.
        if (kDebugMode) {
          print('=====> STORY SUCCESSFULLY UPDATED <=====');
        }
        setState(() {
          str_save_and_continue_loader = '0';
          var snackBar = SnackBar(
            content: Text(
              'Successfully Update',
              style: TextStyle(
                fontFamily: font_family_name,
                fontSize: 16.0,
              ),
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 1),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
    );
  }
}
