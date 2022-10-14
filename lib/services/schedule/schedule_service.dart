import '../../models/schedule/schedule_item_model.dart';

abstract class ScheduleService {
  Future<List<ScheduleItemModel>> getSchedule();
}
