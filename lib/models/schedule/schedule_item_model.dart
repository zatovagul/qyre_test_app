import 'package:equatable/equatable.dart';

import '../enums/day_status.dart';

class ScheduleItemModel extends Equatable {
  final DateTime date;
  final DayStatus status;

  const ScheduleItemModel(this.date, this.status);

  @override
  List<Object> get props => [date, status];

  ScheduleItemModel copyWith({
    DateTime? date,
    DayStatus? status,
  }) {
    return ScheduleItemModel(
      date ?? this.date,
      status ?? this.status,
    );
  }
}
