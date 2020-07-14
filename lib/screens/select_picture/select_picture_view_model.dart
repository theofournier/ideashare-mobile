import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/default_picture.dart';
import 'package:ideashare/services/storage/firebase_storage_result.dart';
import 'package:ideashare/services/storage/firebase_storage_service.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SelectPictureViewModel with ChangeNotifier {
  SelectPictureViewModel({
    @required this.auth,
    @required this.profileDatabase,
    @required this.firebaseStorageService,
  }) {
    this.fetchFirstDefaultPicture();
  }

  final AuthService auth;
  final ProfileDatabase profileDatabase;
  final FirebaseStorageService firebaseStorageService;

  String pictureUrl = "";
  String pictureFileName;
  bool isLoading = false;
  DefaultPicture defaultPicture;
  File pickedPicture;

  void updateWith({
    String pictureUrl,
    String pictureFileName,
    bool isLoading,
    DefaultPicture defaultPicture,
    File pickedPicture,
  }) {
    this.pictureUrl = pictureUrl ?? this.pictureUrl;
    this.pictureFileName = pictureFileName ?? this.pictureFileName;
    this.isLoading = isLoading ?? this.isLoading;
    this.defaultPicture = defaultPicture ?? this.defaultPicture;
    this.pickedPicture = pickedPicture ?? this.pickedPicture;
    notifyListeners();
  }

  Future<void> fetchFirstDefaultPicture() async {
    DefaultPicture defaultPicture =
        await profileDatabase.getFirstDefaultPicture();
    setDefaultPicture(defaultPicture);
  }

  void setDefaultPicture(DefaultPicture defaultPicture) {
    if (defaultPicture != null) {
      pickedPicture = null;
      updateWith(
        pictureUrl: defaultPicture.imageUrl,
        pictureFileName: defaultPicture.name,
        defaultPicture: defaultPicture,
      );
    }
  }

  Future<void> pickPicture(ImageSource imageSource) async {
    final PickedFile pickedPicture =
        await ImagePicker().getImage(source: imageSource);
    if (pickedPicture != null) {
      final File croppedPicture = await cropPicture(File(pickedPicture.path));
      setPickedPicture(croppedPicture);
    }
  }

  Future<File> cropPicture(File picture) async {
    return await ImageCropper.cropImage(
      sourcePath: picture.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      cropStyle: CropStyle.circle,
    );
  }

  void setPickedPicture(File picture) {
    if (picture != null) {
      pictureUrl = null;
      pictureFileName = null;
      defaultPicture = null;
      updateWith(
        pickedPicture: picture,
      );
    }
  }

  Future<bool> save() async {
    updateWith(isLoading: true);

    FirebaseStorageResult firebaseStorageResult;
    if (pickedPicture != null) {
      firebaseStorageResult = await firebaseStorageService.uploadFile(
        fileToUpload: pickedPicture,
        title: profileDatabase.uid,
        path: StorageKeys.userPictures,
      );
      pictureUrl = firebaseStorageResult.fileUrl;
      pictureFileName = firebaseStorageResult.fileName;
    }
    //Fetch first default picture if none selected
    else if (defaultPicture == null &&
        pictureUrl == null &&
        pictureUrl.isEmpty) {
      await fetchFirstDefaultPicture();
    }

    if (pictureUrl != null && pictureUrl.isNotEmpty) {
      await auth.updateInfo(
        photoUrl: pictureUrl,
      );
      await profileDatabase.setProfilePhotoUrl(
        photoUrl: pictureUrl,
        photoFileName: pictureFileName,
      );
    }

    updateWith(isLoading: false);
    return true;
  }
}
