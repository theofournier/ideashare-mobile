import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';

class Validators {
  static bool isEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    String p =
        "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+";
    RegExp regExp = new RegExp(p);
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool validPassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return false;
    }
    return true;
  }

  static String firstNameValidator(String value) {
    if (value.isEmpty) return S.current.errorRequired;
    return null;
  }

  static String lastNameValidator(String value) {
    if (value.isEmpty) return S.current.errorRequired;
    return null;
  }

  static String emailValidator(String value) {
    if (value.isEmpty) return S.current.errorRequired;
    if (!isEmail(value)) return S.current.errorEmailnvalid;
    return null;
  }

  static String passwordValidator(String value) {
    if (value.isEmpty) return S.current.errorRequired;
    if (!validPassword(value)) return S.current.errorPasswordInvalid;
    return null;
  }
}
