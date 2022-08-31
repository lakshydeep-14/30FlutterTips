// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/tips1/tips1.dart';
import 'package:flutter_30_tips/tips2/userList.dart';
import 'package:flutter_30_tips/tips5/online.dart';
import 'package:get/get.dart';

final Color mainColor = Color(0xff8e412e);

final List<TIPS> tipsList = [
  TIPS(label: "1", title: "Search In Flutter", go: SearchScreen()),
  TIPS(
      label: "2",
      title: "Chatting with Firebase",
      go: UserList(
        tips: "2",
      )),
  TIPS(
      label: "3",
      title: "Chatting with Firebase Including Image",
      go: UserList(
        tips: "3",
      )),
  TIPS(
      label: "4",
      title: "Chatting with Firebase Including Voice",
      go: UserList(
        tips: "4",
      )),
  TIPS(label: "5", title: "Show User Online/offline", go: Online()),
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar("Flutter 30 Tips\nwith\nLakshydeep Vikram", back: false),
      body: ListView.separated(
        itemCount: tipsList.length,
        itemBuilder: (_, i) {
          return tips(tipsList[i].label!, tipsList[i].title!, tipsList[i].go!);
        },
        separatorBuilder: (_, i) {
          return Container(
            width: double.infinity,
            height: 2,
            color: mainColor.withOpacity(0.1),
          );
        },
      ),
    );
  }

  Widget tips(String label, String title, Widget go) {
    return ListTile(
      title: Text(
        "Flutter Tips $label",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
      trailing: Text(
        "FT $label",
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 28,
            color: mainColor.withOpacity(0.35)),
      ),
      subtitle: Text(
        title,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w900, color: mainColor),
      ),
      tileColor: mainColor.withOpacity(0.2),
      onTap: () => Get.to(go),
    );
  }
}

AppBar customAppBar(String title, {bool back = true}) {
  return AppBar(
      toolbarHeight: back ? 60 : 100,
      backgroundColor: mainColor,
      automaticallyImplyLeading: back,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
      ));
}

class TIPS {
  String? label, title;
  Widget? go;
  TIPS({this.go, this.label, this.title});
}
