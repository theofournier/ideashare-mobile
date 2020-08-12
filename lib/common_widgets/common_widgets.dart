import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/helpers.dart';
import 'package:ideashare/common_widgets/util_widgets/gradient_icon.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/extensions/num.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class PremiumIcon extends StatelessWidget {
  PremiumIcon({
    this.size = 24,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return GradientIcon(
      icon: Icons.bookmark,
      size: size,
      gradient: LinearGradient(
        colors: <Color>[
          AppColors.premiumFirstColor,
          AppColors.premiumSecondColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}

class CountIconWidget extends StatelessWidget {
  CountIconWidget({
    @required this.icon,
    this.count = 0,
    this.textSize = 14,
    this.iconSize = 20,
  });

  final int count;
  final double textSize;
  final double iconSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: Theme.of(context).accentColor,
          size: iconSize,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "${count.format()}",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: textSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class Circle extends StatelessWidget {
  Circle({
    this.size = 20,
    this.color = AppColors.greyDark,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class TextDateAgo extends StatelessWidget {
  const TextDateAgo({
    Key key,
    this.date,
    this.completeDate = false,
    this.numericDates = false,
  }) : super(key: key);

  final DateTime date;
  final bool completeDate;
  final bool numericDates;

  @override
  Widget build(BuildContext context) {
    return Text(
      Helpers.timeAgoSinceDate(
        date,
        completeDate: completeDate,
        numericDates: numericDates,
      ),
      style: Theme.of(context).textTheme.caption.toGrey(),
    );
  }
}

class DatePrivacyWidget extends StatelessWidget {
  const DatePrivacyWidget({
    Key key,
    this.date,
    this.privacy,
    this.completeDate = false,
  }) : super(key: key);

  final DateTime date;
  final Privacy privacy;
  final bool completeDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextDateAgo(
          date: date,
          completeDate: completeDate,
        ),
        SizedBox(
          width: 3,
        ),
        Circle(
          size: 2.5,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          privacy == Privacy.public
              ? Icons.public
              : Icons.lock_outline,
          color: AppColors.greyDark,
          size: 14,
        ),
      ],
    );
  }
}
