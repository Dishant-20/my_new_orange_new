import 'package:flutter/material.dart';
import 'package:my_new_orange/classes/my_stories/edit_my_stories/my_stories_hide_unhide/hide_unhide_my_stories.dart';
import 'package:my_new_orange/classes/my_stories/my_stories.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
import 'package:my_new_orange/header/utils/custom/app_bar.dart';

class FeedsSettingsScreen extends StatefulWidget {
  const FeedsSettingsScreen({super.key});

  @override
  State<FeedsSettingsScreen> createState() => _FeedsSettingsScreenState();
}

class _FeedsSettingsScreenState extends State<FeedsSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(
        str_app_bar_title: 'Settings',
        str_status: '1',
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyStoriesScreen(),
                ),
              );
            },
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  child: Image.asset(
                    //
                    'assets/gif/stories.png',
                    //
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    //
                    // arr_setting_list[i]['title'].toString(),
                    'My Stories',
                    //
                    style: TextStyle(
                      fontFamily: font_family_name,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: .5,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          // 2
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedsHideUnhideScreen(),
                ),
              );
            },
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  child: Image.asset(
                    //
                    'assets/gif/eye.png',
                    //
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    //
                    // arr_setting_list[i]['title'].toString(),
                    'Hide / Unhide your stories',
                    //
                    style: TextStyle(
                      fontFamily: font_family_name,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: .5,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
