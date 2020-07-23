import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/image_viewer.dart';
import 'package:ideashare/common_widgets/section_title.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/helpers.dart';
import 'package:image_picker/image_picker.dart';

class ImagesSection extends StatelessWidget {
  ImagesSection({
    this.id,
    this.images,
    this.onAddImage,
    this.onDeleteImage,
    this.onDoubleTapImage,
    this.displayImage = false,
    this.imageSize = 150,
    this.isSectionTitle = false,
    this.sectionTitle,
    this.sectionDescription,
    this.displayFirst = false,
  });

  final String id;
  final List<File> images;
  final Function(File image) onAddImage;
  final Function(int index) onDeleteImage;
  final Function(int index) onDoubleTapImage;
  final bool displayImage;
  final double imageSize;
  final bool isSectionTitle;
  final String sectionTitle;
  final String sectionDescription;
  final bool displayFirst;

  Future<void> pickPicture(ImageSource imageSource) async {
    final File croppedPicture = await Helpers.pickPicture(
      imageSource: imageSource,
    );
    if (croppedPicture != null) {
      onAddImage(croppedPicture);
    }
  }

  void onTap(BuildContext context, int index) {
    List<ImageViewerItem> items = images
        .asMap()
        .entries
        .map((e) => ImageViewerItem(
              id: id + e.key.toString(),
              resource: Image.file(e.value).image,
            ))
        .toList();
    ImageViewer.show(
      context: context,
      index: index,
      items: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (isSectionTitle) ...[
          SectionTitle(
            title: sectionTitle ?? S.of(context).imagesSectionTitle,
            description: sectionDescription,
            onAdd: () => pickPicture(ImageSource.gallery),
          ),
        ],
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
                          id: id + image.key.toString(),
                          image: image.value,
                          onDelete: onDeleteImage != null
                              ? () => onDeleteImage(image.key)
                              : null,
                          onTap: displayImage
                              ? () => onTap(context, image.key)
                              : null,
                          onDoubleTap: onDoubleTapImage != null
                              ? () => onDoubleTapImage(image.key)
                              : null,
                          isFirst: displayFirst && image.key == 0,
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
    String id,
    File image,
    Function onDelete,
    Function onTap,
    Function onDoubleTap,
    bool isFirst,
  }) {
    double radius = 8;

    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Hero(
        tag: id,
        child: Material(
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
              if (isFirst) ...[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: AppColors.premiumFirstColor,
                    ),
                  ),
                )
              ],
              if (onDelete != null) ...[
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
            ],
          ),
        ),
      ),
    );
  }
}
