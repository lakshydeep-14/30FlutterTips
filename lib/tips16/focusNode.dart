// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class FocusNodeWid extends StatefulWidget {
  const FocusNodeWid({Key? key}) : super(key: key);

  @override
  State<FocusNodeWid> createState() => _FocusNodeWidState();
}

class _FocusNodeWidState extends State<FocusNodeWid> {
  List<TextEditingController> textEditingControllerList =
      List.generate(5, (index) => TextEditingController());
  List<FocusNode> focusNodeList = List.generate(5, (index) => FocusNode());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 16"),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ...textEditingControllerList.asMap().entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: e.value,
                        onEditingComplete: () {
                          if (int.parse(e.key.toString()) == 4) {
                            FocusScope.of(context).unfocus();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                "Unfocused",
                                style: context.text.headline3,
                              ),
                            ));
                          } else {
                            FocusScope.of(context).requestFocus(
                                focusNodeList[int.parse(e.key.toString()) + 1]);
                          }
                        },
                        focusNode: focusNodeList[e.key],
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "${int.parse(e.key.toString()) + 1}. ",
                              style: context.text.headline3!
                                  .copyWith(color: Colors.black, fontSize: 18),
                            ),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          // labelText: 'Add a comment ...',
                          // labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                          fillColor: Colors.grey.withOpacity(0.5),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ));
  }
}
