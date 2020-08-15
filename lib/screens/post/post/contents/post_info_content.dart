import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/post_widgets/images_section.dart';
import 'package:ideashare/common_widgets/post_widgets/links_section.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/util_widgets/text_chip.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';

class PostInfoContent extends StatelessWidget {
  const PostInfoContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  final double space = 16;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: ConstantWidgets.postVerticalPadding,
      children: <Widget>[
        if (viewModel.post.info.description != null) ...[
          Padding(
            padding: ConstantWidgets.postHorizontalPadding,
            child: buildDescription(context),
          ),
        ],
        if (viewModel.post.info.images != null) ...[
          SizedBox(
            height: space,
          ),
          buildImages(context),
        ],
        if (viewModel.post.info.urlLinks != null) ...[
          SizedBox(
            height: space,
          ),
          Padding(
            padding: ConstantWidgets.postHorizontalPadding,
            child: buildLinks(context),
          ),
        ],
        if (viewModel.post.labels != null) ...[
          SizedBox(
            height: space + 8,
          ),
          Padding(
            padding: ConstantWidgets.postHorizontalPadding,
            child: buildLabels(context),
          ),
        ],
        if (viewModel.post.info.linkedIssue != null) ...[
          SizedBox(
            height: space + 8,
          ),
          Padding(
            padding: ConstantWidgets.postHorizontalPadding,
            child: buildLinkedIssue(context),
          ),
        ],
      ],
    );
  }

  Widget buildDescription(BuildContext context) {
    return SelectableText(
      viewModel.post.info.description,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget buildImages(BuildContext context) {
    return ImagesSection(
      id: "post_info_content",
      displayImage: true,
      imageSize: 250,
      urlImages:
          (viewModel.post.info.images..sort()).map((e) => e.imageUrl).toList(),
      listPadding: ConstantWidgets.postHorizontalPadding,
    );
  }

  Widget buildLinks(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.link,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: LinksSection(
            links: viewModel.post.info.urlLinks,
          ),
        ),
      ],
    );
  }

  Widget buildLabels(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 16,
      runSpacing: 8,
      children: viewModel.post.labels
          .map((label) => TextChip(
                key: Key(label.id),
                title: label.title,
                textSize: 16,
              ))
          .toList(),
    );
  }

  Widget buildLinkedIssue(BuildContext context) {
    //TODO: display linked issue item
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("LINKED ISSUE"),
      ],
    );
  }
}
