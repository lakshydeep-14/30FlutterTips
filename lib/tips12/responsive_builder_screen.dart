import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResScreen extends StatefulWidget {
  const ResScreen({super.key});

  @override
  State<ResScreen> createState() => _ResScreenState();
}

class _ResScreenState extends State<ResScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Construct and pass in a widget builder per screen type
          ScreenTypeLayout.builder(
        mobile: (BuildContext context) => Container(color: Colors.blue),
        tablet: (BuildContext context) => Container(color: Colors.yellow),
        desktop: (BuildContext context) => Container(color: Colors.red),
        watch: (BuildContext context) => Container(color: Colors.purple),
      ),
    );
  }
}
