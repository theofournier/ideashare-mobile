import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/gradient_icon.dart';
import 'package:ideashare/resources/theme.dart';

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
        SizedBox(width: 4,),
        Text(
          "$count",
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
