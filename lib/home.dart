// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_30_tips/tips1.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff8e412e),
          centerTitle: true,
          title: Text(
            "Flutter 30 Tips",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )),
      body: ListView(children: [
        ListTile(
          title: Text("Tips 1"),
          tileColor: Color(0xff8e412e).withOpacity(0.2),
          onTap: () => Get.to(SearchScreen()),
        )
      ]),
    );
  }
}
