import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  Line({
    this.color,
    this.height = 1,
    this.width,
    this.borderRadius = 0,
  });

  final Color color;
  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
