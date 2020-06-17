import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';

class SelectPictureViewModel with ChangeNotifier {
  SelectPictureViewModel({
    @required this.auth,
    this.pictureUrl = "",
    this.isLoading = false,
  });

  final AuthService auth;

  String pictureUrl;
  bool isLoading;

  void updateWith({
    String pictureUrl,
    bool isLoading,
    bool submitted,
  }) {
    this.pictureUrl = pictureUrl ?? this.pictureUrl;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }

  void onSavePictureUrl(String pictureUrl) => this.updateWith(pictureUrl: pictureUrl);

  Future<bool> submit() async {

    updateWith(isLoading: true);
    //TODO: call auth
    await Future.delayed(const Duration(seconds: 2));
    updateWith(isLoading: false);
  }
}
