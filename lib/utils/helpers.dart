import 'dart:io';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static void launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Flushbar(
        borderRadius: 8,
        message: S.of(context).invalidUrl,
        margin: const EdgeInsets.all(8),
        icon: Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).errorColor,
        duration: Duration(seconds: 3),
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        shouldIconPulse: false,
      ).show(context);
    }
  }

  static Future<File> pickPicture({
    @required ImageSource imageSource,
    bool crop,
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
