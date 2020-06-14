import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton({
    Key key,
    this.text = "",
    this.textColor = Colors.white,
    this.textSize = 14,
    this.height,
    this.width,
    this.onPressed,
    this.loading = false,
  });

  final String text;
  final Color textColor;
  final double textSize;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.button.merge(
                TextStyle(
                  fontSize: textSize,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}
