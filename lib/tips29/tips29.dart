import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class Tips29 extends StatefulWidget {
  const Tips29({super.key});

  @override
  State<Tips29> createState() => _Tips29State();
}

class _Tips29State extends State<Tips29> {
  List<int> list = List.generate(20, (index) => index);
  final _controller = ScrollController();
  bool _isMoreData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        fetch();
      }
    });
  }

  fetch() async {
    await Future.delayed(Duration(seconds: 5));
    if (list.length != 50) {
      List<int> _int = List.generate(5, (i) => list.length + i + 1);
      //API Calls
      setState(() {
        list.addAll(_int);
        _isMoreData = false;
      });
    } else {
      setState(() {
        _isMoreData = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 29"),
      body: ListView.builder(
        itemCount: list.length + 1,
        controller: _controller,
        itemBuilder: (context, index) {
          if (index < list.length) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Item ${list[index]}",
                style: context.text.headline2,
              ),
            );
          } else {
            return _isMoreData == true
                ? Center(
                    child: Text(
                    "No More Dara",
                    style: context.text.headline2,
                  ))
                : const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
