// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print

// import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_new_orange/classes/dialog/dialog.dart';
import 'package:my_new_orange/classes/private_chat/private_chat_room.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PublicChatRoomScreen extends StatefulWidget {
  const PublicChatRoomScreen(
      {super.key,
      required this.sender_gender,
      required this.sender_name,
      required this.chat_user_id});

  final String sender_gender;
  final String sender_name;
  final String chat_user_id;

  @override
  State<PublicChatRoomScreen> createState() => _PublicChatRoomScreenState();
}

class _PublicChatRoomScreenState extends State<PublicChatRoomScreen> {
  //
  FirebaseAuth firebase_auth = FirebaseAuth.instance;
  //
  TextEditingController cont_txt_send_message = TextEditingController();
  //
  bool _needsScroll = false;
  final ScrollController _scrollController = ScrollController();
  //
  var str_scroll_only_one = '0';
  //
  @override
  void initState() {
    super.initState();
    // func_scroll_to_bottom();
    // print(widget.chat_user_id);
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
        appBar: AppBar(
          title: Text(
            //
            'Public Chat Room',
            //
            style: TextStyle(
              fontFamily: font_family_name,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
            ),
            onPressed: () {
              //
              Navigator.pop(context);
              // func_exit_app();
              //
            },
          ),
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(
            112,
            202,
            248,
            1,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.forum,
              ),
              onPressed: () {
                print('object');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DialogScreen(
                      str_dialog_login_user_chat_id: widget.chat_user_id,
                      str_dialog_login_user_gender:
                          widget.sender_gender.toString(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        /*AppBarScreen(
          str_app_bar_title: 'Public Chat Room',
          str_status: '1',
        ),*/
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(
                      "message/India/public_chats",
                    )
                    .orderBy('time_stamp', descending: true)
                    .limit(50)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  /*if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.brown,
                        ),
                      ),
                    );
                  }*/
                  if (snapshot.hasData) {
                    //
                    if (str_scroll_only_one == '0') {
                      _needsScroll = true;
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) => _scrollToEnd());
                      // setState(() {
                      str_scroll_only_one = '1';
                      // });
                    }
                    //print(snapshot.data!.docs);
                    var save_snapshot_value =
                        snapshot.data!.docs.reversed.toList();
                    //

                    return NotificationListener(
                      onNotification: (t) {
                        // print(t is ScrollPosition);
                        /*if (t is ScrollEndNotification) {
                          print('scroll end scrolling');
                          // print(_scrollController.position.pixels);
                        } else if (t is ScrollUpdateNotification) {
                          print('scroll update');
                          // print(_scrollController.position.pixels);
                        } else if (t is ScrollEndNotification) {
                          print('scroll start scrolling');
                          // print(_scrollController.position.pixels);
                        }*/

                        return true;
                        //How many pixels scrolled from pervious frame
                        // print(t.scrollDelta);

                        //List scroll position
                        // print('');
                      },
                      child: SingleChildScrollView(
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
                                        text_with_bold_style(
                                          save_snapshot_value[i]['sender_name']
                                              .toString(),
                                        ),
                                        /*Text(
                                          //
                                          save_snapshot_value[i]['sender_name']
                                              .toString(),
                                          //
                    
                                          style: TextStyle(
                                            fontFamily: font_family_name,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),*/
                                        (firebase_auth.currentUser!.uid
                                                    .toString() ==
                                                save_snapshot_value[i]
                                                        ['sender_firebase_id']
                                                    .toString())
                                            ? const Text('')
                                            : IconButton(
                                                icon: Icon(
                                                  Icons.chat,
                                                  color: app_color,
                                                ),
                                                onPressed: () {
                                                  func_get_receiver_all_values(
                                                      //
                                                      save_snapshot_value[i]
                                                          .data());
                                                },
                                              )
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                12.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: text_with_regular_style(
                                                save_snapshot_value[i]
                                                        ['message']
                                                    .toString(),
                                              ),
                                              /*Text(
                                                //
                                                save_snapshot_value[i]['message']
                                                    .toString(),
                                                //
                                                style: TextStyle(
                                                  fontFamily: font_family_name,
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                ),
                                              ),*/
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
                      ),
                    );
                  } else if (snapshot.hasError) {
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
            send_message_UI(),
            //
            /*Container(
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
                                  func_image_alert_popup();
                                },
                              ),
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
                            // FocusScope.of(context).requestFocus(FocusNode());

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
          ],
        ),
      ),
    );
  }

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
              /*GestureDetector(
                onTap: () {
                  print('gesture deducted');
                  //  _showActionSheet_for_camera_gallery(context);
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
              ),*/
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

  // send message
  func_send_message(str_get_message) {
    // print(cont_txt_send_message.text);

    CollectionReference users = FirebaseFirestore.instance.collection(
      'message/India/public_chats',
    );

    users
        .add(
          {
            'sender_chat_user_id': widget.chat_user_id.toString(),
            'sender_name': widget.sender_name,
            'sender_gender': widget.sender_gender,
            'sender_firebase_id': firebase_auth.currentUser!.uid.toString(),
            'message': str_get_message.toString(),
            'time_stamp': DateTime.now().millisecondsSinceEpoch,
            'room': 'public',
            'type': 'text_message',
          },
        )
        .then(
          (value) =>
              // print("Message send successfully. Message id is =====>${value.id}"));
              // func_scroll_to_bottom(),

              func_check_scrolling(),
        )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }

// scroll to bottom
  func_scroll_to_bottom() {
    _needsScroll = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
  }

  // get receiver all values
  func_get_receiver_all_values(
    get_all_values,
  ) {
    print('push to ');
    // print('all values');
    // print(get_all_values);

    FocusScopeNode currentFocus = FocusScope.of(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrivateChatScreen(
          dict_get_all_value: get_all_values,
          str_login_user_chat_id: widget.chat_user_id,
          str_login_user_gender: widget.sender_gender,
          str_from_dialog: 'no',
        ),
      ),
    );
  }

  //
  func_image_alert_popup() {
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
              height: 180,
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
                      'You can only share pics in private room.',
                      style: TextStyle(
                        fontFamily: font_family_name,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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

  func_exit_app() {
    showDialog(
        context: context,
        useRootNavigator: false,
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
                      'Are you sure you want to exit public room ?',
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
                            onPressed: () => Navigator.of(context).pop(''),
                            // {
                            //   print('back 2');
                            //   Navigator.of(context).pop();

                            // },
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

  func_check_scrolling() {
    //
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      //
      if (kDebugMode) {
        print('==> scroll chat list <==');
      }
      _needsScroll = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
      //
    } else {
      if (kDebugMode) {
        print('do not scroll');
      }
    }
  }
}
