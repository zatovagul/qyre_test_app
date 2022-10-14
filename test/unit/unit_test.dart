import 'package:flutter_test/flutter_test.dart';

import '../test_setup.dart';
import 'services/services_test.dart' as services_test;
import 'utils/date_util_test.dart' as date_util_test;

void main([List<String> strings = const []]) {
  if (strings.isEmpty) testSetUp();

  group('Unit Tests -', () {
    date_util_test.main();
    services_test.main(['']);
  });
}
