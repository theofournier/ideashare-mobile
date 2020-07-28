import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_flat_button.dart';
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
              context: context,
              text: "${likeCount.format()}",
              icon: OMIcons.thumbUp,
              iconSelected: Icons.thumb_up,
              selected: liked,
              onPressed: onLike ?? () {},
            ),
            buildButton(
              context: context,
              text: "${followCount.format()}",
              icon: OMIcons.personAdd,
              iconSelected: Icons.person_add,
              selected: followed,
              onPressed: onFollow ?? () {},
            ),
            buildButton(
              context: context,
              text: "${workCount.format()}",
              icon: OMIcons.workOutline,
              iconSelected: Icons.work,
              selected: worked,
              onPressed: onWork ?? () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget buildButton({
    BuildContext context,
    String text,
    IconData icon,
    IconData iconSelected,
    bool selected,
    VoidCallback onPressed,
  }) {
    return Expanded(
      child: CustomFlatButton(
        icon: selected ? iconSelected : icon,
        iconSize: 24,
        iconColor:
            selected ? Theme.of(context).accentColor : AppColors.greyDark,
        textColor:
            selected ? Theme.of(context).accentColor : AppColors.greyDark,
        text: text,
        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
        upperCase: false,
        textSize: 16,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        shrinkWrap: true,
        onPressed: onPressed,
      ),
    );
  }
}
