// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/feeds/feeds_add/feeds_add.dart';
import 'package:my_new_orange/classes/feeds/feeds_details/feeds_details.dart';
import 'package:my_new_orange/classes/feeds/feeds_settings/feeds_settings.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  //
  @override
  void initState() {
    super.initState();
    func_feeds_timeline();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //
          'Feeds',
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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print('add');
              }
              push_to_mission_details(context);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print('settings');
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedsSettingsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('story/India/details')
              .where('story_active_status', isEqualTo: 'yes')
              .orderBy('time_stamp', descending: true)
              .limit(10)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text("Loading"));
            }
            if (snapshot.hasData) {
              if (kDebugMode) {
                print(' Yes, feeds in server');
                print(snapshot.data!.docs);
                // print(snapshot.data!.docs.length);
              }
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (int i = 0; i < snapshot.data!.docs.length; i++) ...[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeedsDetailsScreen(
                                str_feed_name: snapshot
                                    .data!.docs[i]['story_category_name']
                                    .toString(),
                                str_feed_description: snapshot
                                    .data!.docs[i]['story_description']
                                    .toString(),
                                str_feed_title: snapshot
                                    .data!.docs[i]['story_title']
                                    .toString(),
                                str_firestore_id: snapshot
                                    .data!.docs[i]['firestore_id']
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
                                            Text(
                                              'likes :',
                                              style: TextStyle(
                                                fontFamily: font_family_name,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            /*(snapshot.data!.docs[i]['likedBy']
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
                                                  ),*/
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
                                            Text(
                                              'views : ',
                                              style: TextStyle(
                                                fontFamily: font_family_name,
                                                fontSize: 16.0,
                                              ),
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
                                            /*const Icon(
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
                                            ),*/
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
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.brown,
              ),
            );
          }),
    );
  }

  Future<void> push_to_mission_details(
    BuildContext context,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FeedsAddScreen(),
      ),
    );

    print('result =====> $result');

    if (!mounted) return;
  }

  // feeds timeline
  func_feeds_timeline() {
    print('object');
  }

  // // set like
  // void like() async {
  //   try {
  //     var ref = FirebaseDatabase.instance.reference().child('path to likes for a post');
  //     await ref.once().then((data) async => {
  //       await ref.set(data.value + 1);
  //     });
  //   } catch (e) {
  //     print(e.message);
  //   }
  // }
}
