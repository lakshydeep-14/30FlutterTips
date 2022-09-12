import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class ResizeImageWidget extends StatefulWidget {
  const ResizeImageWidget({Key? key}) : super(key: key);

  @override
  State<ResizeImageWidget> createState() => _ResizeImageWidgetState();
}

class _ResizeImageWidgetState extends State<ResizeImageWidget> {
  File? imageFilePath, cropped, resized, compressed;
  List<dynamic>? imageProperties;
  bool loading = false;
  _pickImage() async {
    setState(() {
      loading = true;
    });
    await ImagePicker.platform
        .getImage(source: ImageSource.gallery)
        .then((value) {
      if (_pickImage != null) {
        setState(() {
          imageFilePath = File(value!.path);
        });
      }
    });
    var a = await _compressImage();
    var b = await _resizeImage();
    var c = await _cropImage();
    var d = await _imageProperties();
    setState(() {
      cropped = c;
      resized = b;
      compressed = a;
      imageProperties = d;
      loading = false;
    });
  }

  _compressImage() async {
    File compressedFile = await FlutterNativeImage.compressImage(
        imageFilePath!.path,
        quality: 40,
        percentage: 50);
    return compressedFile;
  }

  _resizeImage() async {
    File compressedFile = await FlutterNativeImage.compressImage(
        imageFilePath!.path,
        quality: 80,
        targetWidth: 600,
        targetHeight: 300);
    return compressedFile;
  }

  _imageProperties() async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(imageFilePath!.path);

    return [
      properties.height,
      properties.width,
      ImageOrientation.values[properties.orientation.index]
    ];
  }

  _cropImage() async {
    File croppedFile = await FlutterNativeImage.cropImage(
        imageFilePath!.path, 50, 50, 100, 100);
    return croppedFile;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pickImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 14"),
      body: loading == true
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 0.5 * MediaQuery.of(context).size.height,
                      child: Image.file(imageFilePath!)),
                  Text(
                    "Original Height:${imageProperties![0].toString()}",
                    style: context.text.headline4!,
                  ),
                  Text(
                    "Original Width:${imageProperties![1].toString()}",
                    style: context.text.headline4!,
                  ),
                  Text(
                    "Original Orientation:${imageProperties![2].toString()}",
                    style: context.text.headline4!,
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Text(
                    "Compressed Image",
                    style: context.text.headline2!,
                  ),
                  Image.file(compressed!),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Text(
                    "Resized Image",
                    style: context.text.headline2!,
                  ),
                  Image.file(resized!),
                  Divider(
                    height: 10,
                    thickness: 2,
                  ),
                  Text(
                    "Cropped Image",
                    style: context.text.headline2!,
                  ),
                  Image.file(cropped!),
                ],
              ),
            ),
    );
  }
}
