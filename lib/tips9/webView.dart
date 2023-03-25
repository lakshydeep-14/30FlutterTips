import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips9/wid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WebViewWid extends StatefulWidget {
  const WebViewWid({Key? key}) : super(key: key);

  @override
  State<WebViewWid> createState() => _WebViewWidState();
}

class _WebViewWidState extends State<WebViewWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 9"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _wid(
                url: "https://lakshydeep-14.medium.com",
                label: "Medium",
                icon: FontAwesomeIcons.medium),
            _wid(
                url: "https://linkedin.com/in/lakshydeep-14",
                label: "LinkedIN",
                icon: FontAwesomeIcons.linkedin),
            _wid(
                url: "https://github.com/lakshydeep-14",
                label: "GitHub",
                icon: FontAwesomeIcons.github),
          ],
        ));
  }

  Widget _wid({String? url, IconData? icon, String? label}) {
    return Center(
      child: TextButton.icon(
          onPressed: () {
            Get.to(Wid(
              url: url!,
            ));
          },
          icon: Icon(
            icon,
            color: mainColor,
          ),
          label: Text(label!)),
    );
  }
}
