import 'package:intl/intl.dart';

extension NumExtensions on num {
  String format() {
    try {
      return NumberFormat().format(this);
    } catch (e) {
      return this.toString();
    }
  }
}
