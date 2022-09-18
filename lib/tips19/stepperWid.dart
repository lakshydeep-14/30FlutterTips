// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

import 'package:flutter_30_tips/home.dart';

class StepprWid extends StatefulWidget {
  const StepprWid({Key? key}) : super(key: key);

  @override
  State<StepprWid> createState() => _StepprWidState();
}

class _StepprWidState extends State<StepprWid> {
  int index = 0;
  int totalSteps = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 19"),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: mainColor,
              ),
          canvasColor: mainColor.withOpacity(0.15),
        ),
        child: Stepper(
          currentStep: index,
          type: StepperType.horizontal,
          elevation: 0,
          onStepTapped: (int a) {
            setState(() {
              index = a;
            });
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                if (index > 0)
                  Expanded(
                      child: TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  mainColor.withOpacity(0.25))),
                          onPressed: () {
                            setState(() {
                              index--;
                            });
                          },
                          icon: Icon(Icons.arrow_back),
                          label: Text(
                            "Back",
                            style: context.text.headline2,
                          ))),
                if (index > 0) SizedBox(width: 10),
                if (index < totalSteps - 1)
                  Expanded(
                      child: TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  mainColor.withOpacity(0.25))),
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                          },
                          icon: Icon(Icons.arrow_forward),
                          label: Text(
                            "Next",
                            style: context.text.headline2,
                          ))),
                if (index == totalSteps - 1)
                  Expanded(
                      child: TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(mainColor)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      height: 200,
                                      child: Center(
                                        child: Text(
                                          "Done",
                                          style: context.text.headline2!
                                              .copyWith(fontSize: 30),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.done_all,
                            color: Colors.white,
                          ),
                          label: Text(
                            "Done",
                            style: context.text.headline2!
                                .copyWith(color: Colors.white),
                          ))),
              ],
            );
          },
          steps: [
            Step(
                isActive: index >= 0,
                title: SizedBox.shrink(),
                content: _steps("Follow")),
            Step(
                isActive: index >= 1,
                title: SizedBox.shrink(),
                content: _steps("#30flutterTips\n&\n@lakshydeep-14")),
            Step(
                isActive: index >= 2,
                title: SizedBox.shrink(),
                content: _steps("On")),
            Step(
                isActive: index >= 3,
                title: SizedBox.shrink(),
                content: _steps("YouTube, \n Medium")),
            Step(
                isActive: index >= 4,
                title: SizedBox.shrink(),
                content: _steps("GitHub,\n & \n LinkedIn")),
          ],
        ),
      ),
    );
  }

  Widget _steps(String label) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
              color: mainColor.withOpacity(0.25), style: BorderStyle.solid)),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: mainColor.withOpacity(0.25), style: BorderStyle.solid)),
        height: 200,
        width: 500,
        child: Center(
          child: Text(
            label,
            style: context.text.headline2!.copyWith(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
