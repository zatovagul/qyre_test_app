// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/home/home_cubit.dart' as _i7;
import '../routes/app_router.dart' as _i3;
import '../routes/module/route_module.dart' as _i8;
import '../services/production/production_service.dart' as _i4;
import '../services/production/production_service_dev.dart' as _i5;
import '../services/production/production_service_env_test.dart' as _i6;

const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final routeModule = _$RouteModule();
  gh.lazySingleton<_i3.AppRouter>(() => routeModule.router());
  gh.factory<_i4.ProductionService>(
    () => _i5.ProductionServiceDev(),
    registerFor: {_dev},
  );
  gh.factory<_i4.ProductionService>(
    () => _i6.ProductionServiceDev(),
    registerFor: {_test},
  );
  gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit(get<_i4.ProductionService>()));
  return get;
}

class _$RouteModule extends _i8.RouteModule {}
