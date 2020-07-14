import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/default_picture.dart';

class SelectPictureViewModel with ChangeNotifier {
  SelectPictureViewModel({
    @required this.auth,
    @required this.profileDatabase,
    this.pictureUrl = "",
    this.pictureFileName = "",
    this.isLoading = false,
  }) {
    this.fetchFirstDefaultPicture();
  }

  final AuthService auth;
  final ProfileDatabase profileDatabase;

  String pictureUrl;
  String pictureFileName;
  bool isLoading;
  DefaultPicture defaultPicture;

  void updateWith({
    String pictureUrl,
    String pictureFileName,
    bool isLoading,
    DefaultPicture defaultPicture,
  }) {
    this.pictureUrl = pictureUrl ?? this.pictureUrl;
    this.pictureFileName = pictureFileName ?? this.pictureFileName;
    this.isLoading = isLoading ?? this.isLoading;
    this.defaultPicture = defaultPicture ?? this.defaultPicture;
    notifyListeners();
  }

  Future<void> fetchFirstDefaultPicture() async {
    DefaultPicture defaultPicture =
        await profileDatabase.getFirstDefaultPicture();
    if (defaultPicture != null) {
      updateWith(
        pictureUrl: defaultPicture.imageUrl,
        pictureFileName: defaultPicture.name,
        defaultPicture: defaultPicture,
      );
    }
  }

  Future<bool> save() async {
    updateWith(isLoading: true);
    //Fetch first default picture if none selected
    if(defaultPicture == null && pictureUrl == null && pictureUrl.isEmpty){
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
