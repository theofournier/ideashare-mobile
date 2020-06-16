import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    Key key,
    this.text = "",
    this.backgroundColor,
    this.borderColor,
    this.textColor = Colors.white,
    this.textSize = 14,
    this.borderRadius = 6.0,
    this.height = 40,
    this.width,
    this.elevation = 2,
    this.onPressed,
    this.loading = false,
  });

  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double textSize;
  final double borderRadius;
  final double height;
  final double width;
  final double elevation;
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: onPressed,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(borderRadius),
          side: BorderSide(
            color:
                borderColor ?? backgroundColor ?? Theme.of(context).accentColor,
            width: 1,
          ),
        ),
        elevation: elevation,
        color: backgroundColor ?? Theme.of(context).accentColor,
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.button.merge(
                TextStyle(fontSize: textSize, color: textColor),
              ),
        ),
      ),
    );
  }
}
