import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class LayoutBuilderScreen extends StatefulWidget {
  const LayoutBuilderScreen({super.key});

  @override
  State<LayoutBuilderScreen> createState() => _LayoutBuilderScreenState();
}

class _LayoutBuilderScreenState extends State<LayoutBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, size) {
        if (size.maxWidth >= 320 && size.maxWidth <= 480) {
          return Column(
            children: [
              Expanded(child: _box("Flutter", Colors.red)),
              Flexible(child: _box("Meetup", Colors.orange)),
              _screen("Mobile")
            ],
          );
        } else if (size.maxWidth >= 481 && size.maxWidth <= 1024) {
          return Column(
            children: [
              Row(children: [
                Expanded(child: _box("Flutter", Colors.red)),
                Flexible(child: _box("Meetup", Colors.orange)),
              ]),
              _screen("Tab")
            ],
          );
        } else if (size.maxWidth >= 1025 && size.maxWidth <= 1200) {
          return Column(
            children: [
              Row(children: [
                Expanded(child: _box("Flutter", Colors.red)),
                Flexible(child: _box("Meetup", Colors.orange)),
              ]),
              _screen("Desktop")
            ],
          );
        } else {
          return Column(
            children: [
              Row(children: [
                Expanded(child: _box("Flutter", Colors.red)),
                Flexible(child: _box("Meetup", Colors.orange)),
              ]),
              _screen("Large Screen")
            ],
          );
        }
      }),
    );
  }

  Widget _box(String label, Color color) {
    return Container(
      width: double.maxFinite,
      height: 200,
      color: color,
      child: Center(child: Text(label)),
    );
  }

  Widget _screen(String label) {
    return Center(
      child: Text(
        label,
        style: context.text.headline1!.copyWith(fontSize: 30, color: mainColor),
      ),
    );
  }
}
