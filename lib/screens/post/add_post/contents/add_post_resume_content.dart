import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/images_section.dart';
import 'package:ideashare/common_widgets/label_chip.dart';
import 'package:ideashare/common_widgets/line.dart';
import 'package:ideashare/common_widgets/links_section.dart';
import 'package:ideashare/common_widgets/share_options_widget.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/services/models/common/share_option.dart';
import 'package:ideashare/services/models/common/share_options_data.dart';
import 'package:ideashare/utils/category_utils.dart';
import 'package:ideashare/utils/custom_locales.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:ideashare/utils/share_options_utils.dart';

class AddPostResumeContent extends StatelessWidget {
  AddPostResumeContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildInfo(context),
        SizedBox(
          height: 32,
        ),
        buildOptionalInfo(context),
        if (viewModel.post.labels != null &&
            viewModel.post.labels.isNotEmpty) ...[
          SizedBox(
            height: 32,
          ),
          buildLabels(context),
        ],
        if (viewModel.linkedIssue != null) ...[
          SizedBox(
            height: 32,
          ),
          buildLinkedIssue(context),
        ],
        if (viewModel.post.shareOptions != null) ...[
          SizedBox(
            height: 32,
          ),
          buildShareOptions(context),
        ],
      ],
    );
  }

  Widget buildInfo(BuildContext context) {
    TextStyle categoryStyle =
        Theme.of(context).textTheme.headline4.toSemiBold();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          viewModel.post.category != null
              ? CategoryUtils.getCategoryTitle(context)[viewModel.post.category]
              : "",
          style: viewModel.post.category != null
              ? categoryStyle.toColor(CategoryUtils.getCategoryColor(
                  context)[viewModel.post.category])
              : categoryStyle,
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          viewModel.post.info.title ?? "",
          style: Theme.of(context).textTheme.headline5.toMedium().toSize(28),
        ),
        SizedBox(
          height: 16,
        ),
        Text(viewModel.post.info.resume ?? "",
            style: Theme.of(context).textTheme.bodyText1.toSize(20)),
        SizedBox(
          height: 8,
        ),
        Text(viewModel.post.info.description ?? "",
            style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }

  Widget buildOptionalInfo(BuildContext context) {
    double space = 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.language,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              CustomLocales.getLocaleName(viewModel.post.info.language,
                      CustomLocales.nativeLocaleNames) ??
                  "",
              style: Theme.of(context).textTheme.bodyText1.toSize(18),
            ),
          ],
        ),
        SizedBox(
          height: space,
        ),
        if (viewModel.images != null && viewModel.images.isNotEmpty) ...[
          ImagesSection(
            images: viewModel.images,
            displayImage: true,
            imageSize: 170,
            displayFirst: true,
          ),
          SizedBox(
            height: space,
          ),
        ],
        if (viewModel.post.info.urlLinks != null &&
            viewModel.post.info.urlLinks.isNotEmpty) ...[
          LinksSection(
            links: viewModel.post.info.urlLinks,
          ),
          SizedBox(
            height: space,
          ),
        ],
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).accentColor.withOpacity(0.05),
          ),
          child: Text(
            viewModel.postNote.text,
            style: Theme.of(context).textTheme.bodyText1,
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
          .map((label) => LabelChip(
                key: Key(label.id),
                title: label.title,
                textSize: 18,
              ))
          .toList(),
    );
  }

  Widget buildLinkedIssue(BuildContext context) {
    //TODO: display linked issue item
    return Text("LINKED ISSUE");
  }

  Widget buildShareOptions(BuildContext context) {
    List<ShareOptionsData> shareOptionsData = ShareOptionsUtils.getShareOptions(
      context: context,
      postShareOptions: viewModel.post.shareOptions,
      category: viewModel.post.category,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: shareOptionsData
          .asMap()
          .entries
          .map((shareOption) => Container(
                margin: EdgeInsets.only(
                    bottom:
                        shareOption.key < shareOptionsData.length - 1 ? 24 : 0),
                child: shareOptionItem(
                  context: context,
                  shareOptionData: shareOption.value,
                ),
              ))
          .toList(),
    );
  }

  Widget shareOptionItem({
    BuildContext context,
    ShareOptionsData shareOptionData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (shareOptionData.title != null) ...[
          Text(
            shareOptionData.title,
            style: Theme.of(context).textTheme.headline5.toMedium(),
          ),
          SizedBox(
            height: 8,
          ),
        ],
        ...shareOptionData.shareOptions
            .asMap()
            .entries
            .map(
              (shareOption) => Container(
                key: Key(shareOption.value.id),
                margin: EdgeInsets.only(
                    bottom: shareOption.key <
                            shareOptionData.shareOptions.length - 1
                        ? 8
                        : 0),
                child: optionItem(
                  context: context,
                  shareOption: shareOption.value,
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget optionItem({
    BuildContext context,
    ShareOption shareOption,
  }) {
    if (shareOption.visiblenessOptions != null &&
        shareOption.visiblenessOptions.isNotEmpty) {
      return visiblenessItem(
        context: context,
        shareOption: shareOption,
      );
    } else if (shareOption.boolValue != null) {
      return boolItem(
        context: context,
        shareOption: shareOption,
      );
    }
    return Container();
  }

  Widget boolItem({
    BuildContext context,
    ShareOption shareOption,
  }) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            shareOption.title,
            style: Theme.of(context).textTheme.bodyText1.toSemiBold().toSize(18),
          ),
        ),
        if (shareOption.boolValue ?? false) ...[
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.check,
                color: Theme.of(context).accentColor,
                size: 30,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget visiblenessItem({
    BuildContext context,
    ShareOption shareOption,
  }) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            shareOption.title,
            style: Theme.of(context).textTheme.bodyText1.toSemiBold().toSize(18),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            ShareOptionsUtils.getVisiblenessTitle(
                    context)[shareOption.visiblenessValue] ??
                "",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
