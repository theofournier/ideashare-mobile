import 'package:flutter/material.dart';

class Label {
  Label({
    this.id,
    this.title,
    this.icon,
    this.subLabels,
  });

  final String id;
  final String title;
  final IconData icon;
  final List<Label> subLabels;

  factory Label.fromMap(String id, Map<String, dynamic> json) {
    if (json == null) return null;

    int iconCodePoint = json['iconCodePoint'];
    String iconFontFamily = json['iconFontFamily'];
    String iconFontPackage = json['iconFontPackage'];
    IconData icon;
    if (iconCodePoint != null && iconFontFamily != null) {
      icon = IconData(
        iconCodePoint,
        fontFamily: iconFontFamily,
        fontPackage: iconFontPackage,
      );
    }

    return Label(
      id: id,
      title: json['title'] as String,
      icon: icon,
      subLabels: json['subLabels'] == null ||
              (json['subLabels'] as Map<String, dynamic>).length == 0
          ? []
          : (json['subLabels'] as Map<String, dynamic>)
              ?.entries
              ?.map(
                (e) => Label.fromMap(e.key, e.value as Map<String, dynamic>),
              )
              ?.toList(),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': this.title,
        'iconCodePoint': this.icon?.codePoint,
        'iconFontFamily': this.icon?.fontFamily,
        'iconFontPackage': this.icon?.fontPackage,
        'subLabels': subLabels == null
            ? null
            : {for (Label label in subLabels) label.id: label.toMap()},
      };
}
