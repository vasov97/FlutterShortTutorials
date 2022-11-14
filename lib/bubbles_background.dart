import 'dart:math';

import 'package:bubbles_background/my_painter.dart';
import 'package:bubbles_background/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubblesBackground extends StatefulWidget {
  const BubblesBackground({
    super.key,
    required this.maxSpeed,
    required this.maxRadius,
    required this.maxTheta,
    required this.maxBubbles,
    required this.bubblesColor,
    required this.tweenEnd,
    required this.tweenBegin, required this.animationDurationInSeconds,
  });
  final double maxSpeed;
  final double maxRadius;
  final double maxTheta;
  final int maxBubbles;
  final int animationDurationInSeconds;
  final Color bubblesColor;
  final double tweenEnd;
  final double tweenBegin;


  @override
  State<BubblesBackground> createState() => _BubblesBackgroundState();
}

class _BubblesBackgroundState extends State<BubblesBackground>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  List<Bubble?>? particles;
  Random random = Random(DateTime.now().millisecondsSinceEpoch);

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: widget.animationDurationInSeconds));
    animation = Tween<double>(begin: widget.tweenBegin, end: widget.tweenEnd).animate(controller!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
      });

    controller!.forward();
    particles = List.generate(widget.maxBubbles, (index) {
      var element = Bubble();
      element.offset = const Offset(-1, -1);
      element.speed = random.nextDouble() * widget.maxSpeed;
      element.theta = random.nextDouble() * widget.maxTheta;
      element.radius = random.nextDouble() * widget.maxRadius;
      return element;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(particles!, random, widget.bubblesColor),
      child: Container(),
    );
  }
}
