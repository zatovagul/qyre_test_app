import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/di/di.dart';
import 'package:qyre_test_app/models/enums/day_status.dart';
import 'package:qyre_test_app/services/schedule/schedule_service.dart';
import 'package:qyre_test_app/utils/date_util.dart';

import '../../../test_setup.dart';

void main([List<String> strings = const []]) {
  if (strings.isEmpty) testSetUp();

  group('ScheduleService', () {
    test('getSchedule', () async {
      final scheduleService = locator<ScheduleService>();
      final schedule = await scheduleService.getSchedule();
      expect(schedule.length, 2);

      final first = schedule.first;
      expect(first.date, DateUtil.today);
      expect(first.status, DayStatus.bad);
      final second = schedule[1];
      expect(second.status, DayStatus.good);
    });
  });
}
