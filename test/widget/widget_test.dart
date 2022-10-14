import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/l10n/generated/app_localizations_en.dart';

import '../test_setup.dart';
import 'calendar/calendar_day_view_test.dart' as calendar_day_view_test;

final localization = AppLocalizationsEn();

void main([List<String> strings = const []]) {
  if (strings.isEmpty) testSetUp();

  group('Widget test', () {
    calendar_day_view_test.main(['']);
  });
}
