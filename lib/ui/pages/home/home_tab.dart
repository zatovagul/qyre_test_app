import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../views/calendar/calendar_day_view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.strings.myAvailabiliy),
            centerTitle: false,
          ),
          _buildCalendar(),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 10),
        child: SizedBox(
          height: 112,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final child = CalendarDayView(
                date: DateTime.now(),
              );
              if (index > 0) return child;
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: child,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
            itemCount: 31,
          ),
        ),
      ),
    );
  }
}
