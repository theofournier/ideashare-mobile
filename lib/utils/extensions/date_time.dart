import 'package:ideashare/generated/l10n.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String format(DateFormat dateFormat) {
    try {
      return dateFormat.format(this);
    } catch (e) {
      return null;
    }
  }

  String formatFromPattern(String pattern) {
    return format(DateFormat(pattern));
  }

  String formatyMdhm() {
    return format(DateFormat.yMd().add_jm());
  }

  String formatDayMonth() {
    return format(DateFormat.MMMd());
  }

  String formatDayMonthYear() {
    return format(DateFormat.yMMMd());
  }

  String formatTime() {
    return format(DateFormat.jm());
  }

  String formatDayMonthAtTime() {
    return this.formatDayMonth() +
        " ${S.current.timeAgoAt} " +
        this.formatTime();
  }

  String formatDayMonthYearAtTime() {
    return this.formatDayMonthYear() +
        " ${S.current.timeAgoAt} " +
        this.formatTime();
  }

}
