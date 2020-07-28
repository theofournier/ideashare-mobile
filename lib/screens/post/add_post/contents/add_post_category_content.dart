import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/utils/category_utils.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class AddPostCategoryContent extends StatelessWidget {
  AddPostCategoryContent({
    @required this.viewModel,
  });

  final AddPostViewModel viewModel;

  void onTap(PostType category) {
    viewModel.updateWith(post: viewModel.post..category = category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: CategoryUtils.categories(context)
            .map(
              (category) => CategoryItem(
                title: category.title,
                description: category.description,
                color: category.color,
                textColor: category.textColor,
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
    this.color,
    this.textColor,
    this.isSelected,
    this.onTap,
  });

  final String title;
  final String description;
  final Color color;
  final Color textColor;
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
      color:
          isSelected ? Theme.of(context).accentColor : (color ?? Colors.white),
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
                    style: isSelected
                        ? titleStyle.toWhite()
                        : (textColor != null
                            ? titleStyle.toColor(textColor)
                            : titleStyle),
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
                style: isSelected
                    ? descriptionStyle.toWhite()
                    : (textColor != null
                        ? descriptionStyle.toColor(textColor)
                        : descriptionStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
