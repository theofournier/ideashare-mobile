import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/theme.dart';

class CategoryData {
  CategoryData({
    this.category,
    this.title,
    this.description,
    this.color,
    this.textColor,
  });

  final PostType category;
  final String title;
  final String description;
  final Color color;
  final Color textColor;
}

class CategoryUtils {
  static Map<PostType, String> getCategoryTitle(BuildContext context) => {
    PostType.idea: S.of(context).postTypeIdea,
    PostType.issue: S.of(context).postTypeIssue,
  };

  static Map<PostType, Color> getCategoryColor(BuildContext context) => {
    PostType.idea: AppColors.ideaColor,
    PostType.issue: AppColors.issueColor,
  };
  
  static List<CategoryData> categories(BuildContext context) => [
    CategoryData(
      category: PostType.idea,
      title: getCategoryTitle(context)[PostType.idea],
      description: "Description",
      color: getCategoryColor(context)[PostType.idea],
    ),
    CategoryData(
      category: PostType.issue,
      title: getCategoryTitle(context)[PostType.issue],
      description: "Description",
      color: getCategoryColor(context)[PostType.issue],
    ),
  ];
}