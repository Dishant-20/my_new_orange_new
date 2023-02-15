// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/private_chat/private_chat_room.dart';
import 'package:my_new_orange/header/utils/Utils.dart';

import 'package:my_new_orange/header/utils/custom/app_bar.dart';
// import 'package:badges/badges.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen(
      {super.key,
      required this.str_dialog_login_user_chat_id,
      required this.str_dialog_login_user_gender});

  final String str_dialog_login_user_chat_id;
  final String str_dialog_login_user_gender;

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  //
  FirebaseAuth firebase_auth = FirebaseAuth.instance;
  //
  var str_user_id;
  @override
  void initState() {
    super.initState();
    str_user_id =
        '${firebase_auth.currentUser!.uid}+${widget.str_dialog_login_user_chat_id}';

    // final splitted = str_user_id.split('+');
    // if (kDebugMode) {
    //   print(widget.str_dialog_login_user_chat_id);
    //   print(splitted[0]);
    //   print(splitted[1]);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(
        str_app_bar_title: 'Dialogs',
        str_status: '1',
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('dialog')
            .doc('India')
            .collection('details')
            .orderBy('time_stamp', descending: true)
            .where('match', arrayContainsAny: [
          widget.str_dialog_login_user_chat_id,
        ]).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (kDebugMode) {
              print(snapshot.data!.docs.length);
            }
            // print(snapshot.data!.docs.length);
            var save_snapshot_value = snapshot.data!.docs;
            if (kDebugMode) {
              print(save_snapshot_value);
            }
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // as
                    // print('object');
                    //
                    func_push_to_private_chat(
                        snapshot.data!.docs[index].data());
                    //
                  },
                  child: ListTile(
                      trailing: const Icon(
                        Icons.chevron_right,
                      ),
                      /*Badge(
                      badgeContent: Text(
                        '1',
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 10.0,
                          color: Colors.black,
                        ),
                      ),
                      child: Icon(
                        Icons.chat,
                        color: Colors.black,
                      ),
                      badgeColor: app_color,
                    ),*/
                      title: Text(
                        //
                        (snapshot.data!.docs[index]['user_1_chat_room_id']
                                    .toString() ==
                                widget.str_dialog_login_user_chat_id)
                            ? snapshot.data!.docs[index]['user_2_name']
                                .toString()
                            : snapshot.data!.docs[index]['user_1_name']
                                .toString(),
                        //
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: ((snapshot.data!.docs[index]['last_message']
                                      .toString())
                                  .length >
                              40)
                          ? Text(
                              (snapshot.data!.docs[index]['last_message']
                                      .toString())
                                  .replaceRange(
                                      40,
                                      (snapshot
                                              .data!.docs[index]['last_message']
                                              .toString())
                                          .length,
                                      '...'),
                              style: TextStyle(
                                fontFamily: font_family_name,
                                fontSize: 16.0,
                              ),
                            )
                          : text_with_regular_style(
                              (snapshot.data!.docs[index]['last_message']
                                  .toString()),
                            )

                      // Text(

                      //     //
                      //     (snapshot.data!.docs[index]['last_message']
                      //         .toString()),
                      //     //
                      //     style: TextStyle(
                      //       fontFamily: font_family_name,
                      //       fontSize: 16.0,
                      //     ),
                      //   ),
                      ),
                );
              },
            );
          } else if (snapshot.hasError) {
            if (kDebugMode) {
              print(snapshot.error);
            }
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  // push
  func_push_to_private_chat(dict_dialog_data) {
    if (kDebugMode) {
      print(dict_dialog_data);
    }

    // var create_custom = {
    //   'sender_name': dict_dialog_data['user_1_name'].toString(),
    //   'sender_firebase_id': dict_dialog_data['user_1_name'].toString(),
    //   'sender_chat_user_id': dict_dialog_data['user_1_name'].toString(),
    //   'sender_gender': dict_dialog_data['user_1_name'].toString(),
    // };

/*
str_sender_name = widget.dict_get_all_value['sender_name'].toString();
    str_sender_firebase_id =
        widget.dict_get_all_value['sender_firebase_id'].toString();
    sender_chat_id =
        widget.dict_get_all_value['sender_chat_user_id'].toString();
    str_sender_gender = widget.dict_get_all_value['sender_gender'].toString();
    */

    /*
    {sender_chat_user_id: 6c7aae11-ac23-4a7a-b38e-c69813f4164d,
      time_stamp: 1674397300036,
      sender_firebase_id: XmH2YCpx6zVzbmZarSi1OJNEJdZ2,
      sender_gender: 1,
      sender_name: simulator,
      message: test 2,
      type: text_message,
      room: public}
    */

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrivateChatScreen(
          dict_get_all_value: dict_dialog_data,
          str_login_user_chat_id:
              widget.str_dialog_login_user_chat_id.toString(),
          str_login_user_gender: widget.str_dialog_login_user_gender.toString(),
          str_from_dialog: 'yes',
        ),
      ),
    );
  }
}
