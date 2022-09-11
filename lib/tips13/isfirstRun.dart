// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class IsFirstWidget extends StatefulWidget {
  const IsFirstWidget({
    Key? key,
  }) : super(key: key);

  @override
  _IsFirstWidgetState createState() => _IsFirstWidgetState();
}

class _IsFirstWidgetState extends State<IsFirstWidget> {
  bool? _isFirstRun;
  void _checkFirstRun() async {
    bool ifr = await IsFirstRun.isFirstRun();
    setState(() {
      _isFirstRun = ifr;
    });
  }

  bool? _isFirstCall;
  void _checkFirstCall() async {
    bool ifc = await IsFirstRun.isFirstCall();
    setState(() {
      _isFirstCall = ifc;
    });
  }

  void _reset() async {
    await IsFirstRun.reset();
    _checkFirstRun();
    _checkFirstCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 13"),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Is first run: ${_isFirstRun ?? 'Unknown'}',
                style: context.text.headline1,
              ),
              ElevatedButton(
                  child: Text('Check first run'), onPressed: _checkFirstRun),
              Text(
                'Is first call: ${_isFirstCall ?? 'Unknown'}',
                style: context.text.headline1,
              ),
              ElevatedButton(
                  child: Text('Check first call'), onPressed: _checkFirstCall),
              ElevatedButton(child: Text('Reset'), onPressed: _reset),
              SizedBox(height: 24),
            ]),
      ),
    );
  }
}
