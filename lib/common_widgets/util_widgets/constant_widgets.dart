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

  static const EdgeInsetsGeometry defaultPadding =
      const EdgeInsets.symmetric(vertical: 48, horizontal: 40);
  static const EdgeInsetsGeometry addPostPadding =
      const EdgeInsets.symmetric(vertical: 16, horizontal: 24);

  static const EdgeInsetsGeometry postVerticalPadding =
      const EdgeInsets.symmetric(vertical: 24);
  static const EdgeInsetsGeometry postHorizontalPadding =
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsetsGeometry postPadding = postVerticalPadding.add(postHorizontalPadding);

  static GestureDetector unfocusGestureDetector({
    BuildContext context,
    Widget child,
  }) =>
      GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: child,
      );
}
