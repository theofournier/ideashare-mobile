import 'package:flutter/material.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/default_picture.dart';

class DefaultPictureViewModel with ChangeNotifier {
  DefaultPictureViewModel({
    @required this.profileDatabase,
    this.initialDefaultPicture,
  }) {
    this.fetchDefaultPictures();
  }

  final ProfileDatabase profileDatabase;
  final DefaultPicture initialDefaultPicture;

  bool isLoading = false;
  List<DefaultPicture> defaultPictures = [];
  DefaultPicture selectedDefaultPicture;

  void updateWith(
      {bool isLoading,
      List<DefaultPicture> defaultPictures,
      DefaultPicture selectedDefaultPicture}) {
    this.isLoading = isLoading ?? this.isLoading;
    this.defaultPictures = defaultPictures ?? this.defaultPictures;
    this.selectedDefaultPicture =
        selectedDefaultPicture ?? this.selectedDefaultPicture;
    notifyListeners();
  }

  Future<void> fetchDefaultPictures() async {
    updateWith(isLoading: true);
    List<DefaultPicture> defaultPictures =
        await profileDatabase.getDefaultPictures();
    updateWith(isLoading: false, defaultPictures: defaultPictures);

    if(initialDefaultPicture != null && defaultPictures.length > 0){
      DefaultPicture selectedDefaultPicture = defaultPictures.firstWhere((defaultPicture) => defaultPicture.id == initialDefaultPicture.id, orElse: null);
      if(selectedDefaultPicture != null){
        updateWith(selectedDefaultPicture: selectedDefaultPicture);
      }
    }
  }

}
