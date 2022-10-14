import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../models/enums/day_status.dart';
import '../../../utils/date_util.dart';

class CalendarDaySmallView extends StatelessWidget {
  final DateTime date;
  final DayStatus? dayStatus;
  const CalendarDaySmallView({
    super.key,
    required this.date,
    this.dayStatus,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Center(
      child: Container(
        width: 76,
        height: 36,
        constraints: const BoxConstraints(maxHeight: 112),
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: _buildTop(context)),
            const SizedBox(height: 2),
            Expanded(child: _buildBottom(context)),
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
      margin: const EdgeInsets.only(right: 2),
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
      padding: const EdgeInsets.only(right: 2),
      child: Text(
        context.strings.today,
        style: textTheme.headline5,
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildToday(context),
        Text(
          DateUtil.getWeekDay(date),
          style: textTheme.subtitle2,
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCircle(context),
        Text(
          '${DateUtil.getDay(date)} ${DateUtil.getMonth(date)}.',
          style: textTheme.subtitle2,
        ),
      ],
    );
  }
}
