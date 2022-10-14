import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/bloc/home/home_cubit.dart';
import 'package:qyre_test_app/di/di.dart';
import 'package:qyre_test_app/ui/pages/home/home_tab.dart';
import 'package:qyre_test_app/ui/views/calendar/calendar_day_view.dart';

import '../../test_setup.dart';
import '../../widget_wrapper.dart';

void main([List<String> strings = const []]) {
  if (strings.isEmpty) testSetUp();

  appTest(
    description: 'MainPage - HomeTab',
    testBody: (tester, router) async {
      final calendarFinder = find.byType(CalendarDayView);
      expect(calendarFinder, findsWidgets);
    },
  );
}
