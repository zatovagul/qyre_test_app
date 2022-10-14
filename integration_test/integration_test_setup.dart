import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:integration_test/integration_test.dart';
import 'package:qyre_test_app/di/di.dart';

void testIntegrationSetUpAll([
  Future<void> Function()? body,
]) {
  setUpAll((() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies(const Environment(Environment.test));
    await body?.call();
  }));
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
}

Future<void> move(
  WidgetTester tester,
  Offset downLocation,
  Offset offset,
) async {
  await tester.pump();

  await tester.timedDragFrom(
    downLocation,
    offset,
    const Duration(milliseconds: 800),
  );
  await tester.pumpAndSettle();
}