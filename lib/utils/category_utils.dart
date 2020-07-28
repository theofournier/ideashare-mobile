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
  static Map<PostType, String> getCategoryTitle = {
    PostType.idea: S.current.postTypeIdea,
    PostType.issue: S.current.postTypeIssue,
  };

  static Map<PostType, Color> getCategoryColor = {
    PostType.idea: AppColors.ideaColor,
    PostType.issue: AppColors.issueColor,
  };
  
  static List<CategoryData> categories = [
    CategoryData(
      category: PostType.idea,
      title: getCategoryTitle[PostType.idea],
      description: "Description",
      color: getCategoryColor[PostType.idea],
    ),
    CategoryData(
      category: PostType.issue,
      title: getCategoryTitle[PostType.issue],
      description: "Description",
      color: getCategoryColor[PostType.issue],
    ),
  ];
}