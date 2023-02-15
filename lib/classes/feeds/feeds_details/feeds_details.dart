// ignore_for_file: non_constant_identifier_names

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
// import 'package:my_new_orange/header/utils/custom/app_bar.dart';

class FeedsDetailsScreen extends StatefulWidget {
  const FeedsDetailsScreen(
      {super.key,
      required this.str_feed_name,
      required this.str_feed_title,
      required this.str_feed_description,
      required this.str_firestore_id});

  // final String str_total_likes_count;
  final String str_firestore_id;
  final String str_feed_name;
  final String str_feed_title;
  final String str_feed_description;

  @override
  State<FeedsDetailsScreen> createState() => _FeedsDetailsScreenState();
}

class _FeedsDetailsScreenState extends State<FeedsDetailsScreen> {
  //
  var str_already_like = 'no';
  var str_heart_ui = '';
  //
  @override
  void initState() {
    super.initState();
    func_feeds_details();
  }

//
  func_feeds_details() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('story/India/details')
        .where('firestore_id', isEqualTo: widget.str_firestore_id.toString())
        .where('likedBy', arrayContainsAny: [
      // '1'
      FirebaseAuth.instance.currentUser!.uid,
    ]).get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      print('======> ALREADY LIKE <========');
      str_heart_ui = '1';
      setState(() {});
      return;
    }
    str_heart_ui = '0';
    setState(() {});
    print('=====> USER NOT LIKE THIS FEED');
  }

  func_like_dislike_XMPP() {
    print('me click');
    print(widget.str_firestore_id.toString());
    FirebaseFirestore.instance
        .collection('story/India/details')
        .where('firestore_id', isEqualTo: widget.str_firestore_id.toString())
        .where('likedBy', arrayContainsAny: [
          FirebaseAuth.instance.currentUser!.uid,
        ])
        .get()
        .then((querySnapshot) {
          for (var element in querySnapshot.docs) {
            // str_already_like = 'yes';
            print(element.data());
            print('=====> USER ALREADY LIKE THIS FEED <======');
            //
            str_already_like = 'yes';
            //
            func_get_data_after_press_like_XMPP(
                widget.str_firestore_id.toString());
            return;
          }
          //
          str_already_like = 'no';
          //
          func_get_data_after_press_like_XMPP(
              widget.str_firestore_id.toString());
          return;
        });
  }

  func_get_data_after_press_like_XMPP(
    String str_firestore_id,
  ) {
    FirebaseFirestore.instance
        .collection('story/India/details')
        .where('firestore_id', isEqualTo: str_firestore_id)
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        print('=====> GET ALL DATA');
        print(element.data());

        if (str_already_like == 'yes') {
          // minus one like
          var str_get_total_likes =
              element.data()['story_like_count'].toString();
          var final_likes_total = int.parse(str_get_total_likes) - 1;
          // print(final_likes_total);

          func_minus_one_more_like_XMPP(
            str_firestore_id,
            final_likes_total.toString(),
          );
        } else {
          // add one like
          var str_get_total_likes =
              element.data()['story_like_count'].toString();
          var final_likes_total = int.parse(str_get_total_likes) + 1;
          // print(final_likes_total);

          func_add_one_more_like_XMPP(
            str_firestore_id,
            final_likes_total.toString(),
          );
        }
      }
    });
  }

// add one like
  func_add_one_more_like_XMPP(
    String str_element_id,
    String str_like_counter,
    // String str_
  ) async {
    // print('=====> ADD ONE LIKE METHOD CALLED');
    await FirebaseFirestore.instance
        .collection('story')
        .doc('India')
        .collection('details')
        .doc(str_element_id.toString())
        .update(
      {
        'likedBy': [FirebaseAuth.instance.currentUser!.uid],
        'story_like_count': str_like_counter.toString()
      },
    );

    str_heart_ui = '1';
    setState(() {});
  }

  func_minus_one_more_like_XMPP(
    String str_element_id,
    String str_like_counter,
    // String str_
  ) async {
    print('=====> REMOVE ONE LIKE METHOD CALLED');
    print(str_like_counter);
    print(str_element_id);
    print('=====> REMOVE ONE LIKE METHOD CALLED');
    await FirebaseFirestore.instance
        .collection('story')
        .doc('India')
        .collection('details')
        .doc(str_element_id.toString())
        .update(
      {
        'likedBy': FieldValue.arrayRemove(
          [FirebaseAuth.instance.currentUser!.uid.toString()],
        ),
        'story_like_count': str_like_counter.toString()
      },
    );

    str_heart_ui = '0';
    setState(() {});
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.str_feed_name.toString(),
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
        backgroundColor: const Color.fromRGBO(112, 202, 248, 1),
        actions: [
          (str_heart_ui == '0')
              ? IconButton(
                  onPressed: () {
                    func_like_dislike_XMPP();
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    func_like_dislike_XMPP();
                  },
                  icon: const Icon(
                    Icons.favorite,
                  ),
                )
        ],
      ),
      // AppBarScreen(
      //   str_app_bar_title: widget.str_feed_name.toString(),
      //   str_status: '1',
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 0,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
              ),
              // height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.black,
                  width: .5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  //
                  widget.str_feed_title.toString(),
                  //
                  style: TextStyle(
                    fontFamily: font_family_name,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // description
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 20,
                bottom: 40,
                right: 20,
              ),
              // height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.black,
                  width: .5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  //
                  widget.str_feed_description.toString(),
                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  //
                  style: TextStyle(
                    fontFamily: font_family_name,
                    fontSize: 16.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
