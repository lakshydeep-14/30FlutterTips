// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:permission_handler/permission_handler.dart';

class WriteFileScreen extends StatefulWidget {
  const WriteFileScreen({Key? key}) : super(key: key);

  @override
  State<WriteFileScreen> createState() => _WriteFileScreenState();
}

class _WriteFileScreenState extends State<WriteFileScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  String? res;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 21"),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              focusNode: focusNode,
              controller: controller,
              style: TextStyle(color: mainColor),
            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(mainColor)),
              onPressed: () async {
                await externalFolder();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: mainColor,
                    content: Text(
                      "Write to File",
                    )));
                controller.clear();
                focusNode.unfocus();
              },
              child: Text("Write To File"),
            ),
            Center(
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(mainColor)),
                onPressed: () async {
                  if (await Permission.manageExternalStorage.isGranted) {
                    var b = await File(
                            "/storage/emulated/0/30FlutterTips/tips22.dart")
                        .readAsString();

                    setState(() {
                      res = b;
                    });
                  } else {
                    await Permission.manageExternalStorage.request();
                  }
                },
                child: Text("Read From File"),
              ),
            ),
            if (res != null)
              Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  color: mainColor,
                  child: Center(child: Text(res.toString())))
          ],
        ),
      ),
    );
  }

  externalFolder() async {
    if (await Permission.manageExternalStorage.isGranted) {
      final path = Directory('/storage/emulated/0/30FlutterTips/');
      String res = "";

      if (await path.exists()) {
        res = path.path;
      } else {
        final Directory appDocDirNewFolder = await path.create(recursive: true);

        res = appDocDirNewFolder.path;
      }
      final File file = File("${res}tips22.dart");
      await file.writeAsString(controller.text.toString());
    } else {
      await Permission.manageExternalStorage.request();
    }
  }
}
