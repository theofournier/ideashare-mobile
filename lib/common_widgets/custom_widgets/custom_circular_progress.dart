import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  CustomCircularProgress({
    this.size,
    this.icon,
    this.iconColor,
    this.progressColor,
  });

  final double size;
  final IconData icon;
  final Color iconColor;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Theme.of(context).accentColor.withOpacity(0.2),
          ),
        ),
        if (icon != null) ...[
          Icon(
            icon,
            size: size - 24,
            color: iconColor ?? Theme.of(context).accentColor,
          ),
        ],
      ],
    );
  }
}
