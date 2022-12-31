import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';
import 'package:google_fonts/google_fonts.dart';

class Tips31 extends StatefulWidget {
  const Tips31({super.key});

  @override
  State<Tips31> createState() => _Tips31State();
}

class _Tips31State extends State<Tips31> {
  List<String> imageURL = [];
  List<Reference> list = [];

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    abc();
  }

  abc() async {
    setState(() {
      isLoading = true;
    });
    final data =
        await FirebaseStorage.instance.ref().child("fetchImage").listAll();
    for (var item in data.items) {
      var a = await item.getDownloadURL();
      imageURL.add(a);
      list.add(item);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Fetch Images from Firebase Storage",
            style: context.text.headline5,
          )),
      body: isLoading == true
          ? Center(
              child: Column(
              children: [
                const CircularProgressIndicator(),
                Text(
                  "Fetching images...",
                  style: context.text.headline5!.copyWith(
                      fontFamily: GoogleFonts.acme().fontFamily.toString()),
                )
              ],
            ))
          : SingleChildScrollView(
              child: Column(children: [
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    autoPlay: true,
                  ),
                  items: imageURL
                      .map(
                        (item) => Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(18.0),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(
                                    item,
                                    fit: BoxFit.fill,
                                    width: 1000.0,
                                  ),
                                ],
                              )),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...list.map((e) => Column(
                      children: [
                        Text(
                          "Full path: ${e.fullPath}",
                          style: context.text.headline5!.copyWith(
                              fontFamily:
                                  GoogleFonts.acme().fontFamily.toString()),
                        ),
                        Text(
                          "Name: ${e.name}",
                          style: context.text.headline5!.copyWith(
                              fontFamily:
                                  GoogleFonts.acme().fontFamily.toString()),
                        ),
                        Text(
                          "Link: ${imageURL[list.indexOf(e)]}",
                          style: context.text.headline5!.copyWith(
                              fontFamily:
                                  GoogleFonts.acme().fontFamily.toString()),
                        ),
                        Divider(
                          color: mainColor,
                        )
                      ],
                    ))
              ]),
            ),
    );
  }
}
