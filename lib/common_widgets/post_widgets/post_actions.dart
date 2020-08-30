import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_flat_button.dart';
import 'package:ideashare/common_widgets/util_widgets/action_button.dart';
import 'package:ideashare/common_widgets/util_widgets/line.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/extensions/num.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class PostActions extends StatelessWidget {
  const PostActions({
    Key key,
    this.liked = false,
    this.likeCount = 0,
    this.followed = false,
    this.followCount = 0,
    this.worked = false,
    this.workCount = 0,
    this.onLike,
    this.onFollow,
    this.onWork,
    this.line = true,
    this.lineHorizontalSpace = 16,
  }) : super(key: key);

  final bool liked;
  final int likeCount;
  final VoidCallback onLike;
  final bool followed;
  final int followCount;
  final VoidCallback onFollow;
  final bool worked;
  final int workCount;
  final VoidCallback onWork;
  final bool line;
  final double lineHorizontalSpace;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (line) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: lineHorizontalSpace),
            child: Line(
              color: AppColors.greyMedium,
              borderRadius: 6,
            ),
          ),
        ],
        Row(
          children: <Widget>[
            buildButton(
              actionButton: ActionButton.like(
                text: "${likeCount.format()}",
                selected: liked,
                onPressed: onLike ?? () {},
              ),
            ),
            buildButton(
              actionButton: ActionButton.follow(
                text: "${followCount.format()}",
                selected: followed,
                onPressed: onFollow ?? () {},
              ),
            ),
            buildButton(
              actionButton: ActionButton.work(
                text: "${workCount.format()}",
                selected: worked,
                onPressed: onWork ?? () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildButton({
    ActionButton actionButton,
  }) {
    return Expanded(
      child: actionButton,
    );
  }
}
