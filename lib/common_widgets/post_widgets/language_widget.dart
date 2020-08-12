import 'package:flutter/material.dart';
import 'package:ideashare/utils/custom_locales.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key key,
    this.languageCode,
    this.iconColor,
    this.iconSize = 24,
    this.textSize = 20,
  }) : super(key: key);

  final String languageCode;
  final Color iconColor;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.language,
          color: iconColor ?? Theme.of(context).primaryColor,
          size: iconSize,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          CustomLocales.getLocaleName(
                  languageCode, CustomLocales.nativeLocaleNames) ??
              "",
          style:
              Theme.of(context).textTheme.bodyText1.toSize(textSize).toMedium(),
        ),
      ],
    );
  }
}
