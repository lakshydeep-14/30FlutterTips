import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_30_tips/home.dart';

class Online extends StatefulWidget {
  const Online({Key? key}) : super(key: key);

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    setStatus(true);
  }

  void setStatus(bool status) async {
    await FirebaseFirestore.instance
        .collection('chat')
        .doc('9JkY7nEu5nyPQP15P67v')
        .update({"online": status});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setStatus(true);
    } else {
      setStatus(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 5"),
        body: Center(
            child: Text(
          "Online",
          style: TextStyle(color: Colors.black),
        )));
  }
}
