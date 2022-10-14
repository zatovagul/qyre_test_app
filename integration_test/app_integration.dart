import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/l10n/generated/app_localizations_en.dart';
import 'package:qyre_test_app/ui/views/calendar/calendar_day_small_view.dart';
import 'package:qyre_test_app/utils/date_util.dart';

import '../test/widget_wrapper.dart';
import 'integration_test_setup.dart';

final localization = AppLocalizationsEn();

void main() {
  testIntegrationSetUpAll();
  appTest(
    description: 'App Integration Test',
    testBody: (tester, router) async {
      final today = DateUtil.today;
      final dayText = DateUtil.getDay(today.add(const Duration(days: 2)));
      final dayFinder = find.text(dayText);

      expect(dayFinder, findsOneWidget);
      await tester.timedDrag(
        dayFinder,
        const Offset(-100, 0),
        const Duration(milliseconds: 500),
      );
      await tester.pumpAndSettle();

      final taskFinder = find.text(localization.completeYourProfileTitle).first;
      expect(taskFinder, findsOneWidget);
      await tester.timedDrag(
        taskFinder,
        const Offset(-100, 0),
        const Duration(milliseconds: 500),
      );
      await tester.pumpAndSettle();

      await move(
        tester,
        const Offset(50, 300),
        const Offset(0, -350),
      );
      await tester.pumpAndSettle();

      final smallFinder = find.byType(CalendarDaySmallView).first;
      await tester.timedDrag(
        smallFinder,
        const Offset(-100, 0),
        const Duration(milliseconds: 500),
      );
      await tester.pumpAndSettle();
    },
  );
}
