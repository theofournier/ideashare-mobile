import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({
    @required this.auth,
    this.email = "",
    this.password = "",
    this.isLoading = false,
    this.submitted = false,
  });

  final AuthService auth;

  String email;
  String password;
  bool isLoading;
  bool submitted;
}
