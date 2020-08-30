import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/common_widgets.dart';
import 'package:ideashare/common_widgets/post_widgets/language_widget.dart';
import 'package:ideashare/common_widgets/post_widgets/post_actions.dart';
import 'package:ideashare/common_widgets/user_widgets/user_avatar_name.dart';
import 'package:ideashare/common_widgets/util_widgets/text_chip.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class PostHeader extends StatefulWidget {
  PostHeader({
    this.viewModel,
  });

  final PostViewModel viewModel;

  @override
  _PostHeaderState createState() => _PostHeaderState();
}

class _PostHeaderState extends State<PostHeader> {
  PostViewModel get viewModel => this.widget.viewModel;

  Post get post => this.viewModel.post;

  bool _showResume = false;

  int get resumeMaxLines => _showResume ? 100 : 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: buildDescription(context),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  buildInfo(context),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              buildFooter(context),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        buildActions(context),
      ],
    );
  }

  Widget buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          post.info.title,
          style: Theme.of(context).textTheme.headline6.toSemiBold(),
        ),
        SizedBox(
          height: 4,
        ),
        InkWell(
          onTap: () => setState(() {
            this._showResume = !this._showResume;
          }),
          child: Text(
            post.info.resume,
            maxLines: resumeMaxLines,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }

  Widget buildInfo(BuildContext context) {
    return Column(
      children: <Widget>[
        TextChip.category(
          context,
          post.category,
        ),
        if (post.shareOptions.status == Visibleness.everyone) ...[
          SizedBox(
            height: 4,
          ),
          TextChip.status(
            context,
            post.status,
          ),
        ],
        SizedBox(
          height: 4,
        ),
        LanguageWidget(
          languageCode: post.info.language,
          textSize: 16,
          iconSize: 20,
        ),
        SizedBox(
          height: 4,
        ),
        CountIconWidget(
          icon: Icons.visibility,
          count: post.counts.views,
        ),
      ],
    );
  }

  Widget buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        UserAvatarName(
          userId: post.ownerInfo.userId,
          displayName: post.ownerInfo.displayName,
          photoUrl: post.ownerInfo.photoUrl,
          photoSize: 16,
          textSize: 14,
        ),
        DatePrivacyWidget(
          date: post.docTime.createdAt,
          privacy: post.shareOptions.privacy,
          completeDate: true,
        ),
      ],
    );
  }

  Widget buildActions(BuildContext context) {
    return PostActions(
      liked: true,
      likeCount: post.counts.likes,
      followed: false,
      followCount: post.counts.followers,
      worked: false,
      workCount: post.counts.workers,
      line: false,
    );
  }
}
