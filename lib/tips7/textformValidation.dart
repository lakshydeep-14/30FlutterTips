// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_30_tips/home.dart';

class TextFormValidation extends StatefulWidget {
  const TextFormValidation({Key? key}) : super(key: key);

  @override
  State<TextFormValidation> createState() => _TextFormValidationState();
}

class _TextFormValidationState extends State<TextFormValidation> {
  String? requiredText(
    String? value, {
    String message = 'Type \"#30flutterTips\"',
  }) {
    if (value == null || value.trim().isEmpty || value != "#30flutterTips") {
      return message;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 7"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => requiredText(value),
            cursorHeight: 36,
            style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: Colors.black),
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2)),
              hintStyle: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                letterSpacing: 4.5,
                color: mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
