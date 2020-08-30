import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_flat_button.dart';
import 'package:ideashare/resources/theme.dart';

enum FlushbarType {
  info,
  success,
  error,
}

class FlushbarUtils {
  FlushbarUtils(
    this.context, {
    this.type = FlushbarType.info,
    this.title,
    this.message = "",
    this.textColor = Colors.white,
    this.titleSize = 18,
    this.messageSize = 16,
    this.duration = const Duration(seconds: 3),
    this.borderRadius = 8,
    this.margin = const EdgeInsets.all(8),
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.flushbarDismissDirection = FlushbarDismissDirection.HORIZONTAL,
    this.shouldIconPulse = false,
    this.onPressedMainButton,
    this.buttonText,
  }) {
    IconData icon;
    Color iconColor;
    Color backgroundColor;
    switch (type) {
      case FlushbarType.info:
        icon = Icons.info_outline;
        iconColor = Colors.white;
        backgroundColor = Theme.of(context).accentColor;
        break;
      case FlushbarType.error:
        icon = Icons.error_outline;
        iconColor = Colors.white;
        backgroundColor = Theme.of(context).errorColor;
        break;
      case FlushbarType.success:
        icon = Icons.check_circle_outline;
        iconColor = Colors.white;
        backgroundColor = AppColors.success;
        break;
    }
    this.icon = this.icon ?? icon;
    this.iconColor = this.iconColor ?? iconColor;
    this.backgroundColor = this.backgroundColor ?? backgroundColor;
  }

  final BuildContext context;
  final FlushbarType type;
  final String title;
  final String message;
  final Color textColor;
  final double titleSize;
  final double messageSize;
  final Duration duration;
  final double borderRadius;
  final EdgeInsets margin;
  IconData icon;
  Color iconColor;
  Color backgroundColor;
  final FlushbarDismissDirection flushbarDismissDirection;
  final bool shouldIconPulse;
  final VoidCallback onPressedMainButton;
  final String buttonText;

  Flushbar flushbar;

  void show() {
    this. flushbar = Flushbar(
      titleText: title != null
          ? Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: titleSize,
              ),
            )
          : null,
      messageText: Text(
        message,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: messageSize,
        ),
      ),
      duration: duration,
      borderRadius: borderRadius,
      margin: margin,
      icon: Icon(
        icon,
        color: iconColor,
      ),
      backgroundColor: backgroundColor,
      dismissDirection: flushbarDismissDirection,
      shouldIconPulse: shouldIconPulse,
      mainButton: buttonText == null ? null : CustomFlatButton(
        onPressed: onPressedMainButton,
        text: buttonText,
        fontWeight: FontWeight.bold,
        textSize: titleSize,
      ),
    )..show(context);
  }

  void dismiss() {
    if(flushbar != null){
      flushbar.dismiss();
    }
  }
}
