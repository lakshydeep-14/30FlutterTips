import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 8"),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Follow",
          style: context.text.headline1,
        ),
        Text(
          " #30FlutterTipsWithLakshydeepVikram",
          style: context.text.headline2!
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
    );
  }
}

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get text => theme.textTheme;
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
}
