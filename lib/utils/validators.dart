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

  static String firstNameValidator(BuildContext context, String value) {
    if (value.isEmpty) return S.of(context).errorRequired;
    return null;
  }

  static String lastNameValidator(BuildContext context, String value) {
    if (value.isEmpty) return S.of(context).errorRequired;
    return null;
  }

  static String emailValidator(BuildContext context, String value) {
    if (value.isEmpty) return S.of(context).errorRequired;
    if (!isEmail(value)) return S.of(context).errorEmailnvalid;
    return null;
  }

  static String passwordValidator(BuildContext context, String value) {
    if (value.isEmpty) return S.of(context).errorRequired;
    if (!validPassword(value)) return S.of(context).errorPasswordInvalid;
    return null;
  }
}
