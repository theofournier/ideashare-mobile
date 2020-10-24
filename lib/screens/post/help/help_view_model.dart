import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/alert_dialogs/platform_alert_dialog.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';
import 'package:ideashare/services/models/post/post/post_info_image.dart';
import 'package:ideashare/services/models/post/post_help/post_help.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:ideashare/services/storage/firebase_storage_result.dart';
import 'package:ideashare/services/storage/firebase_storage_service.dart';
import 'package:ideashare/utils/custom_locales.dart';

enum HelpAction {
  delete,
  save,
}

class HelpViewModel with ChangeNotifier {
  HelpViewModel({
    @required this.postDatabase,
    @required this.currentUser,
    @required this.firebaseStorageService,
    this.postId,
    this.helpId,
    this.initialHelp,
  }) {
    this.copyInitialHelp(initialHelp);
  }

  final PostDatabase postDatabase;
  final User currentUser;
  final FirebaseStorageService firebaseStorageService;

  final String postId;
  final String helpId;
  final PostHelp initialHelp;
  PostHelp help;

  List<File> images = [];

  List<MapEntry<String, String>> languages =
      CustomLocales.localeNamesSortedByName(
          CustomLocales.nativeLocaleNamesWithoutRegion);
  List<String> popularLanguageCodes = CustomLocales.popularLocaleCodes;

  String get getHelpId => this.help?.id ?? this.helpId;

  bool isLoadingSave = false;
  bool isLoadingUploadImages = false;
  bool isLoadingSaveHelp = false;

  final formKey = GlobalKey<FormState>();

  void updateWith({
    PostHelp help,
    List<File> images,
    bool isLoadingSave,
    bool isLoadingUploadImages,
    bool isLoadingSaveHelp,
  }) {
    this.help = help ?? this.help;
    this.images = images ?? this.images;
    this.isLoadingSave = isLoadingSave ?? this.isLoadingSave;
    this.isLoadingUploadImages =
        isLoadingUploadImages ?? this.isLoadingUploadImages;
    this.isLoadingSaveHelp = isLoadingSaveHelp ?? this.isLoadingSaveHelp;
    notifyListeners();
  }

  void copyInitialHelp(PostHelp initialHelp) {
    if (initialHelp != null) {
      this.help = PostHelp.fromMap(initialHelp.id, initialHelp.toMap());
    } else {
      this.help = PostHelp();
    }
  }

  Future<bool> showDeleteAlertDialog(BuildContext context) async {
    if (isLoadingSave) {
      return false;
    }
    return await PlatformAlertDialog(
      defaultActionText: S.of(context).delete,
      title: S.of(context).helpDeleteAlertTitle,
      cancelActionText: S.of(context).cancel,
      content: S.of(context).helpAlertDeleteMessage,
    ).show(context);
  }

  Future<bool> saveHelp(BuildContext context) async {
    bool success = false;
    if (!formKey.currentState.validate()) {
      return false;
    }
    formKey.currentState.save();

    bool result = await PlatformAlertDialog(
      defaultActionText: S.of(context).save,
      title: S.of(context).helpAlertTitle,
      cancelActionText: S.of(context).cancel,
      content: S.of(context).helpAlertMessage,
    ).show(context);
    if (result != null && result) {
      try {
        updateWith(
          isLoadingSave: true,
        );
        //TODO: add approval
        if (initialHelp != null) {
          help.docTime.updatedAt = Timestamp.now().toDate();
          //TODO: Edit images
          await postDatabase.setPostHelp(postId, help);
        } else {
          //STORAGE
          List<FirebaseStorageResult> storageResults;
          if (images != null && images.isNotEmpty) {
            updateWith(isLoadingUploadImages: true);
            storageResults = await firebaseStorageService.uploadMultipleFiles(
              files: images,
              uid: getHelpId,
              path: StorageKeys.helpImages,
            );
            updateWith(isLoadingUploadImages: false);
          }

          //HELP IMAGES
          updateWith(isLoadingSaveHelp: true);
          if (storageResults != null) {
            storageResults.asMap().forEach((key, value) {
              help.info.images.add(PostInfoImage(
                id: value.fileName,
                order: key,
                imageUrl: value.fileUrl,
              ));
            });
          }

          //INIT HELP
          help.ownerInfo = OwnerInfo.fromUser(currentUser);
          help.docTime = DocTime.init();

          //SAVE HELP
          await postDatabase.addPostHelp(postId, help);
          updateWith(isLoadingSaveHelp: false);
        }
        Navigator.of(context).pop(HelpAction.save);
        success = true;
      } catch (e) {
        print("ERROR SAVE HELP: ${e}");
      } finally {
        updateWith(
          isLoadingSave: false,
          isLoadingUploadImages: false,
          isLoadingSaveHelp: false,
        );
      }
    }
    return success;
  }

  Future<bool> deleteHelp(BuildContext context) async {
    bool success = false;
    try {
      updateWith(isLoadingSave: true);
      await postDatabase.deletePostHelp(postId, getHelpId);
      Navigator.of(context).pop(HelpAction.delete);
      success = true;
    } catch (e) {
      print("ERROR DELETE HELP: ${e}");
    } finally {
      updateWith(isLoadingSave: false);
    }
    return success;
  }
}
