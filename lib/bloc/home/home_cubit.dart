import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../models/enums/day_status.dart';
import '../../models/production/production_model.dart';
import '../../services/production/production_service.dart';
import '../../services/schedule/schedule_service.dart';
import '../base/base_cubit.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  final ProductionService _productionService;
  final ScheduleService _scheduleService;
  HomeCubit(this._productionService, this._scheduleService)
      : super(const HomeState());

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  void init() {
    _getProductions();
    _getSchedule();
  }

  void _getProductions() async {
    await performSafeAction(() async {
      emit(state.copyWith(
        productions: await _productionService.getProductions(),
      ));
    });
  }

  void _getSchedule() async {
    await performSafeAction(() async {
      final schedule = await _scheduleService.getSchedule();
      final Map<DateTime, DayStatus> scheduleMap = {};
      for (var day in schedule) {
        scheduleMap[day.date] = day.status;
      }
      emit(state.copyWith(schedule: scheduleMap));
    });
  }
}
