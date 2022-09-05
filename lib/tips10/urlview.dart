// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncherWid extends StatefulWidget {
  const URLLauncherWid({Key? key}) : super(key: key);

  @override
  State<URLLauncherWid> createState() => _URLLauncherWidState();
}

class _URLLauncherWidState extends State<URLLauncherWid> {
  // for opening url
  void profile(String host) async {
    Uri url = Uri.parse(host);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
      );
    } else {
      throw "Can't launch link";
    }
  }

  //for call
  void call() async {
    Uri url = Uri(scheme: 'tel', path: '+9779801234567');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Can't launch call";
    }
  }

  //for sending mail
  void mail() async {
    Uri url = Uri(scheme: 'mailto', path: "lvikramsah@gmail.com");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Can't launch mail";
    }
  }

  //for sending message
  void msg() async {
    Uri url = Uri(scheme: 'sms', path: "+9779801234567");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Can't launch message";
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
              child: IconButton(
                  onPressed: () => call(),
                  icon: Icon(
                    Icons.call,
                    color: mainColor,
                  )),
            ),
            Center(
              child: IconButton(
                  onPressed: () => mail(),
                  icon: Icon(
                    Icons.email,
                    color: mainColor,
                  )),
            ),
            Center(
              child: IconButton(
                  onPressed: () => msg(),
                  icon: Icon(
                    Icons.message,
                    color: mainColor,
                  )),
            ),
            Center(
              child: IconButton(
                  onPressed: () =>
                      profile('https://www.github.com/lakshydeep-14/'),
                  icon: Icon(
                    FontAwesomeIcons.github,
                    color: mainColor,
                  )),
            ),
            Center(
              child: IconButton(
                  onPressed: () =>
                      profile('https://www.linkedin.com/in/lakshydeep-14/'),
                  icon: Icon(
                    FontAwesomeIcons.linkedin,
                    color: mainColor,
                  )),
            ),
            Center(
              child: IconButton(
                  onPressed: () => profile('https://lakshydeep-14.medium.com'),
                  icon: Icon(
                    FontAwesomeIcons.medium,
                    color: mainColor,
                  )),
            ),
            Center(
              child: IconButton(
                  onPressed: () =>
                      profile('https://github.com/lakshydeep-14/30FlutterTips'),
                  icon: Icon(
                    Icons.link,
                    color: mainColor,
                  )),
            )
          ]),
    );
  }
}
