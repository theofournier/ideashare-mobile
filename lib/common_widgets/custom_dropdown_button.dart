import 'package:flutter/material.dart';

class CustomDropdownData {
  CustomDropdownData({
    this.id,
    this.text,
  });

  final String id;
  final String text;
}

class CustomDropdownButton extends StatelessWidget {
  CustomDropdownButton({
    Key key,
    this.textColor,
    this.textSize = 18,
    this.iconColor,
    this.iconSize = 24,
    this.isExpanded = false,
    this.underline = false,
    this.underlineColor,
    this.underlineHeight = 0.2,
    this.value,
    this.onChanged,
    this.items,
  }) : super(key: key);

  final Color textColor;
  final double textSize;
  final Color iconColor;
  final double iconSize;
  final bool isExpanded;
  final bool underline;
  final Color underlineColor;
  final double underlineHeight;
  final CustomDropdownData value;
  final void Function(CustomDropdownData) onChanged;
  final List<CustomDropdownData> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CustomDropdownData>(
      style: Theme.of(context).textTheme.bodyText1.merge(
            TextStyle(
              color: textColor ?? Theme.of(context).accentColor,
              fontSize: textSize,
            ),
          ),
      iconSize: iconSize,
      iconEnabledColor: iconColor ?? Theme.of(context).accentColor,
      isExpanded: isExpanded,
      underline: underline
          ? Container(
              height: underlineHeight,
              color: underlineColor ?? Theme.of(context).accentColor,
            )
          : Container(),
      value: value,
      onChanged: onChanged,
      items: items.map((e) {
        return DropdownMenuItem<CustomDropdownData>(
          value: e,
          child: Text(
            e.text,
          ),
        );
      }).toList(),
    );
  }
}
