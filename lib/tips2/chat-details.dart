// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../home.dart';
import 'chatController.dart';

class ChatDetailPage extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> data;
  const ChatDetailPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController messageController = TextEditingController();

  late ChatProvider chatProvider;
  bool temp = false;
  bool audio = false;
  int _limit = 20;
  int _limitIncrement = 20;
  List<QueryDocumentSnapshot> listMessage = [];

  Stream<QuerySnapshot>? chatMessageStream;
  final ScrollController _scrollController = ScrollController();
  String groupChatId = "";
  bool isShowSticker = false;
  final FocusNode focusNode = FocusNode();
  String currentUserId = "";

  void readLocal() async {
    var a = await FirebaseFirestore.instance.collection('chat').get();
    setState(() {
      currentUserId = widget.data.id == "AwCh9AOfdnMgK8gJZnOL"
          ? a.docs[0].id
          : a.docs[1].id;
    });
    String peerId =
        widget.data.id != "AwCh9AOfdnMgK8gJZnOL" ? a.docs[0].id : a.docs[1].id;
    if (currentUserId.compareTo(peerId) > 0) {
      groupChatId = '$currentUserId-$peerId';
    } else {
      groupChatId = '$peerId-$currentUserId';
    }
    chatProvider.updateDataFirestore(
      'chat',
      currentUserId,
      {'chattingWith': peerId},
    );
  }

  void onSendMessage(String content, int type, {String? duration = ""}) {
    if (content.trim().isNotEmpty) {
      messageController.clear();
      chatProvider.sendMessage(
          content, type, groupChatId, currentUserId, widget.data.id.toString(),
          duration: duration!);
      _scrollController.animateTo(0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing to send', backgroundColor: Colors.grey);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chatProvider = Get.put(ChatProvider(
        firebaseFirestore: FirebaseFirestore.instance,
        firebaseStorage: FirebaseStorage.instance));
    focusNode.addListener(onFocusChange);
    _scrollController.addListener(_scrollListener);
    readLocal();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        _limit <= listMessage.length) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      // Hide sticker when keyboard appear
      setState(() {
        isShowSticker = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(widget.data['name']),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              buildListMessage(),
              buildInput(),
            ],
          ),
          // buildLoading()
        ],
      ),
    );
  }

  _incomingMSG(String a) {
    return Align(
      alignment: (Alignment.topLeft),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: mainColor.withOpacity(0.18)),
        padding: const EdgeInsets.fromLTRB(18, 9, 18, 9),
        child: Text(
          a,
          style: TextStyle(fontSize: 12, color: Color(0xff8A8A8A)),
        ),
      ),
    );
  }

  Widget buildInput() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: BoxDecoration(
            color: mainColor.withOpacity(0.25),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        //height: 50,
        child: TextField(
          onSubmitted: (value) {
            onSendMessage(messageController.text, TypeMessage.text);
          },
          controller: messageController,
          focusNode: focusNode,
          decoration: InputDecoration(
              suffixIcon: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  child: Icon(Icons.send, color: mainColor),
                  onTap: () =>
                      onSendMessage(messageController.text, TypeMessage.text),
                ),
              ),
              hintText: "Your message...",
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              hintStyle: TextStyle(color: Color(0xff8A8A8A), fontSize: 15),
              border: InputBorder.none),
        ),
      ),
    );
  }

  _outgoingMSG(String a) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: mainColor,
        ),
        padding: const EdgeInsets.fromLTRB(18, 9, 18, 9),
        child: Text(
          a,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildListMessage() {
    return Flexible(
      child: groupChatId.isNotEmpty
          ? StreamBuilder<QuerySnapshot>(
              stream: chatProvider.getChatStream(groupChatId, _limit),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  listMessage = snapshot.data!.docs;
                  if (listMessage.isNotEmpty) {
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
                      itemBuilder: (context, index) =>
                          buildItem(index, snapshot.data?.docs[index]),
                      itemCount: snapshot.data?.docs.length,
                      reverse: true,
                      controller: _scrollController,
                    );
                  } else {
                    return Center(
                        child: Text(
                      "No message here yet...",
                      style: TextStyle(color: Colors.black),
                    ));
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget buildItem(int index, DocumentSnapshot? document) {
    if (document != null) {
      MessageChat messageChat = MessageChat.fromDocument(document);
      if (messageChat.idFrom == currentUserId) {
        // Right (my message)
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_outgoingMSG(messageChat.content)],
          ),
        );
      } else {
        // Left (peer message)
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  isLastMessageLeft(index)
                      ? Material(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Container(color: mainColor),
                        )
                      : Container(width: 35),
                  _incomingMSG(messageChat.content)
                ],
              ),

              // Time
              isLastMessageLeft(index)
                  ? Container(
                      margin: EdgeInsets.only(left: 50, top: 5, bottom: 5),
                      child: Text(
                        DateFormat('dd MMM kk:mm').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                int.parse(messageChat.timestamp))),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        );
      }
    } else {
      return SizedBox.shrink();
    }
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 && listMessage[index - 1].get("idFrom") == currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 && listMessage[index - 1].get("idFrom") != currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }
}
