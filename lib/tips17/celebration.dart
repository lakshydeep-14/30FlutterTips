import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_30_tips/home.dart';

class Celebration extends StatefulWidget {
  const Celebration({Key? key}) : super(key: key);

  @override
  State<Celebration> createState() => _CelebrationState();
}

class _CelebrationState extends State<Celebration> {
  late ConfettiController _confettiController;
  late ConfettiController _confettiController1;
  late ConfettiController _confettiController2;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    _confettiController1 =
        ConfettiController(duration: const Duration(seconds: 10));

    _confettiController2 =
        ConfettiController(duration: const Duration(seconds: 5));
    _confettiController.play();
    _confettiController1.play();
    _confettiController2.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 17"),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: -pi / 2,
                emissionFrequency: 0.01,
                numberOfParticles: 50,
                maxBlastForce: 20,
                minBlastForce: 10,
                gravity: 0.1,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: _confettiController1,
                blastDirection: -pi / 2,
                emissionFrequency: 0.01,
                numberOfParticles: 100,
                maxBlastForce: 50,
                minBlastForce: 20,
                gravity: 0.1,
                createParticlePath: drawStar,
                shouldLoop: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ConfettiWidget(
                confettiController: _confettiController2,
                blastDirection: -pi / 2,
                emissionFrequency: 0.01,
                numberOfParticles: 1000,
                maxBlastForce: 100,
                minBlastForce: 80,
                gravity: 0.5,
              ),
            ),
          ],
        ));
  }

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);
    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);
    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
