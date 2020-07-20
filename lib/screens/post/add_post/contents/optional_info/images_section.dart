import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/screens/post/add_post/common/add_post_section_title.dart';
import 'package:ideashare/utils/helpers.dart';
import 'package:image_picker/image_picker.dart';

class ImagesSection extends StatelessWidget {
  ImagesSection({
    this.images,
    this.onAddImage,
    this.onDeleteImage,
    this.onTapImage,
  });

  final List<File> images;
  final Function(File image) onAddImage;
  final Function(int index) onDeleteImage;
  final Function(int index) onTapImage;

  final double imageSize = 150;

  Future<void> pickPicture(ImageSource imageSource) async {
    final File croppedPicture = await Helpers.pickPicture(
      imageSource: imageSource,
      crop: true,
    );
    if (croppedPicture != null) {
      onAddImage(croppedPicture);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AddPostSectionTitle(
          title: S.of(context).addPostOptionalInfoImagesTitle,
          description: S.of(context).addPostOptionalInfoImagesDescription,
          onAdd: () => pickPicture(ImageSource.gallery),
        ),
        if (images != null && images.isNotEmpty) ...[
          Container(
            height: imageSize,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: images
                  .asMap()
                  .entries
                  .map((image) => Container(
                        margin: EdgeInsets.only(
                            right: image.key < images.length - 1 ? 8 : 0),
                        child: buildImageItem(
                          context: context,
                          image: image.value,
                          onDelete: () => onDeleteImage(image.key),
                          onTap: () => onTapImage(image.key),
                          isFirst: image.key == 0,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ],
    );
  }

  Widget buildImageItem({
    BuildContext context,
    File image,
    Function onDelete,
    Function onTap,
    bool isFirst,
  }) {
    double radius = 8;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Container(
              height: imageSize,
              width: imageSize,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if(isFirst)...[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.check_circle_outline, color: AppColors.premiumFirstColor,),
              ),
            )
          ],
          Positioned(
            top: -8,
            right: -8,
            child: IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Theme.of(context).errorColor,
              ),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
