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

  TextStyle toSemiBold() {
    return this.merge(
      TextStyle(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  TextStyle toMedium() {
    return this.merge(
      TextStyle(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  TextStyle underline() {
    return this.merge(
      TextStyle(
        decoration: TextDecoration.underline,
      ),
    );
  }

  TextStyle toSize(double size) {
    return this.merge(
      TextStyle(
        fontSize: size,
      ),
    );
  }
}
