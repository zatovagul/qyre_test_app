import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';
import 'generated/app_localizations_en.dart';

export 'generated/app_localizations.dart';

AppLocalizations getLocalizations(BuildContext context) {
  final localizations = AppLocalizations.of(context);
  if (localizations != null) return localizations;
  return AppLocalizationsEn();
}