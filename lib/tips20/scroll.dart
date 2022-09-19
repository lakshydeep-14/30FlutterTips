// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

import 'package:flutter_30_tips/home.dart';

class ScrollWidget extends StatefulWidget {
  const ScrollWidget({Key? key}) : super(key: key);

  @override
  State<ScrollWidget> createState() => _ScrollWidgetState();
}

class _ScrollWidgetState extends State<ScrollWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    leadingWidth: 0,
                    pinned: true,
                    expandedHeight: 250,
                    backgroundColor: Colors.white,
                    toolbarHeight: 90,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1.0,
                      titlePadding: EdgeInsets.zero,
                      title: Container(
                        color: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        height: 85,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 74,
                              width: 74,
                              child: Image.asset(
                                "assets/tips20.png",
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tips 20",
                                  style: context.text.headline4!
                                      .copyWith(fontSize: 40),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      background: Image.asset(
                        "assets/tips20.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )),
              ];
            },
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                Image.asset(
                  "assets/tips20.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Text(
                  "Follow",
                  style: context.text.headline2!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "#30FlutterTips",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "@lakshydeep-14",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "on",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "Medium",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "YouTube",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "GitHub",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "LinkedIn",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text(
                    "Thanks",
                    style: context.text.headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            )));
  }
}
