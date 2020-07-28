import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/gradient_icon.dart';
import 'package:ideashare/resources/theme.dart';

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
