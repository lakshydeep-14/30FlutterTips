import 'package:flutter/material.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_widget/zoom_widget.dart';

class ZoomWid extends StatefulWidget {
  const ZoomWid({Key? key}) : super(key: key);

  @override
  State<ZoomWid> createState() => _ZoomWidState();
}

class _ZoomWidState extends State<ZoomWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 18"),
      body: Zoom(
        maxZoomWidth: 5 * MediaQuery.of(context).size.width,
        maxZoomHeight: 5 * MediaQuery.of(context).size.height,
        backgroundColor: Colors.white,
        colorScrollBars: mainColor,
        opacityScrollBars: 0.5,
        scrollWeight: 5.0,
        centerOnScale: true,
        enableScroll: true,
        doubleTapZoom: true,
        zoomSensibility: 2.3,
        //initZoom: 0.5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Follow",
                style: context.text.headline1,
              ),
              Text(
                " #30FlutterTipsWithLakshydeepVikram",
                style: context.text.headline1!
                    .copyWith(fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              Text(
                " #30FlutterTipsWithLakshydeepVikram",
                style: context.text.headline3!.copyWith(
                    color: mainColor.withOpacity(0.89),
                    fontFamily: GoogleFonts.sansita().fontFamily),
              ),
              Text(
                " #30FlutterTipsWithLakshydeepVikram",
                style: context.text.headline4,
              ),
              Text(
                " On",
                style: context.text.headline4,
              ),
              Text(
                "   GitHub   ",
                style: context.text.headline4!
                    .copyWith(fontFamily: GoogleFonts.newTegomin().fontFamily),
              ),
              Text(
                " Medium",
                style: context.text.headline4!
                    .copyWith(fontFamily: GoogleFonts.newTegomin().fontFamily),
              ),
              Text(
                " LinkedIN",
                style: context.text.headline4!
                    .copyWith(fontFamily: GoogleFonts.newTegomin().fontFamily),
              ),
              Text(
                " @lakshydeep-14",
                style: context.text.headline4!
                    .copyWith(fontFamily: GoogleFonts.newTegomin().fontFamily),
              ),
            ]),
      ),
    );
  }
}
