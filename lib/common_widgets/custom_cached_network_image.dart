import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage({
    @required this.imageUrl,
    this.imageBuilder,
  });

  final String imageUrl;
  final Function(BuildContext context, ImageProvider imageProvider)
      imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: _buildProgressIndicator,
      errorWidget: _buildErrorWidget,
      imageBuilder: imageBuilder,
    );
  }

  Widget _buildErrorWidget(BuildContext context, String url, dynamic error) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.error,
          color: Theme.of(context).errorColor,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          S.of(context).noImage,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }

  Widget _buildProgressIndicator(
      BuildContext context, String url, downloadProgress) {
    return CircularProgressIndicator(
      value: downloadProgress.progress,
    );
  }
}
