import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_cached_network_image.dart';
import 'package:ideashare/generated/l10n.dart';

class DefaultPictureItem extends StatelessWidget {
  DefaultPictureItem({
    this.onTap,
    this.imageUrl,
    this.isSelected,
  });

  final VoidCallback onTap;
  final String imageUrl;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: CustomCachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: _buildImageContent,
          ),
        ),
        if (isSelected)
          _buildSelectedIcon(context),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context, ImageProvider imageProvider) {
    return Card(
      elevation: isSelected ? 6 : 0,
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Ink.image(
        image: imageProvider,
        fit: BoxFit.fill,
        width: 120,
        height: 120,
        child: InkWell(
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _buildSelectedIcon(BuildContext context){
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.check,
          size: 35,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
