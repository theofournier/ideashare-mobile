import 'package:flutter/material.dart';

class AlertDialogButton extends StatelessWidget {
  AlertDialogButton({
    @required this.text,
    this.color,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.onPressed,
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: color ?? Theme.of(context).accentColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
