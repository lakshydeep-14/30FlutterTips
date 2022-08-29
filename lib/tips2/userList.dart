// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips3/image_chat.dart';
import 'package:get/get.dart';

import 'chat-details.dart';

class UserList extends StatefulWidget {
  final String tips;
  const UserList({Key? key, required this.tips}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Stream<List<QueryDocumentSnapshot<Object?>>> _stream() async* {
    List<QueryDocumentSnapshot<Object?>> matchedData = [];
    await FirebaseFirestore.instance.collection('chat').get().then((value) {
      matchedData = value.docs.toList();
    });
    yield matchedData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 2"),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "UserList",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: StreamBuilder<List<QueryDocumentSnapshot<Object?>>>(
                  stream: _stream(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return snapshot.data!.isEmpty
                          ? Center(
                              child: Text("No Data"),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              itemBuilder: (context, index) {
                                if (snapshot.data![index] == null) {
                                  return SizedBox();
                                } else {
                                  return GestureDetector(
                                    onTap: () async {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => widget.tips ==
                                                  "2"
                                              ? ChatDetailPage(
                                                  data: snapshot.data![index],
                                                )
                                              : ImageChat(
                                                  data: snapshot.data![index],
                                                ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                        color:
                                            ThemeData().scaffoldBackgroundColor,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.account_circle,
                                                  size: 50,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data![index]
                                                          ["name"],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13),
                                                    ),
                                                    Text(
                                                      snapshot.data![index].id
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        )),
                                  );
                                }
                                ;
                              },
                              itemCount: snapshot.data!.length,
                            );
                    }
                  },
                ),
              ),
            ],
          ),
        )));
  }
}

class CircularUserImage extends StatefulWidget {
  final String imageURL;
  final double height, width;
  const CircularUserImage(
      {Key? key, required this.imageURL, this.height = 50.0, this.width = 50.0})
      : super(key: key);

  @override
  State<CircularUserImage> createState() => _CircularUserImageState();
}

class _CircularUserImageState extends State<CircularUserImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        widget.imageURL,
        fit: BoxFit.cover,
        width: widget.width,
        height: widget.height,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: 50,
            height: 50,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, object, stackTrace) {
          return Icon(
            Icons.account_circle,
            size: 50,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
