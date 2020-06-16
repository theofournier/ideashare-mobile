import 'package:flutter/material.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle toWhite() {
    return this.merge(
      TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextStyle toBold() {
    return this.merge(
      TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
