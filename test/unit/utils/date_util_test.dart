import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/utils/date_util.dart';

void main() {
  group('DateUtil -', () {
    test('isToday', () {
      final now = DateTime.now();
      final today = DateUtil.today;
      expect(now.year, today.year);
      expect(now.month, today.month);
      expect(now.day, today.day);
    });

    final date = DateTime(2022, 8, 2);
    test('getWeekDay', () {
      final formattedString = DateUtil.getWeekDay(date);
      expect(formattedString, 'Tue');
    });
    test('getMonth', () {
      final formattedString = DateUtil.getMonth(date);
      expect(formattedString, 'Aug');
    });
    test('getDay', () {
      final formattedString = DateUtil.getDay(date);
      expect(formattedString, '2');
    });
    test('getDate', () {
      final formattedString = DateUtil.getDate(date);
      expect(formattedString, 'Aug 2, 2022');
    });
  });
}
