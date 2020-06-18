import 'package:flutter/foundation.dart';

class EnumString {
  static String toString<T>(T enumItem) {
    if (enumItem == null) return null;
    return describeEnum(enumItem);
  }

  static T fromString<T>(List<T> enumValues, String value) {
    if (value == null || enumValues == null) return null;

    return enumValues.singleWhere(
        (enumItem) =>
            EnumString.toString(enumItem)?.toLowerCase() ==
            value?.toLowerCase(),
        orElse: () => null);
  }
}
