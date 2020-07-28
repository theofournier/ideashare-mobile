import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/common_widgets.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_cached_network_image.dart';
import 'package:ideashare/common_widgets/user_widgets/user_avatar_name.dart';
import 'package:ideashare/common_widgets/util_widgets/image_viewer.dart';
import 'package:ideashare/common_widgets/util_widgets/text_chip.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post/post_info_image.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:ideashare/utils/extensions/date_time.dart';

class PostListItem extends StatefulWidget {
  PostListItem({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  _PostListItemState createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  Post get post => widget.post;

  EdgeInsets defaultPadding = const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  );

  bool _showResume = false;

  int get resumeMaxLines => _showResume
      ? 100
      : post.info.images != null && post.info.images.isNotEmpty ? 5 : 10;

  PostInfoImage get firstImage =>
      post.info.images != null && post.info.images.isNotEmpty
          ? (post.info.images..sort()).first
          : null;

  void onTapImage(BuildContext context) {
    List<ImageViewerItem> items = post.info.images
        .map((e) => ImageViewerItem(
              id: e.id,
              resource: CachedNetworkImageProvider(e.imageUrl),
            ))
        .toList();
    ImageViewer.show(
      context: context,
      index: 0,
      items: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("TAP"),
      child: Card(
        color: Colors.white,
        elevation: 0.7,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildHeader(context),
                  SizedBox(
                    height: 8,
                  ),
                  buildInfo(context),
                ],
              ),
            ),
            if (post.info.images != null && post.info.images.isNotEmpty) ...[
              buildImage(context),
            ],
            Padding(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (post.labels != null && post.labels.isNotEmpty) ...[
                    buildLabels(context),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                  buildFooter(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 4,
            children: <Widget>[
              TextChip.category(
                context,
                post.category,
              ),
              if (post.shareOptions.status == Visibleness.everyone) ...[
                TextChip.status(
                  context,
                  post.status,
                ),
              ],
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 4,
          runSpacing: 4,
          children: <Widget>[
            Icon(
              post.shareOptions.privacy == Privacy.public
                  ? Icons.public
                  : Icons.lock_outline,
              color: Theme.of(context).accentColor,
            ),
            if (post.premium) ...[
              PremiumIcon(),
            ],
          ],
        )
      ],
    );
  }

  Widget buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          post.info.title,
          style: Theme.of(context).textTheme.headline6.toSemiBold(),
        ),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () => setState(() {
            this._showResume = !this._showResume;
          }),
          child: Text(
            post.info.resume,
            maxLines: resumeMaxLines,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }

  Widget buildLabels(BuildContext context) {
    int maxLabels = 10;

    return Wrap(
      direction: Axis.horizontal,
      spacing: 8,
      runSpacing: 4,
      children: post.labels
          .getRange(0, post.labels.length >= maxLabels ? maxLabels : post.labels.length)
          .map(
            (e) => TextChip(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 2,
              ),
              title: e.title,
              textSize: 14,
              color: AppColors.greyLight,
              textColor: Theme.of(context).primaryColor,
            ),
          )
          .toList(),
    );
  }

  Widget buildImage(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapImage(context),
      child: CustomCachedNetworkImage(
        imageUrl: firstImage?.imageUrl,
        imageBuilder: (context, imageProvider) => Hero(
          tag: firstImage?.id,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 200,
              maxHeight: 400,
            ),
            child: Image(
              image: imageProvider,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: <Widget>[
        UserAvatarName(
          displayName: post.ownerInfo.displayName,
          photoUrl: post.ownerInfo.photoUrl,
          photoSize: 15,
          textSize: 14,
        ),
        CountIconWidget(
          icon: Icons.visibility,
          count: post.counts.views,
        ),
        Text(
          post.docTime.createdAt.formatyMdhm() ?? "",
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
