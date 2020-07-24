import 'dart:io';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/utils/flushbar_utils.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static void launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      FlushbarUtils(
        context,
        type: FlushbarType.error,
        message: S.of(context).invalidUrl,
      ).show();
    }
  }

  static Future<File> pickPicture({
    @required ImageSource imageSource,
    bool crop = false,
    CropStyle cropStyle,
    CropAspectRatio cropAspectRatio,
  }) async {
    final PickedFile pickedPicture =
        await ImagePicker().getImage(source: imageSource);
    if (pickedPicture != null) {
      if (crop) {
        return await cropPicture(
          picture: File(pickedPicture.path),
          cropStyle: cropStyle,
        );
      }
      return File(pickedPicture.path);
    }
    return null;
  }

  static Future<File> cropPicture({
    @required File picture,
    CropStyle cropStyle = CropStyle.rectangle,
    CropAspectRatio cropAspectRatio,
  }) async {
    return await ImageCropper.cropImage(
      sourcePath: picture.path,
      aspectRatio: cropAspectRatio,
      cropStyle: cropStyle,
    );
  }
}
