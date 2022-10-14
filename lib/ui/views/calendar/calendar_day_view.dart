import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../models/enums/day_status.dart';
import '../../../utils/date_util.dart';

class CalendarDayView extends StatelessWidget {
  final DateTime date;
  final DayStatus? dayStatus;
  const CalendarDayView({
    super.key,
    required this.date,
    this.dayStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Center(
      child: Container(
        width: 62,
        constraints: const BoxConstraints(maxHeight: 112),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildToday(context),
            Text(
              DateUtil.getWeekDay(date),
              style: textTheme.subtitle1,
            ),
            const SizedBox(height: 2),
            Text(
              DateUtil.getMonth(date),
              style: textTheme.subtitle2,
            ),
            const SizedBox(height: 2),
            Text(
              DateUtil.getDay(date),
              style: textTheme.headline1,
            ),
            _buildCircle(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(BuildContext context) {
    if (dayStatus == null) return const SizedBox();
    final colorScheme = Theme.of(context).colorScheme;
    final good = dayStatus == DayStatus.good;
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: good ? colorScheme.primaryContainer : colorScheme.error,
      ),
    );
  }

  Widget _buildToday(BuildContext context) {
    if (!DateUtil.isToday(date)) return const SizedBox();
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        context.strings.today,
        style: textTheme.headline5,
      ),
    );
  }
}
