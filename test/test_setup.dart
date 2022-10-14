import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:qyre_test_app/di/di.dart';

void testSetUp() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    configureDependencies(const Environment(Environment.test));
    HttpOverrides.global = null;
  });
}
