import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/category_utils.dart';

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
    Color color = AppColors.greyLight;
    if (category == PostType.idea) {
      color = AppColors.ideaColor;
    } else if (category == PostType.issue) {
      color = AppColors.issueColor;
    }
    return TextChip(
      title: CategoryUtils.getCategoryTitle(context)[category],
      color: color,
      textSize: 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      textColor: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
    );
  }
}
