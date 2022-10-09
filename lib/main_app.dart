import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'di/di.dart';
import 'routes/app_router.dart';
import 'themes/main_theme.dart';
import 'l10n/generated/app_localizations.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: mainThemeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: AppLocalizations.supportedLocales.first,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
