// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:io';
import 'dart:math';

// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrivateChatScreen extends StatefulWidget {
  const PrivateChatScreen({
    super.key,
    required this.dict_get_all_value,
    required this.str_login_user_gender,
    required this.str_login_user_chat_id,
    required this.str_from_dialog,
    // required this.str_receiver_name,
    //required this.str_receiver_firebase_id,
    // required this.str_receiver_chat_user_id
  });

  // final String str_sender_chat_user_id;
  // final String str_receiver_name;
  // final String str_receiver_firebase_id;
  // final String str_receiver_chat_user_id;
  final String str_from_dialog;
  final dict_get_all_value;
  final String str_login_user_gender;
  final String str_login_user_chat_id;

  @override
  State<PrivateChatScreen> createState() => _PrivateChatScreenState();
}

class _PrivateChatScreenState extends State<PrivateChatScreen> {
  //
  File? imageFile;
  var str_image_processing = '0';
  //
  FirebaseAuth firebase_auth = FirebaseAuth.instance;
  //
  // TextEditingController cont_txt_send_message = TextEditingController();
  //
  late final TextEditingController cont_txt_send_message;
  //
  bool _needsScroll = false;
  final ScrollController _scrollController = ScrollController();
  //
  //
  // var str_login_user_random_chat_id;
  //
  var str_save_last_message_type = '';
  var str_sender_name;
  var str_sender_firebase_id;
  var sender_chat_id;
  var str_sender_gender;
  //
  var str_receiver_name = '';
  //
  var room_id;
  var reverse_room_id;
  //
  @override
  void initState() {
    super.initState();
    cont_txt_send_message = TextEditingController();
    //
    print('==================================================');
    print('=====> GET ALL DETAILS FOR PERSONAL CHAT <=====');
    print('==================================================');
    print(widget.dict_get_all_value);
    print('==================================================');
    print('==================================================');
    // return;

    if (widget.str_from_dialog == 'yes') {
      print('from dialog');
      print(widget.str_login_user_chat_id);

      if (widget.str_login_user_chat_id.toString() ==
          widget.dict_get_all_value['user_1_chat_room_id'].toString()) {
        print('This is receiver name');

        str_sender_name = widget.dict_get_all_value['user_2_name'].toString();

        str_receiver_name = widget.dict_get_all_value['user_2_name'].toString();

        ///
        /// ROOM ID
        ///
        var create_room_id =
            '${widget.str_login_user_chat_id}+${widget.dict_get_all_value['user_2_chat_room_id'].toString()}';
        var create_reverse_room_id =
            '${widget.dict_get_all_value['user_2_chat_room_id'].toString()}+${widget.str_login_user_chat_id}';

        room_id = create_room_id.toString();

        reverse_room_id = create_reverse_room_id.toString();
      } else {
        print('This is Login user name');

        str_sender_name = widget.dict_get_all_value['user_1_name'].toString();

// receiver name
        str_receiver_name = widget.dict_get_all_value['user_1_name'].toString();
        // print('This is Login gender');

        // str_sender_gender = widget.dict_get_all_value['user_1_name'].toString();

        ///
        /// ROOM ID
        ///
        var create_room_id =
            '${widget.dict_get_all_value['user_1_chat_room_id'].toString()}+${widget.dict_get_all_value['user_2_chat_room_id'].toString()}';
        var create_reverse_room_id =
            '${widget.dict_get_all_value['user_2_chat_room_id'].toString()}+${widget.dict_get_all_value['user_1_chat_room_id'].toString()}';

        room_id = create_room_id.toString();

        reverse_room_id = create_reverse_room_id.toString();
      }

      sender_chat_id =
          widget.dict_get_all_value['sender_chat_user_id'].toString();
    } else {
      print('from public');
      print(widget.str_login_user_chat_id);
      str_sender_name = widget.dict_get_all_value['sender_name'].toString();
      str_sender_firebase_id =
          widget.dict_get_all_value['sender_firebase_id'].toString();
      sender_chat_id =
          widget.dict_get_all_value['sender_chat_user_id'].toString();
      str_sender_gender = widget.dict_get_all_value['sender_gender'].toString();

      var create_room_id = '$sender_chat_id+${widget.str_login_user_chat_id}';
      var create_reverse_room_id =
          '${widget.str_login_user_chat_id}+$sender_chat_id';

      // print('==================================================');
      // print('=====> ROOM ID <=====');
      // print('==================================================');
      room_id = create_room_id.toString();

      // print(room_id);
      // print('==================================================');

      // print('=====> REVERSE ROOM ID <=====');
      // print('==================================================');
      reverse_room_id = create_reverse_room_id.toString();
      // print(reverse_room_id);
      // print('==================================================');
      // print('==================================================');
    }
  }

