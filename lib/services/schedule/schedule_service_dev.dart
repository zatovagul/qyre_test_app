import 'package:injectable/injectable.dart';

import '../../models/enums/day_status.dart';
import '../../models/schedule/schedule_item_model.dart';
import '../../utils/date_util.dart';
import 'schedule_service.dart';

@Injectable(as: ScheduleService, env: [Environment.dev])
class ScheduleServiceDev extends ScheduleService {
  @override
  Future<List<ScheduleItemModel>> getSchedule() async{
    final today = DateUtil.today;
    final schedule = [
      ScheduleItemModel(today, DayStatus.bad),
      ScheduleItemModel(today.add(const Duration(days: 1)), DayStatus.good),
      ScheduleItemModel(today.add(const Duration(days: 3)), DayStatus.bad),
    ];
    return schedule;
  }
}
