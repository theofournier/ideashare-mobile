import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/post_widgets/images_section.dart';
import 'package:ideashare/common_widgets/post_widgets/links_section.dart';
import 'package:ideashare/common_widgets/util_widgets/line.dart';
import 'package:ideashare/common_widgets/util_widgets/text_chip.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/services/models/common/share_option.dart';
import 'package:ideashare/services/models/common/share_options_data.dart';
import 'package:ideashare/utils/category_utils.dart';
import 'package:ideashare/utils/custom_locales.dart';
import 'package:ideashare/utils/enum_string.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:ideashare/utils/share_options_utils.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class AddPostResumeContent extends StatelessWidget {
  AddPostResumeContent({this.viewModel});

  final AddPostViewModel viewModel;

  void onTap(AddPostStep addPostStep) {
    viewModel.goToStep(addPostStep);
  }

  @override
  Widget build(BuildContext context) {
    double space = 32;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildCategory(context),
        SizedBox(
          height: space,
        ),
        buildInfo(context),
        SizedBox(
          height: space,
        ),
        buildOptionalInfo(context),
        if (viewModel.post.labels != null &&
            viewModel.post.labels.isNotEmpty) ...[
          SizedBox(
            height: space,
          ),
          buildLabels(context),
        ],
        if (viewModel.linkedIssue != null) ...[
          SizedBox(
            height: space,
          ),
          buildLinkedIssue(context),
        ],
        if (viewModel.post.shareOptions != null) ...[
          SizedBox(
            height: space,
          ),
          buildShareOptions(context),
        ],
      ],
    );
  }

  Widget buildSectionTitle({
    BuildContext context,
    String title,
    VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Icon(
                Icons.arrow_right,
                color: Theme.of(context).accentColor,
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Line(),
        ],
      ),
    );
  }

  //region Category
  Widget buildCategory(BuildContext context) {
    TextStyle categoryStyle =
        Theme.of(context).textTheme.headline3.toSemiBold();
    return InkWell(
      onTap: () => onTap(AddPostStep.category),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            viewModel.post.category != null
                ? CategoryUtils.getCategoryTitle(
                    context)[viewModel.post.category]
                : "",
            style: viewModel.post.category != null
                ? categoryStyle.toColor(CategoryUtils.getCategoryColor(
                    context)[viewModel.post.category])
                : categoryStyle,
          ),
        ],
      ),
    );
  }

  //endregion

  //region Info
  Widget buildInfo(BuildContext context) {
    return InkWell(
      onTap: () => onTap(AddPostStep.info),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SelectableText(
            viewModel.post.info.title ?? "",
            style: Theme.of(context).textTheme.headline5.toMedium().toSize(28),
          ),
          SizedBox(
            height: 16,
          ),
          SelectableText(
            viewModel.post.info.resume ?? "",
            style: Theme.of(context).textTheme.bodyText1.toSize(18),
          ),
          if (viewModel.post.info.description != null) ...[
            SizedBox(
              height: 16,
            ),
            SelectableText(
              viewModel.post.info.description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ],
      ),
    );
  }

  //endregion

  //region Optional Info
  Widget buildOptionalInfo(BuildContext context) {
    double space = 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildSectionTitle(
          context: context,
          title: S.of(context).addPostTitleOptionalInfo,
          onTap: () => onTap(AddPostStep.optionalInfo),
        ),
        SizedBox(
          height: 16,
        ),
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
              style:
                  Theme.of(context).textTheme.bodyText1.toSize(20).toMedium(),
            ),
          ],
        ),
        if (viewModel.images != null && viewModel.images.isNotEmpty) ...[
          SizedBox(
            height: space,
          ),
          ImagesSection(
            id: EnumString.string(AddPostStep.resume),
            images: viewModel.images,
            displayImage: true,
            imageSize: 170,
            displayFirst: true,
          ),
        ],
        if (viewModel.post.info.urlLinks != null &&
            viewModel.post.info.urlLinks.isNotEmpty) ...[
          SizedBox(
            height: space,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.link,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: LinksSection(
                  links: viewModel.post.info.urlLinks,
                ),
              ),
            ],
          ),
        ],
        if (viewModel.postNote != null &&
            viewModel.postNote.text != null &&
            viewModel.postNote.text.isNotEmpty) ...[
          SizedBox(
            height: space,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).accentColor.withOpacity(0.05),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  OMIcons.note,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: SelectableText(
                    viewModel.postNote.text,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  //endregion

  //region Labels
  Widget buildLabels(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildSectionTitle(
          context: context,
          title: S.of(context).addPostTitleLabels,
          onTap: () => onTap(AddPostStep.labels),
        ),
        SizedBox(
          height: 16,
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 16,
          runSpacing: 8,
          children: viewModel.post.labels
              .map((label) => TextChip(
                    key: Key(label.id),
                    title: label.title,
                    textSize: 18,
                  ))
              .toList(),
        ),
      ],
    );
  }

  //endregion

  //region Linked issue
  Widget buildLinkedIssue(BuildContext context) {
    //TODO: display linked issue item
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildSectionTitle(
          context: context,
          title: S.of(context).addPostTitleLinkedIssue,
          onTap: () => onTap(AddPostStep.linkedIssue),
        ),
        SizedBox(
          height: 16,
        ),
        Text("LINKED ISSUE"),
      ],
    );
  }

  //endregion

  //region Share options
  Widget buildShareOptions(BuildContext context) {
    List<ShareOptionsData> shareOptionsData = ShareOptionsUtils.getShareOptions(
      context: context,
      postShareOptions: viewModel.post.shareOptions,
      category: viewModel.post.category,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSectionTitle(
          context: context,
          title: S.of(context).addPostTitleShareOptions,
          onTap: () => onTap(AddPostStep.shareOptions),
        ),
        SizedBox(
          height: 16,
        ),
        ...shareOptionsData
            .asMap()
            .entries
            .map((shareOption) => Container(
                  margin: EdgeInsets.only(
                      bottom: shareOption.key < shareOptionsData.length - 1
                          ? 24
                          : 0),
                  child: shareOptionItem(
                    context: context,
                    shareOptionData: shareOption.value,
                  ),
                ))
            .toList(),
      ],
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
            style: Theme.of(context).textTheme.headline6.toSize(16),
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
            style:
                Theme.of(context).textTheme.bodyText1.toSemiBold().toSize(18),
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
            style:
                Theme.of(context).textTheme.bodyText1.toSemiBold().toSize(18),
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
//endregion
}
