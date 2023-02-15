// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/feeds/feeds.dart';
import 'package:my_new_orange/classes/set_name/online_chat_entry.dart';
import 'package:my_new_orange/classes/settings/settings.dart';
// import 'package:my_new_orange/classes/feeds/feeds.dart';
// import 'package:my_new_orange/classes/set_name/online_chat_entry.dart';
// import 'package:my_new_orange/classes/settings/settings.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
// import 'package:my_new_orange/header/utils/custom/app_bar.dart';

import 'package:flutter_gif/flutter_gif.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class HomeScreenScreen extends StatefulWidget {
  const HomeScreenScreen({super.key});

  @override
  State<HomeScreenScreen> createState() => _HomeScreenScreenState();
}

class _HomeScreenScreenState extends State<HomeScreenScreen>
    with TickerProviderStateMixin {
  //
  // late FToast fToast;
  //
  var arr_home_list = [];
  //
  late FlutterGifController controller1;
  //
  @override
  void initState() {
    super.initState();

    /*Fluttertoast.showToast(
        msg: "This is a Toast message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);*/

    /*controller1 = FlutterGifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller1.repeat(
        min: 0,
        max: 46,
        period: const Duration(milliseconds: 2500),
      );
    });*/

    arr_home_list = [
      {
        'id': '1',
        'title': 'Chat',
        'image': 'assets/gif/chat.png',
      },
      {
        'id': '2',
        'title': 'Stories',
        'image': 'assets/gif/stories.png',
      },
      {
        'id': '3',
        'title': 'Settings',
        'image': 'assets/gif/settings.png',
      },
    ];
    if (kDebugMode) {
      print('length ===> ' + arr_home_list.length.toString());
    }
    setState(() {});
    // fToast = FToast();
    // fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        /*appBar: AppBarScreen(
          str_app_bar_title: 'Home',
          str_status: '0',
        ),*/
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 60.0,
                bottom: 0,
              ),
              color: Colors.transparent,
              // width: 48.0,
              height: 48.0,
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: font_family_name,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.settings,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 40, top: 40.0),
                  color: Colors.transparent,
                  width: 24.0,
                  height: 24.0,
                  child: Image.asset(
                    'assets/gif/music.png',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 40, left: 40, top: 40.0),
                  color: Colors.transparent,
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/gif/link.png',
                  ),
                ),
              ],
            ),
            //
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  // height: 48.0,
                  child: Image.asset('assets/gif/logo_3.png'),
                ),
              ),
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: 40, top: 40.0, bottom: 40),
                  color: Colors.transparent,
                  width: 38.0,
                  height: 38.0,
                  child: Image.asset(
                    'assets/gif/ice-cream.png',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      right: 40, left: 40, top: 40.0, bottom: 40),
                  color: Colors.transparent,
                  width: 38.0,
                  height: 38.0,
                  child: Image.asset(
                    'assets/gif/chat2.png',
                  ),
                ),
              ],
            ),
            //
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: app_blue_color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    52,
                  ),
                  topRight: Radius.circular(
                    52,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 80.0,
                              right: 5,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                14,
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
                            // width: 48.0,
                            height: 110.0,
                            child: Align(
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                color: Colors.transparent,
                                width: 66.0,
                                height: 66.0,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OnlineChatEntryScreen(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    'assets/gif/chat.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              func_image_alert_popup();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const FeedsScreen(),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                top: 80.0,
                                right: 10,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  14,
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
                              // width: 48.0,
                              height: 110.0,
                              child: Align(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Colors.transparent,
                                  width: 66.0,
                                  height: 66.0,
                                  child: Image.asset('assets/gif/stories.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                    // 2
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              top: 10.0,
                              right: 5,
                            ),

                            decoration: BoxDecoration(
                              // color: const Color.fromRGBO(96, 190, 248, 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                14,
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
                            // width: 48.0,
                            height: 40,
                            child: Align(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OnlineChatEntryScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Colors.transparent,
                                  width: 66.0,
                                  height: 66.0,
                                  child: text_with_regular_style(
                                    'Chat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              func_image_alert_popup();
                              /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const FeedsScreen(),
                                ),
                              );*/
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                top: 10.0,
                                right: 10,
                              ),

                              decoration: BoxDecoration(
                                // color: Colors.brown,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  14,
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
                              // width: 48.0,
                              height: 40,
                              child: Align(
                                child: Container(
                                  margin: const EdgeInsets.all(10.0),
                                  color: Colors.transparent,
                                  // width: ,
                                  height: 66.0,
                                  child: text_with_regular_style(
                                    'Stories ( soooon )',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //
                      ],
                    ),
                  ],
                ),
              ),
              /*child: Column(
                children: [
                  Expanded(
                    child: Container(
                      // width: 200,
                      height: 300,
                      color: Colors.pink,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // width: 200,
                      height: 300,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),*/
              /*GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  // childAspectRatio: 2 / 2,
                  // crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemCount: arr_home_list.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const OnlineChatEntryScreen(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedsScreen(),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 300,
                      color: Colors.pink,
                    ),

                    /*Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 251, 249, 249),
                            Color.fromARGB(255, 251, 245, 245),
                            Color.fromARGB(255, 250, 240, 240),
                            Color.fromARGB(255, 218, 208, 208),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                // height: 80,
                                width: 100,
                                color: Colors.transparent,
                                child: Image.asset(
                                    arr_home_list[index]['image'].toString())
                                /*GifImage(
                              controller: controller1,
                              image: AssetImage(
                                //
                                arr_home_list[index]['image'],
                                //
                              ),
                            ),*/
                                ),
                          ),
                          Container(
                            height: 40,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                //
                                arr_home_list[index]['title'],
                                //
                                style: TextStyle(
                                  fontFamily: font_family_name,
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  );
                },
              ),*/
            ),

            /*Container(
              color: Colors.amber,
              margin: const EdgeInsets.all(
                10.0,
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemCount: arr_home_list.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnlineChatEntryScreen(),
                          ),
                        );
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedsScreen(),
                          ),
                        );
                      } else if (index == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 251, 249, 249),
                            Color.fromARGB(255, 251, 245, 245),
                            Color.fromARGB(255, 250, 240, 240),
                            Color.fromARGB(255, 218, 208, 208),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                                // height: 80,
                                width: 100,
                                color: Colors.transparent,
                                child: Image.asset(
                                    arr_home_list[index]['image'].toString())
                                /*GifImage(
                                controller: controller1,
                                image: AssetImage(
                                  //
                                  arr_home_list[index]['image'],
                                  //
                                ),
                              ),*/
                                ),
                          ),
                          Container(
                            height: 40,
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                //
                                arr_home_list[index]['title'],
                                //
                                style: TextStyle(
                                  fontFamily: font_family_name,
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  //
  func_exit_public_chat() {}

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
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text_with_bold_style(
                      //
                      'Stories (Coming Soon)',
                      //
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    text_with_regular_style(
                        '''- You can Share or Express your fellings to anyone without revelling your identity.
                    \n- No one will get to know about yourself without your concern.
                       '''),
                    // Text(
                    //   '''- You can Share or Express your fellings to anyone without revelling your identity.
                    //   \n- No one will get to know about yourself without your concern.
                    //   ''',
                    //   style: TextStyle(
                    //     fontFamily: font_family_name,
                    //     fontSize: 16,
                    //   ),
                    // ),
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
}
