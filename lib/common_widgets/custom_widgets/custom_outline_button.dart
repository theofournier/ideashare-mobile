import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  CustomOutlineButton({
    Key key,
    this.text = "",
    this.backgroundColor,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.textSize = 14,
    this.borderRadius = 6.0,
    this.height = 40,
    this.width,
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
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlineButton(
        onPressed: onPressed,
        borderSide: BorderSide(
          color: borderColor,
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(borderRadius),
        ),
        child: loading ? buildSpinner() : Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.button.merge(
                TextStyle(
                  fontSize: textSize,
                  color: textColor
                ),
              ),
        ),
        color: backgroundColor,
      ),
    );
  }

  Widget buildSpinner() {
    return SizedBox(
      height: height * 0.60,
      width: height * 0.60,
      child: CircularProgressIndicator(
      ),
    );
  }

}
