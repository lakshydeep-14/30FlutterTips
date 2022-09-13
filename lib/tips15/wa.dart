// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class WhatsAppChat extends StatefulWidget {
  const WhatsAppChat({Key? key}) : super(key: key);

  @override
  State<WhatsAppChat> createState() => _WhatsAppChatState();
}

class _WhatsAppChatState extends State<WhatsAppChat> {
  //edit groupLink and numberWithCode firsr
  String groupLink = ""; //https://chat.whatsapp.com/HMudsgtHEzS7xLmHrN8El/
  String numberWithCode = ""; //https://wa.me/9779812345678/
  void wa(String host) async {
    Uri url =
        Uri.parse("$host?text=Follow 30FlutterTips With Lakshydeep Vikram");
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw "Can't launch link";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 10"),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "WhatsApp Number",
                style: context.text.headline2!,
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () => wa(numberWithCode),
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: mainColor,
                  )),
            ),
            Center(
              child: Text(
                "WhatsApp Group",
                style: context.text.headline2!,
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () => wa(groupLink),
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: mainColor,
                  )),
            ),
            Center(
              child: Text(
                "WhatsApp Any",
                style: context.text.headline2!,
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () => wa('https://wa.me/'),
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: mainColor,
                  )),
            ),
            Center(
              child: Text(
                "Share Message/link to Group",
                style: context.text.headline2!,
              ),
            ),
            Center(
              child: IconButton(
                  onPressed: () async {
                    final box = context.findRenderObject() as RenderBox?;
                    await Share.share(
                      "text",
                      subject: "subject",
                      sharePositionOrigin:
                          box!.localToGlobal(Offset.zero) & box.size,
                    );
                  },
                  icon: Icon(
                    FontAwesomeIcons.share,
                    color: mainColor,
                  )),
            ),
          ]),
    );
  }
}
