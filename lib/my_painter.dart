import 'dart:math';

import 'package:bubbles_background/bubble.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  List<Bubble?> bubbles;
  MyPainter(this.bubbles, this.random,this.bubblesColor);
  Random random;
  Color bubblesColor;
  @override
  void paint(Canvas canvas, Size size) {
    for (var bubble in bubbles) {
      var velocity = polarToCartestian(bubble!.speed!, bubble.theta!);
      var dx = bubble.offset!.dx + velocity.dx;
      var dy = bubble.offset!.dy + velocity.dy;
      if (bubble.offset!.dx < 0 || bubble.offset!.dx > size.width) {
        dx = random.nextDouble() * size.width;
      }
      if (bubble.offset!.dy < 0 || bubble.offset!.dy > size.height) {
        dy = random.nextDouble() * size.height;
      }
      bubble.offset = Offset(dx, dy);
    }

    for (var bubble in bubbles) {
      var paint = Paint();
      paint.color = bubblesColor;
      canvas.drawCircle(bubble!.offset!, bubble.radius!, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Offset polarToCartestian(double? speed, double? theta) =>
      Offset(speed! * cos(theta!), speed * sin(theta));
}
