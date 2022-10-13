import 'package:intl/intl.dart';

class DateUtil {
  static DateTime get today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static bool isToday(DateTime date) {
    return date.difference(today) == const Duration();
  }

  static String getWeekDay(DateTime date) => _weekDayFormat.format(date);
  static String getMonth(DateTime date) => _monthFormat.format(date);
  static String getDay(DateTime date) => _dayFormat.format(date);

  static final _weekDayFormat = DateFormat.E();
  static final _monthFormat = DateFormat.MMM();
  static final _dayFormat = DateFormat.d();
}
