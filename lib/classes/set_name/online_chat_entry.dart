// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:uuid/uuid.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/public_chat/public_chat_room.dart';
import 'package:my_new_orange/classes/set_name/online_chat_entry_UI.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OnlineChatEntryScreen extends StatefulWidget {
  const OnlineChatEntryScreen({super.key});

  @override
  State<OnlineChatEntryScreen> createState() => _OnlineChatEntryScreenState();
}

class _OnlineChatEntryScreenState extends State<OnlineChatEntryScreen> {
  //
  var str_enter_loader = '0';
  //
  String? gender = 'n.a.';
  //
  FirebaseAuth firebase_auth = FirebaseAuth.instance;
  //
  final _formKey = GlobalKey<FormState>();
  //
  // var str_waiting_title = '0';
  //
  TextEditingController cont_name = TextEditingController();
  //
  var chat_user_id;
  //
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(
        str_app_bar_title: str_n_t_set_name,
        str_status: '1',
      ),
      body: (str_enter_loader == '1')
          ? const Align(
              child: CircularProgressIndicator(),
            )
          : /*InkWell(
              onTap: () {
                setState(() {
                  str_enter_loader = '1';
                });
              },
              child: Align(
                child: Text(
                  'data',
                ),
              ),
            ),*/
          Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                  ),
                  color: Colors.transparent,
                  height: 60,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: cont_name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: app_color,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                //
                Column(
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
                ),
                //

                InkWell(
                  onTap: () {
                    // print('====> dishant rajput <====');

                    if (_formKey.currentState!.validate()) {
                      if (kDebugMode) {
                        print('value all fill now');
                      }
                      setState(() {
                        str_enter_loader = '1'.toString();
                      });
                      func_update_name_in_firebase();
                    }

                    /*if (cont_name.text == '') {
                      _showMyDialog('Please enter name.');
                    } else if (gender == 'n.a.') {
                      _showMyDialog('Please select your gender.');
                    } else {
                      str_enter_loader.toString() == '1121'.toString();
                      setState(() {
                        // if (kDebugMode) {
                        //   print('me ?');
                        // }
                      });
                      print(str_enter_loader);

                      const Align(
                        child: CircularProgressIndicator(),
                      );

                      // func_update_name_in_firebase();
                    }*/
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    height: 60,
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(
                        116,
                        190,
                        228,
                        1,
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: app_color.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                            0,
                            3,
                          ), // changes position of shadow
                        ),
                      ],
                    ),
                    // 115 189 227
                    child: Center(
                      child: Text(
                        //
                        'Enter',
                        //
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

// alert
  Future<void> _showMyDialog(
    String str_message,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Alert',
            style: TextStyle(
              fontFamily: font_family_name,
              fontSize: 16.0,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  str_message,
                  style: TextStyle(
                    fontFamily: font_family_name,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // update name in firebase
  func_update_name_in_firebase() async {
    await firebase_auth.currentUser!
        .updateDisplayName(
          cont_name.text.toString(),
        )
        .then(
          (value) => {
            print('success'),
            func_save_user_to_XMPP_server(),
          },
        );
  }

  // save user to firebase database server then push to public chat
  func_save_user_to_XMPP_server() {
    chat_user_id = const Uuid().v4();

    FirebaseFirestore.instance
        .collection('users')
        .doc('India')
        .collection('details')
        .doc(firebase_auth.currentUser!.uid.toString())
        .set(
      {
        // chat_user_id =
        'chat_user_id': chat_user_id.toString(),
        'firebase_id': firebase_auth.currentUser!.uid.toString(),

        'chat_user_name': firebase_auth.currentUser!.displayName.toString(),
        'time_stamp': DateTime.now().millisecondsSinceEpoch,
        'gender_status': gender.toString(),
      },
      SetOptions(merge: true),
    ).then(
      (value) => {
        print('data save succesfully'),

        // push
        func_push_to_public_chat(),
      },
    );
  }

  // push to public cchat page
  func_push_to_public_chat() {
    setState(() {
      str_enter_loader = '0'.toString();
    });
    //
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PublicChatRoomScreen(
          sender_gender: gender.toString(),
          sender_name: firebase_auth.currentUser!.displayName.toString(),
          chat_user_id: chat_user_id.toString(),
        ),
      ),
    );
    //
  }
}
