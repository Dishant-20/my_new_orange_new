// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_new_orange/header/utils/Utils.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  //
  String str_project_name = 'My Orange';
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
          style: TextStyle(
            fontFamily: font_family_name,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            // https://www.chatkaro.in/pages/disclaimers-3/
            children: <Widget>[
              const Text(
                'Terms of use\n',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- By using the $str_project_name. you agree to be bound by these Terms of Use, whether or not you register as a member you are solely responsible for any materials (including profiles or photos) and messages (including $str_project_name.in personal user messages PUB messages and private messages Whispers) (collectively, Content) that you publish or display (hereinafter, post) on the app or via the Service, or transmit to other Members. You must use the Website and the Service in a manner consistent with any and all applicable laws and regulations.You must not try to circumvent the $str_project_name rules and regulations, if you are banned by a $str_project_name administrator you shall not use proxy servers to evade your ban, doing so may lead to permanent banning.You may not include in your Member profile any telephone numbers, street addresses, last names, URLs or email addresses. Doing so may result in your information being handed over to local and international authorities.\n\n',
                style: const TextStyle(
                  fontFamily: 'Avenir',
                ),
              ),
              const Text(
                'Reasons for being banned\n',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'There are many reasons why you may have been banned. It could be for being disruptive, disrespectful, name calling, spamming, advertising. $str_project_name bans are not permanent in most cases, so please learn from the mistake and try to use the site appropriately when your ban expires.\n\n\n\n',
                style: const TextStyle(
                  fontFamily: 'Avenir',
                ),
              ),
              //3
              const Text(
                'WARNINGS & DISCLAIMERS:\n',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1. To use $str_project_name  must be 18+ or older.\n\n'
                '2. $str_project_name will take strict action if vulgar language heard within chat rooms and attacks on another person’s race, religion, national origin, sexual orientation or gender.\n\n'
                '3. $str_project_name will take action if any user found doing harassing, flood, spam and abuse within chat rooms. and $str_project_name cannot guarantee that there will not be persons within chat rooms who use lewd, vulgar,insulting,profane,racist or sexual language.'
                '4. $str_project_name Chat karo will provide user data to cyber cell police  if any user Posting bad messages on any religion or any illegal activity found by the user under as per the indian law IT ACT 2000.\n\n'
                '5. $str_project_name It is possible that other Members or users (including unauthorized users, or hackers) may post or transmit offensive or obscene materials on the Website and that you may be involuntarily exposed to such offensive and obscene materials. It also is possible for others to obtain personal information about you due to your use of the Service, and that the recipient may use such information to harass or injure you. $str_project_name is not liable for the use of any personal information that you may choose to disclose on the Service. Please carefully select the type of information that you post on the Service or release to others.\n\n'
                '6. $str_project_name cannot guarantee and does not promise or liable for any incorrect or inaccurate Content posted on the Website or in connection with the Service, whether caused by users of the Website, Members or by any of the equipment or programming associated with or utilized in the Website or the Service and $str_project_name is not liable for the conduct, whether online or offline, of any user of the Website or Member of the Service.\n\n'
                '7. $str_project_name We assume no responsible for any problems or technical malfunction of any telephone network or lines, computer online systems, servers or providers, computer equipment, software, failure of email or players on account of technical problems or traffic congestion on the Internet or at the Website, including injury or damage to users and/or Members or to any other person’s computer related to or resulting from participating or downloading materials in connection with the Website or in connection with the Service., $str_project_name is not liable for any results coming from information received or people met in chat rooms and what users say and hear in chat rooms & $str_project_name does not guarantee and does not promise or liable for any error, omission, interruption, deletion, defect, delay in operation or transmission, communications line failure, theft or destruction or unauthorized access to, or alteration of, user or Member communications.\n\n'
                '8. $str_project_name Strictly Prohibited activity:  Distributing or Circulating or Sharing fake or even real phone numbers or Sharing fake or even real Email ids are strictly prohibited in the website or within the chat.\n\n'
                '8. $str_project_name You will be fully Responsible if you are making a phone calls or messaging (via any mode of communication like cell phone,gmail,hotmail,hangout,whatsapp etc..) on fake or even real phone numbers,Email or any type of contact mark etc.. by taking numbers/email-ids/Url/any type of contact mark from the website’s/app logged-in users or guests users within the chat. [In Simple way Do not contact people outside the website or app by taking any type of communication mark/contact details from logged-in users/guests login. because its prohibited activity as per our site rules.\n\n'
                '9. $str_project_name will take very strict action & user will be banned on Racism Post or  very bad messages/comments on any religion"s or found doing any illegal activity, under as per the indian laws and IT ACT 2000.\n\n'
                '10. $str_project_name We never ask/demand for any money through our website/app by any mode of payment. So, send/transfer money is strictly prohibited on our website/app.\n\n'
                '11. $str_project_name We DO NOT accept/demand any money from our users, Neither do we allow/encourage our users. to use our platform for monetary transactions by any means. we will not be held liable for any money transfers done between users. Use of our platform for money transfers by any means is strictly PROHIBITED.\n\n'
                '12. $str_project_name THE WEBSITE AND THE SERVICE ARE PROVIDED “AS-IS” AND $str_project_name EXPRESSLY DISCLAIMS ANY WARRANTIES OF MERCHANT ABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT, OR THAT THE WEBSITE OR THE SERVICE WILL BE UNINTERRUPTED OR ERROR-FREE.\n\n'
                '13. $str_project_name cannot guarantee and does not promise any specific results from use of the Website and/or the Service.\n\n',
              ),
              const Text(
                'LEGAL:\n',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'By accessing this Website or App and using our services you consent to these terms and conditions and to the exclusive jurisdiction of the Indian courts at Delhi in all disputes arising out of such access. $str_project_name will provide user data only to cyber cell police with CRPC Sections,  or Law enforcement agencies, if any user Posting bad messages on any religion or any illegal activity found by the user under as per the indian law  IT ACT 2000.\n\n\n\n',
              ),
              const Text(
                'Limitation on Liability:\n',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'You assume full responsibility and risk for your use of the Project and the Service. Under no circumstances will $str_project_name be liable for any loss or damage, including personal injury or death, resulting from anyone’s use of the Website or the Service, any Content posted on the Website or transmitted to Members, or any interactions between users of the Website, whether online or offline. $str_project_name is not liable to you.\n\n\n\n If you do not agree with any of our disclaimers mentioned with the terms of use of the services above and if do not abide indian laws IT ACT 2000, Then leave the website immediately.Terms and Conditions/Terms of Service/Site Disclaimers ("Terms") Last updated: Oct 25, 2016',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
