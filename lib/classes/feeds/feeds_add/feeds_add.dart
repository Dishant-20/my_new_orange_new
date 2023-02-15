// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:uuid/uuid.dart';

class FeedsAddScreen extends StatefulWidget {
  const FeedsAddScreen({super.key});

  @override
  State<FeedsAddScreen> createState() => _FeedsAddScreenState();
}

class _FeedsAddScreenState extends State<FeedsAddScreen> {
  //
  final _formKey = GlobalKey<FormState>();

//

  FirebaseAuth firebase_auth = FirebaseAuth.instance;
//
  var str_save_and_continue_loader = '0';
//
  late final TextEditingController cont_title;
  late final TextEditingController cont_category;
  late final TextEditingController cont_description;
  //
  @override
  void initState() {
    super.initState();
    //
    cont_title = TextEditingController();
    cont_category = TextEditingController();
    cont_description = TextEditingController();
  }

  // @override
  // void dispose() {
  //   //
  //   cont_title.dispose();
  //   cont_category.dispose();
  //   cont_description.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //
          'Create Your Story',
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
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
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
                  maxLines: 8,
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
                      func_save_story_to_XMPP();
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

  //
  func_save_story_to_XMPP() {
    setState(() {
      str_save_and_continue_loader = '1';
    });
    CollectionReference users = FirebaseFirestore.instance.collection(
      'story/India/details',
    );

    users
        .add(
          {
            'feed_id': const Uuid().v4(),
            'story_creator_id': firebase_auth.currentUser!.uid.toString(),
            'story_category_name': cont_category.text.toString(),
            'story_title': cont_title.text.toString(),
            'story_description': cont_description.text.toString(),
            'story_image': '',
            'story_like_count': '0'.toString(),
            'story_view_count': '0'.toString(),
            'story_comment_count': '0'.toString(),
            'story_active_status': 'yes'.toString(),
            'time_stamp': DateTime.now().millisecondsSinceEpoch,
            'likedBy': [],
            'viewBy': [],
          },
        )
        .then(
          (value) => setState(() {
            // print(value.id);

            FirebaseFirestore.instance
                .collection('story')
                .doc('India')
                .collection('details')
                .doc(value.id)
                .set(
              {
                'firestore_id': value.id,
              },
              SetOptions(merge: true),
            ).then(
              (value) {
                //Do your stuff.
                str_save_and_continue_loader = '1';
                Navigator.pop(context);
              },
            );
          }),
        )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }
}
