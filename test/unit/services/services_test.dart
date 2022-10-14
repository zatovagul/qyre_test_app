import 'package:flutter_test/flutter_test.dart';

import '../../test_setup.dart';
import 'production/production_service_test.dart' as production_service_test;
import 'schedule/schedule_service_test.dart' as schedule_service_test;

void main([List<String> strings = const []]) {
  if (strings.isEmpty) testSetUp();
  group('Service -', () {
    production_service_test.main(['']);
    schedule_service_test.main(['']);
  });
}
