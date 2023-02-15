// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/my_stories/edit_my_stories/edit_my_stories.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

class FeedsHideUnhideScreen extends StatefulWidget {
  const FeedsHideUnhideScreen({super.key});

  @override
  State<FeedsHideUnhideScreen> createState() => _FeedsHideUnhideScreenState();
}

class _FeedsHideUnhideScreenState extends State<FeedsHideUnhideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(
        str_app_bar_title: 'Hide / Unhide',
        str_status: '1',
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('story/India/details')
              .where('story_creator_id',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid.toString())
              .orderBy('time_stamp', descending: true)
              .limit(20)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text(
                  "Loading",
                ),
              );
            }
            if (snapshot.hasData) {
              if (kDebugMode) {
                print(' Yes, feeds in server');
                // print(snapshot.data!.docChanges);
              }
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (int i = 0; i < snapshot.data!.docs.length; i++) ...[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                // height: 300,
                                // width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: .5,
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10,
                                        top: 10,
                                      ),
                                      // height: 80,
                                      // width: MediaQuery.of(context).size.width,
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              //

                                              snapshot
                                                  .data!.docs[i]['story_title']
                                                  .toString(),
                                              //
                                              style: TextStyle(
                                                fontFamily: font_family_name,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      height: 1,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Hidden',
                                                style: TextStyle(
                                                  fontFamily: font_family_name,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (snapshot.data!
                                                .docs[i]['story_active_status']
                                                .toString() ==
                                            'no')
                                          InkWell(
                                            onTap: () {
                                              func_hide_unhide_my_story(
                                                'yes',
                                                snapshot.data!
                                                    .docs[i]['firestore_id']
                                                    .toString(),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                right: 20.0,
                                              ),
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.red[400],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20.0,
                                                ),
                                              ),
                                              child: Align(
                                                child: Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        font_family_name,
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        else
                                          InkWell(
                                            onTap: () {
                                              func_hide_unhide_my_story(
                                                'no',
                                                snapshot.data!
                                                    .docs[i]['firestore_id']
                                                    .toString(),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                right: 20.0,
                                              ),
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.green[400],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20.0,
                                                ),
                                              ),
                                              child: Align(
                                                child: Text(
                                                  'No',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        font_family_name,
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                      ),
                    ],
                  ],
                ),
              );
            } else {
              const Center(
                child: Text(
                  'Internet Issue. Please check your Internet connection.',
                ),
              );
            }
            return Column(
              children: [
                Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                ),
              ],
            );
          }),
    );
  }

  // hide unhide
  // edit story in XMPP Server
  func_hide_unhide_my_story(String str_status, String firestore_id) {
    FirebaseFirestore.instance
        .collection('story')
        .doc('India')
        .collection('details')
        .doc(firestore_id.toString())
        .set(
      {
        'story_active_status': str_status.toString(),
      },
      SetOptions(merge: true),
    ).then(
      (value) {
        //Do your stuff.
        if (kDebugMode) {
          print('=====> STORY SUCCESSFULLY UPDATED <=====');
        }
        /*setState(() {
          // str_save_and_continue_loader = '0';
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
        });*/
      },
    );
  }
}
