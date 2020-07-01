import 'package:flutter/foundation.dart';

class EnumString {
  static String string<T>(T enumItem) {
    if (enumItem == null) return null;
    return describeEnum(enumItem);
  }

  static T fromString<T>(List<T> enumValues, String value) {
    if (value == null || enumValues == null) return null;

    return enumValues.singleWhere(
        (enumItem) =>
            EnumString.string(enumItem)?.toLowerCase() ==
            value?.toLowerCase(),
        orElse: () => null);
  }
}
