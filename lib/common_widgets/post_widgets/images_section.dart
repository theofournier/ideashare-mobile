import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/alert_dialogs/alert_dialog_list_tile.dart';
import 'package:ideashare/common_widgets/post_widgets/section_title.dart';
import 'package:ideashare/common_widgets/util_widgets/image_viewer.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

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

  Future<void> pickPicture(BuildContext context) async {
    ImageSource imageSource = await AlertDialogListTile(
      listTiles: [
        AlertDialogListTileData<ImageSource>(
          title: S.of(context).imageSectionCameraTitle,
          icon: OMIcons.photoCamera,
          value: ImageSource.camera,
        ),
        AlertDialogListTileData<ImageSource>(
          title: S.of(context).imageSectionGalleryTitle,
          icon: OMIcons.collections,
          value: ImageSource.gallery,
        ),
      ],
    ).show<ImageSource>(context);
    if (imageSource != null) {
      final File pickedPicture = await Helpers.pickPicture(
        imageSource: imageSource,
      );
      if (pickedPicture != null) {
        onAddImage(pickedPicture);
      }
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
            onAdd: () => pickPicture(context),
          ),
        ],
        if (images != null && images.isNotEmpty) ...[
          Container(
            height: imageSize,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) => buildImageItem(
                context: context,
                id: id + index.toString(),
                image: images[index],
                onDelete:
                    onDeleteImage != null ? () => onDeleteImage(index) : null,
                onTap: displayImage ? () => onTap(context, index) : null,
                onDoubleTap: onDoubleTapImage != null
                    ? () => onDoubleTapImage(index)
                    : null,
                isFirst: displayFirst && index == 0,
              ),
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
