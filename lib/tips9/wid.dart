import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Wid extends StatefulWidget {
  final String url;
  const Wid({Key? key, required this.url}) : super(key: key);

  @override
  State<Wid> createState() => _WidState();
}

class _WidState extends State<Wid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 9"),
        body: WebView(
          initialUrl: widget.url,
        ));
  }
}
