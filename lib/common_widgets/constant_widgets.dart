import 'package:flutter/material.dart';

class ConstantWidgets {
  static BoxDecoration gradientBoxDecoration(BuildContext context) =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor
          ],
        ),
      );

  static EdgeInsetsGeometry defaultPadding = const EdgeInsets.symmetric(vertical: 48, horizontal: 32);
}