  @override
  void dispose() {
    cont_txt_send_message.dispose();

    super.dispose();
  }

  _scrollToEnd() async {
    if (_needsScroll) {
      _needsScroll = false;
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBarScreen(
          str_app_bar_title: str_sender_name.toString(),
          str_status: '1',
        ),
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            //1
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('message')
                  .doc('India')
                  .collection('private_chats')
                  .orderBy('time_stamp')
                  .where(
                'room_id',
                whereIn: [
                  room_id,
                  reverse_room_id,
                ],
              ).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  //
                  func_scroll_to_bottom('1');
                  //
                  var save_snapshot_value = snapshot.data!.docs;
                  //
                  return Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (int i = 0;
                                i < save_snapshot_value.length;
                                i++) ...[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: (widget.str_login_user_chat_id ==
                                        save_snapshot_value[i]
                                                ['sender_custom_chat_id']
                                            .toString())
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 10, left: 40, bottom: 10),
                                          decoration: const BoxDecoration(
                                            // 216 , 200 , 256
                                            color: Color.fromARGB(
                                                255, 238, 113, 196),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(40),
                                              topRight: Radius.circular(40),
                                              bottomLeft: Radius.circular(40),
                                            ),
                                          ),
                                          child: (save_snapshot_value[i]
                                                          ['attachment_path']
                                                      .toString() ==
                                                  '')
                                              ? Padding(
                                                  padding: const EdgeInsets.all(
                                                    16.0,
                                                  ),
                                                  child: Text(
                                                    //
                                                    save_snapshot_value[i]
                                                            ['message']
                                                        .toString(),
                                                    //
                                                    style: TextStyle(
                                                      fontFamily:
                                                          font_family_name,
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  margin:
                                                      const EdgeInsets.all(8),
                                                  width: 260,
                                                  height: 260,
                                                  decoration:
                                                      const BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color.fromRGBO(
                                                            170, 0, 20, 1),
                                                        Color.fromRGBO(
                                                            180, 30, 20, 1),
                                                        Color.fromRGBO(
                                                            218, 115, 32, 1),
                                                        Color.fromRGBO(
                                                            227, 142, 36, 1),
                                                        Color.fromRGBO(
                                                            236, 170, 40, 1),
                                                        Color.fromRGBO(
                                                            248, 198, 40, 1),
                                                        Color.fromRGBO(
                                                            252, 209, 42, 1),
                                                      ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                    ),
                                                    // color: Colors.amber[600],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                        40.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                    child: Image.network(
                                                      //
                                                      save_snapshot_value[i][
                                                              'attachment_path']
                                                          .toString(),
                                                      //
                                                      width: 110.0,
                                                      height: 110.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      )
                                    :

                                    // receiver
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 40, bottom: 10),
                                        // height: 40,
                                        // width: MediaQuery.of(context).size.width,

                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(230, 230, 230, 1),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                            bottomRight: Radius.circular(40),
                                          ),
                                        ),
                                        child: (save_snapshot_value[i]
                                                        ['attachment_path']
                                                    .toString() ==
                                                '')
                                            ? Padding(
                                                padding: const EdgeInsets.all(
                                                  16.0,
                                                ),
                                                child: Text(
                                                  //
                                                  save_snapshot_value[i]
                                                          ['message']
                                                      .toString(),
                                                  //
                                                  style: TextStyle(
                                                    fontFamily:
                                                        font_family_name,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                margin: const EdgeInsets.all(8),
                                                width: 260,
                                                height: 260,
                                                decoration: BoxDecoration(
                                                  color: Colors.amber[600],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      40.0,
                                                    ),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  child: Image.network(
                                                    //
                                                    save_snapshot_value[i]
                                                            ['attachment_path']
                                                        .toString(),
                                                    //
                                                    width: 110.0,
                                                    height: 110.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                      ),
                                // me
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  if (kDebugMode) {
                    print(snapshot.error);
                  }
                  return Center(
                    child: Text(
                      'Index Issue. Please contact admin.',
                      style: TextStyle(
                        fontFamily: font_family_name,
                        fontSize: 16.0,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('no chat found'),
                  );
                }
              },
            ),
            (str_image_processing == '0')
                ? const SizedBox(
                    height: 0,
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      // color: const Color.fromARGB(255, 232, 137, 202),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 232, 137, 202),
                        borderRadius: BorderRadius.circular(
                          14.0,
                        ),
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
                      // width: 120, // MediaQuery.of(context).size.width,
                      height: 60.0,
                      child: Row(
                        children: const <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Align(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'processing...',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            // send message
            send_message_UI(),
            //
          ],
        ),
      ),
    );
  }

