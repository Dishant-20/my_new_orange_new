import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/feeds/feeds_details/feeds_details.dart';
import 'package:my_new_orange/classes/my_stories/edit_my_stories/edit_my_stories.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

class MyStoriesScreen extends StatefulWidget {
  const MyStoriesScreen({super.key});

  @override
  State<MyStoriesScreen> createState() => _MyStoriesScreenState();
}

class _MyStoriesScreenState extends State<MyStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(
        str_app_bar_title: 'My Stories',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Click your story to edit.',
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    for (int i = 0; i < snapshot.data!.docs.length; i++) ...[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditMyStoriesScreen(
                                str_feed_name: snapshot
                                    .data!.docs[i]['story_category_name']
                                    .toString(),
                                str_feed_description: snapshot
                                    .data!.docs[i]['story_description']
                                    .toString(),
                                str_feed_title: snapshot
                                    .data!.docs[i]['story_title']
                                    .toString(),
                                str_feed_id: snapshot
                                    .data!.docs[i]['firestore_id']
                                    .toString(),
                                str_hide_status: snapshot
                                    .data!.docs[i]['story_active_status']
                                    .toString(),
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            // height: 300,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.black,
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
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          //

                                          snapshot.data!.docs[i]['story_title']
                                              .toString(),
                                          //
                                          style: TextStyle(
                                            fontFamily: font_family_name,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          //
                                          snapshot.data!
                                              .docs[i]['story_category_name']
                                              .toString(),
                                          //
                                          style: TextStyle(
                                            fontFamily: font_family_name,
                                            fontSize: 14.0,
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                    right: 40,
                                  ),
                                  height: .3,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: const EdgeInsets.all(
                                    10.0,
                                  ),
                                  height: 120 - 10,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.transparent,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      //
                                      snapshot
                                          .data!.docs[i]['story_description']
                                          .toString(),
                                      //
                                      style: TextStyle(
                                        fontFamily: font_family_name,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                    right: 40,
                                  ),
                                  height: .3,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        // width: 120,

                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            (snapshot.data!.docs[i]['likedBy']
                                                    .contains(FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid))
                                                ? const Icon(
                                                    Icons.favorite,
                                                    color: Colors.blueAccent,
                                                  )
                                                : const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.blueAccent,
                                                  ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              //
                                              snapshot.data!
                                                  .docs[i]['story_like_count']
                                                  .toString(),
                                              //
                                              style: TextStyle(
                                                fontFamily: font_family_name,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        height: 30,
                                        width: .5,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        height: 50,
                                        // width: 120,

                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            const Icon(
                                              Icons.remove_red_eye,
                                              color: Colors.amber,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              //
                                              snapshot.data!
                                                  .docs[i]['story_view_count']
                                                  .toString(),
                                              //
                                              style: TextStyle(
                                                fontFamily: font_family_name,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
}
