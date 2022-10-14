import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/models/enums/day_status.dart';
import 'package:qyre_test_app/ui/views/calendar/calendar_day_view.dart';
import 'package:qyre_test_app/utils/date_util.dart';

import '../../test_setup.dart';
import '../../widget_wrapper.dart';
import '../widget_test.dart';

void main([List<String> strings = const []]) {
  if (strings.isEmpty) testSetUp();

  testWidgets('CalendarDayView', (tester) async {
    await tester.pumpWidget(materialScaffoldWrapper(
      CalendarDayView(
        date: DateUtil.today,
      ),
    ));

    final circleFinder = find.byKey(const Key('circle'));
    expect(circleFinder, findsNothing);

    await tester.pumpWidget(materialScaffoldWrapper(
      CalendarDayView(
        date: DateUtil.today,
        dayStatus: DayStatus.good,
      ),
    ));

    expect(circleFinder, findsOneWidget);

    final todayFinder = find.text(localization.today);
    expect(todayFinder, findsOneWidget);
  });
}
