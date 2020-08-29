import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_cached_network_image.dart';
import 'package:ideashare/resources/theme.dart';

class UserAvatarName extends StatelessWidget {
  UserAvatarName({
    Key key,
    this.photoUrl = "",
    this.photoSize = 24,
    @required this.displayName,
    this.textSize = 16,
    this.fontWeight = FontWeight.normal,
    this.textColor = AppColors.greyDark,
  }) : super(key: key);

  final String photoUrl;
  final double photoSize;
  final String displayName;
  final double textSize;
  final FontWeight fontWeight;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomCachedNetworkImage(
          imageUrl: photoUrl ?? "",
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            maxRadius: photoSize,
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.account_circle,
            color: textColor,
            size: photoSize * 1.5,
          ),
          loadingSize: photoSize,
          showLoading: false,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          displayName,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
