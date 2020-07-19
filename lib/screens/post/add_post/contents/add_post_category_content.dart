import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class CategoryData {
  CategoryData({
    this.category,
    this.title,
    this.description,
  });

  final PostType category;
  final String title;
  final String description;
}

class AddPostCategoryContent extends StatelessWidget{
  AddPostCategoryContent({
    @required this.viewModel,
  });

  final AddPostViewModel viewModel;

  List<CategoryData> categories(BuildContext context) => [
        CategoryData(
          category: PostType.idea,
          title: S.of(context).addPostCategoryIdeaTitle,
          description: "Description",
        ),
        CategoryData(
          category: PostType.issue,
          title: S.of(context).addPostCategoryIssueTitle,
          description: "Description",
        ),
      ];

  void onTap(PostType category) {
    Post post = viewModel.post..category = category;
    viewModel.updateWith(post: post);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: categories(context)
            .map(
              (category) => CategoryItem(
                title: category.title,
                description: category.description,
                isSelected: viewModel.post.category != null &&
                    category.category == viewModel.post.category,
                onTap: () => onTap(category.category),
              ),
            )
            .toList(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  CategoryItem({
    this.title,
    this.description,
    this.isSelected,
    this.onTap,
  });

  final String title;
  final String description;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        Theme.of(context).textTheme.headline4.toSemiBold();
    final TextStyle descriptionStyle = Theme.of(context).textTheme.bodyText1;

    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 6,
      color: isSelected ? Theme.of(context).accentColor : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title.toUpperCase(),
                    style: isSelected ? titleStyle.toWhite() : titleStyle,
                  ),
                  if (isSelected) ...[
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40,
                    ),
                  ],
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                description,
                style:
                    isSelected ? descriptionStyle.toWhite() : descriptionStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}