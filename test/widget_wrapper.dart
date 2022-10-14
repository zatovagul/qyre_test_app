import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qyre_test_app/di/di.dart';
import 'package:qyre_test_app/l10n/generated/app_localizations.dart';
import 'package:qyre_test_app/routes/app_router.dart';
import 'package:qyre_test_app/themes/main_theme.dart';

Widget materialScaffoldWrapper(Widget? body) {
  return MaterialApp(
    theme: mainThemeData,
    home: Scaffold(body: body),
  );
}

Widget materialWrapper(AppRouter router) {
  return MaterialApp.router(
    locale: AppLocalizations.supportedLocales.first,
    theme: mainThemeData,
    routerDelegate: router.delegate(initialRoutes: [
      const MainRoute(),
    ]),
    routeInformationParser: router.defaultRouteParser(),
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
  );
}

void appTestWidget<T extends Widget>({
  String? description,
  required T widget,
  required Future<void> Function(
    WidgetTester tester,
    AppRouter router,
  )
      testBody,
}) {
  testWidgets(
    description ?? widget.runtimeType.toString(),
    (WidgetTester tester) async {
      final router = locator<AppRouter>();
      await _wrapTestBody(
        tester,
        materialWrapper(router),
        Scaffold(body: widget),
        router,
        testBody,
      );
    },
  );
}

void appTestPage<T extends Widget>({
  String? description,
  required T widget,
  required Future<void> Function(
    WidgetTester tester,
    AppRouter router,
  )
      testBody,
}) {
  testWidgets(
    description ?? widget.runtimeType.toString(),
    (WidgetTester tester) async {
      final router = locator<AppRouter>();
      await _wrapTestBody(
        tester,
        materialWrapper(router),
        widget,
        router,
        testBody,
      );
    },
  );
}

void appTest<T extends Widget>({
  String? description,
  required Future<void> Function(
    WidgetTester tester,
    AppRouter router,
  )
      testBody,
}) {
  testWidgets(
    description ?? '',
    (WidgetTester tester) async {
      final router = locator.get<AppRouter>();
      await _wrapTestBody(
        tester,
        materialWrapper(router),
        null,
        router,
        testBody,
      );
    },
  );
}

Future<void> _wrapTestBody(
  WidgetTester tester,
  Widget material,
  Widget? testElement,
  AppRouter router,
  Future<void> Function(WidgetTester tester, AppRouter router) testBody,
) async {
  await tester.runAsync(() async {
    await tester.pumpAndSettle();
    await tester.pumpWidget(material);
    await tester.pump();
    if (testElement != null) router.pushWidget(testElement);
    await tester.pumpAndSettle();
    await testBody(tester, router);
  });
}
