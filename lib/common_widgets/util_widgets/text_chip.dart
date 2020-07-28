import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/category_utils.dart';
import 'package:ideashare/utils/status_utils.dart';

class TextChip extends StatelessWidget {
  const TextChip({
    Key key,
    this.title,
    this.textColor = Colors.white,
    this.color,
    this.textSize = 14,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 8,
    ),
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  final String title;
  final Color textColor;
  final Color color;
  final double textSize;
  final EdgeInsets padding;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  factory TextChip.category(BuildContext context, PostType category) {
    return TextChip(
      title: CategoryUtils.getCategoryTitle[category],
      color: CategoryUtils.getCategoryColor[category],
      textSize: 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      textColor: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
    );
  }

  factory TextChip.status(BuildContext context, PostStatusType status) {
    return TextChip(
      title: StatusUtils.getStatusTitle[status],
      color: StatusUtils.getStatusColor[status],
      textSize: 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      textColor: StatusUtils.getStatusTextColor(context)[status],
      fontWeight: FontWeight.w600,
    );
  }
}
