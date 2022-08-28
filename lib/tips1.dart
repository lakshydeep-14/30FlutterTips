// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = false;
  List<QueryDocumentSnapshot> _results = [];
  bool _init = true;
  int _queryMinLen = 4;
  String query = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar("Tips 1"),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            _searchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: _getbody(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getbody() {
    if (_isLoading) return Center(child: CircularProgressIndicator());
    if (_init) {
      return Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.search), Text('Enter Search Term')],
        ),
      );
    }
    if (_results.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Item Not Found!'),
              Text('Try searching again'),
            ]),
      );
    }
    return SearchBody(result: _results);
  }

  Widget _searchBar() {
    return Container(
      height: 55,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: mainColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    child: TextFormField(
                      autofocus: true,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'Type Your Search',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        contentPadding:
                            const EdgeInsets.only(bottom: 0, top: 15),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              style: BorderStyle.solid, color: Colors.white),
                        ),
                      ),
                      onChanged: (value) async {
                        query = value;
                        if (value.isEmpty) _results.clear();

                        if (value.length >= _queryMinLen) {
                          if (_init) _init = false;
                          toggleLoading();
                          await getSearchResult();
                          toggleLoading();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 5,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.chevron_left,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getSearchResult() async {
    _results.clear();
    var data = await FirebaseFirestore.instance
        .collection('searchList')
        .get(); // you can use here api in similar way
    for (var e in data.docs) {
      if (e['name'].toString().toLowerCase().contains(query.toLowerCase())) {
        _results.add(e);
      }
    }

    setState(() {});
  }

  void toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key, required this.result}) : super(key: key);

  final List<QueryDocumentSnapshot> result;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        physics: NeverScrollableScrollPhysics(),
        itemCount: result.length,
        //separatorBuilder: (context, index) => Divider(),
        itemBuilder: (_, i) {
          return ListTile(
            title: Text(result[i]['name']),
          );
        });
  }
}
