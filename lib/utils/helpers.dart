import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/utils/flushbar_utils.dart';
import 'package:ideashare/utils/extensions/date_time.dart';
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

  static String timeAgoSinceDate(
    DateTime date, {
    bool numericDates = false,
  }) {
    if (date == null) return "";

    final S s = S.current;

    final currentDate = DateTime.now();
    final difference = currentDate.difference(date);

    if (difference.inSeconds < 3) {
      return s.timeAgoJustNow;
    } else if (difference.inMinutes < 1) {
      return s.timeAgoSec(difference.inSeconds);
    } else if (difference.inHours < 1) {
      return s.timeAgoMin(difference.inMinutes);
    } else if (difference.inDays < 1) {
      return s.timeAgoHr(difference.inHours);
    } else if (difference.inDays < 2 && !numericDates) {
      return s.timeAgoYesterday;
    } else if (difference.inDays < 7) {
      return s.timeAgoDay(difference.inDays);
    } else if ((difference.inDays / 7).floor() < 2 && !numericDates) {
      return s.timeAgoLastWeek;
    } else if ((difference.inDays / 30).floor() < 1) {
      int week = (difference.inDays / 30).floor();
      return s.timeAgoWeek(week);
    } else if ((difference.inDays / 30).floor() < 2) {
      int month = (difference.inDays / 30).floor();
      return (numericDates)
          ? s.timeAgoMo(month)
          : s.timeAgoLastMonth;
    } else if (date.year == currentDate.year) {
      return date.formatDayMonth() +
          " ${s.timeAgoAt} " +
          date.formatTime();
    } else {
      return date.formatDayMonthYear() +
          " ${s.timeAgoAt} " +
          date.formatTime();
    }
  }
}
