import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';

class CustomFlatButton extends StatelessWidget {
  CustomFlatButton({
    Key key,
    this.text = "",
    this.textColor = Colors.white,
    this.textSize = 14,
    this.fontWeight = FontWeight.w600,
    this.height,
    this.width,
    this.onPressed,
    this.loading = false,
    this.upperCase = true,
    this.icon,
    this.iconSize = 18,
    this.iconColor = Colors.white,
    this.iconPosition = IconPosition.left,
    this.iconSpace = 8,
  });

  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final bool loading;
  final bool upperCase;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final IconPosition iconPosition;
  final double iconSpace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FlatButton(
        onPressed: onPressed,
        child: buildChild(context),
      ),
    );
  }

  Widget buildChild(BuildContext context) {
    Widget textWidget = Text(
      upperCase ? text.toUpperCase() : text,
      style: Theme.of(context).textTheme.button.merge(
            TextStyle(
              fontSize: textSize,
              color: textColor,
              fontWeight: fontWeight,
            ),
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
              width: iconSpace,
            ),
          ],
          Flexible(child: textWidget),
          if (iconPosition == IconPosition.right) ...[
            SizedBox(
              width: iconSpace,
            ),
            iconWidget,
          ],
        ],
      );
    }
    return textWidget;
  }
}
