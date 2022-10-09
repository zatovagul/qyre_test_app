import 'package:injectable/injectable.dart';

import '../app_router.dart';

@module
abstract class RouteModule {
  @lazySingleton
  AppRouter router() => AppRouter();
}
