import 'package:flutter/cupertino.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:ideashare/utils/extensions/string.dart';

class CustomLocales {

  static List<String> popularLocaleCodes = ["en", "fr", "es", "de"];

  static Map<String, String> nativeLocaleNames =
      LocaleNamesLocalizationsDelegate.nativeLocaleNames
          .map((key, value) => MapEntry(key, value.capitalize()));

  static Map<String, String> nativeLocaleNamesWithoutRegion = nativeLocaleNames
    ..removeWhere((k, v) => k.contains("_"));

  static Map<String, String> localizedNames(
      BuildContext context, Map<String, String> data) {
    return data.map(
        (key, value) => MapEntry(key, LocaleNames.of(context).nameOf(key)));
  }

  static List<MapEntry<String, String>> localizedNamesSortedByName(
      BuildContext context, Map<String, String> data) {
    return localeNamesSortedByName(localizedNames(context, data));
  }

  static List<MapEntry<String, String>> localeNamesSortedByName(
      Map<String, String> data) {
    return data.entries.toList()..sort((a, b) => a.value.compareTo(b.value));
  }

  static String getLocaleName(String localCode, Map<String, String> data){
    return data.containsKey(localCode) ? data[localCode] : null;
  }
}
