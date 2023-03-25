import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numeral_system/numeral_system.dart';

class Tips28 extends StatefulWidget {
  const Tips28({super.key});

  @override
  State<Tips28> createState() => _Tips28State();
}

class _Tips28State extends State<Tips28> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 28"),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "International",
              style: context.text.headline2!.copyWith(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            Center(
              child: NumeralSystem(
                numberSystem: NumberSystem.international,
                digit: 987387659876,
                //afterDecimalDigits: 3,
                textStyle: context.text.headline3!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily),
              ),
            ),
            NumeralSystem(
              numberSystem: NumberSystem.international,
              digit: 987387676,
              //afterDecimalDigits: 2,
              textStyle: context.text.headline3!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            NumeralSystem(
              numberSystem: NumberSystem.international,
              digit: 987376,
              //digitAfterDecimal: 1,
              textStyle: context.text.headline3!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Hindu- Arabic",
              style: context.text.headline2!.copyWith(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            NumeralSystem(
              numberSystem: NumberSystem.indian,
              digit: 9873876576,
              //afterDecimalDigits: 5,
              textStyle: context.text.headline3!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            NumeralSystem(
              numberSystem: NumberSystem.indian,
              digit: 9876576,
              //afterDecimalDigits: 5,
              textStyle: context.text.headline3!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            NumeralSystem(
              numberSystem: NumberSystem.indian,
              digit: 98876576,
              //afterDecimalDigits: 5,
              textStyle: context.text.headline3!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily),
            ),
          ]),
    );
  }
}
