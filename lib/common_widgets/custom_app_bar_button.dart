import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  CustomAppBarButton({
    Key key,
    this.text = "",
    this.textColor,
    this.textSize = 16,
    this.onPressed,
  });

  final String text;
  final Color textColor;
  final double textSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.button.merge(
              TextStyle(
                fontSize: textSize,
                color: textColor ?? Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
