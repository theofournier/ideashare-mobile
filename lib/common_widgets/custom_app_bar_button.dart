import 'package:flutter/material.dart';

class CustomAppBarButton extends StatelessWidget {
  CustomAppBarButton({
    Key key,
    this.text = "",
    this.icon,
    this.textColor,
    this.textSize = 16,
    this.onPressed,
  });

  final String text;
  final Color textColor;
  final double textSize;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
            tooltip: text,
          )
        : FlatButton(
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