/*Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('message')
                    .doc('India')
                    .collection('private_chats')
                    .orderBy('time_stamp')
                    .where(
                  'room_id',
                  whereIn: [
                    room_id,
                    reverse_room_id,
                  ],
                ).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    // print(snapshot.hasData);
                    // print(snapshot.data!.docs);
                    // ');
                    func_scroll_to_bottom('1');
                    //
                    //print(snapshot.data!.docs);
                    var save_snapshot_value = snapshot.data!.docs;
                    //

                    return SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          for (int i = 0;
                              i < save_snapshot_value.length;
                              i++) ...[
                            Container(
                              margin: const EdgeInsets.only(
                                top: 6.0,
                              ),
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      if (save_snapshot_value[i]
                                                  ['sender_gender']
                                              .toString() ==
                                          '1') ...[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              Icons.boy,
                                              color: app_color,
                                            ),
                                          ),
                                        )
                                      ] else if (save_snapshot_value[i]
                                                  ['sender_gender']
                                              .toString() ==
                                          '2') ...[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              Icons.girl,
                                              color: Colors.pink,
                                            ),
                                          ),
                                        )
                                      ] else ...[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(
                                              Icons.abc,
                                              color: Colors.purple,
                                            ),
                                          ),
                                        )
                                      ],
                                      Text(
                                        //
                                        save_snapshot_value[i]['sender_name']
                                            .toString(),

                                        //

                                        style: TextStyle(
                                          fontFamily: font_family_name,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 0.0,
                                      left: 10.0,
                                      right: 40.0,
                                      bottom: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                        12.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                              234,
                                              234,
                                              234,
                                              1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: (save_snapshot_value[i]
                                                            ['attachment_path']
                                                        .toString() ==
                                                    '')
                                                ? Text(
                                                    //
                                                    save_snapshot_value[i]
                                                            ['message']
                                                        .toString(),
                                                    //
                                                    style: TextStyle(
                                                      fontFamily:
                                                          font_family_name,
                                                      fontSize: 16.0,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                : Container(
                                                    margin:
                                                        const EdgeInsets.all(8),
                                                    width: 260,
                                                    height: 260,
                                                    decoration:
                                                        const BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              170, 0, 20, 1),
                                                          Color.fromRGBO(
                                                              180, 30, 20, 1),
                                                          Color.fromRGBO(
                                                              218, 115, 32, 1),
                                                          Color.fromRGBO(
                                                              227, 142, 36, 1),
                                                          Color.fromRGBO(
                                                              236, 170, 40, 1),
                                                          Color.fromRGBO(
                                                              248, 198, 40, 1),
                                                          Color.fromRGBO(
                                                              252, 209, 42, 1),
                                                        ],
                                                        begin:
                                                            Alignment.topCenter,
                                                        end: Alignment
                                                            .bottomCenter,
                                                      ),
                                                      // color: Colors.amber[600],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(
                                                          40.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                      child: Image.network(
                                                        //
                                                        save_snapshot_value[i][
                                                                'attachment_path']
                                                            .toString(),
                                                        //
                                                        width: 110.0,
                                                        height: 110.0,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                          Container(
                            width: 10,
                            height: 20,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // print(snapshot.error);
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            //
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: app_color,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                // height: 60,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 300.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35.0),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  color: Colors.grey)
                            ],
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    _showActionSheet_for_camera_gallery(
                                        context);
                                  }),
                              Expanded(
                                child: TextField(
                                  minLines: 1,
                                  maxLines: 5,
                                  // maxLengthEnforced: true,
                                  controller: cont_txt_send_message,
                                  decoration: const InputDecoration(
                                    hintText: "Type Something...",
                                    hintStyle: TextStyle(
                                      color: Colors.blueAccent,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  // onTap: () {
                                  //   print('object');
                                  // },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(
                          15.0,
                        ),
                        decoration: BoxDecoration(
                          color: app_color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.purple,
                          ),
                        ),
                        child: InkWell(
                          child: const Icon(
                            Icons.send,
                            color: Colors.purple,
                          ),
                          onTap: () {
                            func_send_message(
                                cont_txt_send_message.text.toString());

                            cont_txt_send_message.text = '';
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //child: ,
            ),*/
  Align send_message_UI() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 10,
          right: 10,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            bottom: 0,
            top: 0,
            right: 10,
          ),
          // height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('gesture deducted');
                  _showActionSheet_for_camera_gallery(context);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextField(
                  controller: cont_txt_send_message,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: "Write message...",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: font_family_name,
                      fontSize: 16.0,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              FloatingActionButton(
                onPressed: () {
                  print('send button');
                  func_send_message(cont_txt_send_message.text.toString());
                  cont_txt_send_message.text = '';
                },
                child: Icon(
                  Icons.send,
                  color: Colors.black,
                  size: 18,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

// left side ui
  Align left_side_chat_UI(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> save_snapshot_value,
      int i) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 40, bottom: 10),
        // height: 40,
        // width: MediaQuery.of(context).size.width,

        decoration: const BoxDecoration(
          color: Color.fromRGBO(230, 230, 230, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: (save_snapshot_value[i]['type'].toString() == 'image')
            ? Container(
                margin: const EdgeInsets.all(8),
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.amber[600],
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      40.0,
                    ),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Image.network(
                    //
                    save_snapshot_value[i]['attachment_path'].toString(),
                    //
                    width: 110.0,
                    height: 110.0,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: Text(
                  //
                  save_snapshot_value[i]['message'].toString(),
                  //
                  style: TextStyle(
                    fontFamily: font_family_name,
                    fontSize: 16.0,
                  ),
                ),
              ),
      ),
    );
  }

  ///
  ///
  ///
  ///
  ///
// send message
  func_send_message(str_get_message) {
    str_save_last_message_type = str_get_message.toString();

    String receiver_name_get = '';
    String receiver_gender_get = '';

    if (widget.str_from_dialog == 'yes') {
      // from dialog
      if (widget.str_login_user_chat_id.toString() ==
          widget.dict_get_all_value['user_1_chat_room_id'].toString()) {
        receiver_name_get = widget.dict_get_all_value['user_2_name'].toString();

        receiver_gender_get =
            widget.dict_get_all_value['user_2_gender'].toString();
      } else {
        receiver_name_get = widget.dict_get_all_value['user_1_name'].toString();

        receiver_gender_get =
            widget.dict_get_all_value['user_1_gender'].toString();
      }
    } else {
      // from public screen
      receiver_name_get = widget.dict_get_all_value['sender_name'].toString();
    }

    CollectionReference users = FirebaseFirestore.instance.collection(
      'message/India/private_chats',
    );

    users
        .add(
          {
            // asas
            //
            'attachment_path': '',
            'sender_custom_chat_id': widget.str_login_user_chat_id
                .toString(), //widget.str_login_user_chat_id.toString(),
            'sender_name': firebase_auth.currentUser!.displayName,
            'sender_gender': widget.str_login_user_gender.toString(),

            'receiver_name': receiver_name_get.toString(),
            'receiver_gender': receiver_gender_get.toString(),

            'message': str_get_message.toString(),
            'time_stamp': DateTime.now().millisecondsSinceEpoch,
            'room_id': room_id.toString(),
            'users': [
              room_id,
              reverse_room_id,
            ]
          },
        )
        .then(
          (value) => func_scroll_to_bottom('0'),
        )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }

// update dialog
  func_update_dialog() {
    print('bottle');
    FirebaseFirestore.instance
        .collection("dialog")
        .doc("India")
        .collection("details")
        .where("users", arrayContainsAny: [room_id, reverse_room_id])
        .get()
        .then(
          (value) {
            if (kDebugMode) {
              print(value.docs.length);
            }

            if (value.docs.isEmpty) {
              print('===> CREATE DIALOG <===');
              //
              func_create_dialog();
              //
            } else {
              for (var element in value.docs) {
                print(element.id);

                func_update_dialog_after_add(element.id.toString());
              }
            }
          },
        );
  }

  func_create_dialog() {
    CollectionReference users =
        FirebaseFirestore.instance.collection('dialog/India/details');
    // '$sender_chat_id+${widget.str_login_user_chat_id}';
    users
        .add(
          {
            'firebase_id': FirebaseAuth.instance.currentUser!.uid,
            'last_message': str_save_last_message_type.toString(),
            'last_message_type': 'message_text',
            'time_stamp': DateTime.now().millisecondsSinceEpoch,
            //
            'user_1_chat_room_id': widget.str_login_user_chat_id.toString(),
            'user_1_name': firebase_auth.currentUser!.displayName.toString(),
            'user_1_gender': widget.str_login_user_gender.toString(),
            //
            'user_2_chat_room_id': sender_chat_id.toString(),
            'user_2_name': str_sender_name.toString(),
            'user_2_gender': str_sender_gender.toString(),
            'users': [
              room_id,
              reverse_room_id,
            ],
            'match': [
              sender_chat_id.toString(),
              widget.str_login_user_chat_id.toString()
            ]
          },
        )
        .then(
          (value) => print("==> DIALOG CREATED SUCCESSFULLY ==>${value.id}"),
        )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }

  func_update_dialog_after_add(String str_firestore_id) {
    if (kDebugMode) {
      print('object');
    }

    FirebaseFirestore.instance
        .collection('dialog')
        .doc('India')
        .collection('details')
        .doc(str_firestore_id)
        .set(
      {
        'last_message': str_save_last_message_type.toString(),
        'time_stamp': DateTime.now().millisecondsSinceEpoch,
        'last_message_type': 'message_text',
      },
      SetOptions(merge: true),
    ).then(
      (value) => {
        print('===> DIALOGE UPDATED SUCCESSFULLY <==='),
      },
    );
  }

//
  void _showActionSheet_for_camera_gallery(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Camera option'),
        // message: const Text(''),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);

              // ignore: deprecated_member_use
              PickedFile? pickedFile = await ImagePicker().getImage(
                source: ImageSource.camera,
                maxWidth: 1800,
                maxHeight: 1800,
              );
              if (pickedFile != null) {
                setState(() {
                  print('camera');
                  imageFile = File(pickedFile.path);
                });
                //
                str_image_processing = '1';
                //
                uploadImageToFirebase(context);
                //

                //
              }
            },
            child: Text(
              'Open Camera',
              style: TextStyle(
                fontFamily: font_family_name,
                fontSize: 18.0,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);

              // ignore: deprecated_member_use
              PickedFile? pickedFile = await ImagePicker().getImage(
                source: ImageSource.gallery,
                maxWidth: 1800,
                maxHeight: 1800,
              );
              if (pickedFile != null) {
                setState(() {
                  if (kDebugMode) {
                    print('gallery');
                  }
                  imageFile = File(pickedFile.path);
                });
                str_image_processing = '1';
                uploadImageToFirebase(context);
              }
            },
            child: Text(
              'Open Gallery',
              style: TextStyle(
                fontFamily: font_family_name,
                fontSize: 18.0,
              ),
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Dismiss',
              style: TextStyle(
                fontFamily: font_family_name,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // scroll to bottom
  func_scroll_to_bottom(str_scroll_status) {
    if (str_scroll_status == '0') {
      func_update_dialog();
    } else {
      _needsScroll = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
    }
  }

  // UPLOAD IMAGE ON FIREBASE
  // upload image via firebase
  Future uploadImageToFirebase(BuildContext context) async {
    if (kDebugMode) {
      print('dishu');
    }
    // String fileName = basename(imageFile_for_profile!.path);
    Reference storageRef = FirebaseStorage.instance
        .ref()
        .child(
          'private_chat/${firebase_auth.currentUser!.uid}',
        )
        .child(
          generateRandomString(10),
        );
    await storageRef.putFile(imageFile!);
    return await storageRef.getDownloadURL().then((value) => {
          // print(
          //   '======>$value',
          // )
          func_upload_image(value)
        });
  }

  // send message
  func_upload_image(str_get_message) {
    //
    setState(() {
      str_image_processing = '0';
    });
    //
    String receiver_name_get = '';
    String receiver_gender_get = '';

    if (widget.str_from_dialog == 'yes') {
      // from dialog
      if (widget.str_login_user_chat_id.toString() ==
          widget.dict_get_all_value['user_1_chat_room_id'].toString()) {
        receiver_name_get = widget.dict_get_all_value['user_2_name'].toString();

        receiver_gender_get =
            widget.dict_get_all_value['user_2_gender'].toString();
      } else {
        receiver_name_get = widget.dict_get_all_value['user_1_name'].toString();

        receiver_gender_get =
            widget.dict_get_all_value['user_1_gender'].toString();
      }
    } else {
      // from public screen
      receiver_name_get = widget.dict_get_all_value['sender_name'].toString();
    }

    CollectionReference users = FirebaseFirestore.instance.collection(
      'message/India/private_chats',
    );

    users
        .add(
          {
            'attachment_path': str_get_message.toString(),
            'sender_custom_chat_id': widget.str_login_user_chat_id
                .toString(), //widget.str_login_user_chat_id.toString(),
            'sender_name': firebase_auth.currentUser!.displayName,
            'sender_gender': widget.str_login_user_gender.toString(),

            'receiver_name': receiver_name_get.toString(),
            'receiver_gender': receiver_gender_get.toString(),

            'message': '',
            'time_stamp': DateTime.now().millisecondsSinceEpoch,
            'room_id': room_id.toString(),
            'users': [
              room_id,
              reverse_room_id,
            ]
          },
        )
        .then(
          (value) => func_scroll_to_bottom('0'),
        )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }

  String generateRandomString(int lengthOfString) {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    // below statement will generate a random string of length using the characters
    // and length provided to it
    final randomString = List.generate(lengthOfString,
        (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }
}
