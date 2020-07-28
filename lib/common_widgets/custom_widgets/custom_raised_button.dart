import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';

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
    this.upperCase = true,
    this.onPressed,
    this.loading = false,
    this.icon,
    this.iconSize = 18,
    this.iconColor = Colors.white,
    this.iconPosition = IconPosition.left,
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
  final bool upperCase;
  final VoidCallback onPressed;
  final bool loading;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final IconPosition iconPosition;

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
        child: buildChild(context),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    if (loading) {
      return buildSpinner();
    }
    Widget textWidget = Text(
      upperCase ? text.toUpperCase() : text,
      style: Theme.of(context).textTheme.button.merge(
            TextStyle(fontSize: textSize, color: textColor),
          ),
    );
    if (icon != null) {
      Icon iconWidget = Icon(
        icon,
        size: iconSize,
        color: iconColor,
      );
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (iconPosition == IconPosition.left) ...[
            iconWidget,
            SizedBox(
              width: 8,
            ),
          ],
          Flexible(child: textWidget),
          if (iconPosition == IconPosition.right) ...[
            SizedBox(
              width: 8,
            ),
            iconWidget,
          ],
        ],
      );
    }
    return textWidget;
  }

  Widget buildSpinner() {
    return SizedBox(
      height: height * 0.60,
      width: height * 0.60,
      child: CircularProgressIndicator(),
    );
  }
}
