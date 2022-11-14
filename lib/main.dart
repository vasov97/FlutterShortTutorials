import 'dart:math';

import 'package:flutter/material.dart';

import 'bubbles_background.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black45,
          title: const Text(
            'Bubbles backgorund',
            style: TextStyle(
              color:  Color.fromARGB(234, 18, 203, 231),
            ),
          ),
        ),
        body: const BubblesBackground(
          maxTheta: 2.0*pi,
          maxRadius: 6,
          maxSpeed: 0.2,
          maxBubbles: 90,
          bubblesColor:  Color.fromARGB(234, 18, 203, 231),
          tweenBegin: -10.0,
          tweenEnd: 250.0,
          animationDurationInSeconds: 3,
        ),
        backgroundColor: Colors.black45,
      ),
    );
  }
}
