import 'package:flutter/material.dart';

class LabelChip extends StatelessWidget {
  const LabelChip({
    Key key,
    this.title,
    this.textColor = Colors.white,
    this.color,
    this.textSize = 14,
  }) : super(key: key);

  final String title;
  final Color textColor;
  final Color color;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
        ),
      ),
    );
  }
}
