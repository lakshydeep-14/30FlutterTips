// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips21/folderTypes/externalFolder.dart';

class CreateFolderScreen extends StatefulWidget {
  const CreateFolderScreen({Key? key}) : super(key: key);

  @override
  State<CreateFolderScreen> createState() => _CreateFolderScreenState();
}

class _CreateFolderScreenState extends State<CreateFolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 21"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(mainColor)),
            onPressed: () async {
              CreateFolder().internalFolder();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: mainColor,
                  content: Text(
                    "Folder created!!",
                  )));
            },
            child: Text("Create Folder to Internal Path"),
          ),
          Center(
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(mainColor)),
              onPressed: () async {
                CreateFolder().externalFolder();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: mainColor,
                    content: Text(
                      "Folder created!!",
                    )));
              },
              child: Text("Create Folder to External Path"),
            ),
          ),
        ],
      ),
    );
  }
}
