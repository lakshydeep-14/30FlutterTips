import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class Home extends StatefulWidget {
  final String text;
  const Home({super.key, required this.text});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => Tab1(text: widget.text))),
            child: Text(
              widget.text,
              style: context.text.headline3,
            )),
      ),
    );
  }
}

class Tab1 extends StatefulWidget {
  final String text;
  const Tab1({super.key, required this.text});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(""),
      body: Center(
          child: Text(
        "Inside " + widget.text,
        style: context.text.headline3,
      )),
    );
  }
}
