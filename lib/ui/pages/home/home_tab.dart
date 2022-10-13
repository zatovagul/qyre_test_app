// ignore_for_file: unnecessary_new

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../l10n/localization_helper.dart';
import '../../../utils/date_util.dart';
import '../../utils/theme_mixin.dart';
import '../../views/calendar/calendar_day_small_view.dart';
import '../../views/calendar/calendar_day_view.dart';
import '../../views/expand_stack.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with ThemeMixin {
  late ValueNotifier<bool> _expandListenable;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _expandListenable = ValueNotifier(false);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final position = _scrollController.position.pixels;
    if (position >= 60) {
      _expandListenable.value = true;
      return;
    }
    _expandListenable.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(),
              _buildCalendar(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 1000),
              )
            ],
          ),
          _buildSmallCalendar(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      title: Text(context.strings.myAvailabiliy),
      backgroundColor: colorScheme.background.withOpacity(0),
      centerTitle: false,
      pinned: true,
      flexibleSpace: _buildBlurBackground(),
    );
  }

  Widget _buildSmallCalendar() {
    return ValueListenableBuilder(
      valueListenable: _expandListenable,
      builder: (context, expand, child) {
        return ExpandStack(
          expand: expand,
          child: Container(
            height: 46,
            child: Stack(
              children: [
                _buildBlurBackground(),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final date = DateUtil.today.add(Duration(days: index));
                        final child = CalendarDaySmallView(date: date);
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 16 : 0,
                            right: 8,
                          ),
                          child: child,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCalendar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 10),
        child: SizedBox(
          height: 112,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final date = DateUtil.today.add(Duration(days: index));
              final child = CalendarDayView(date: date);
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 16 : 0,
                  right: 8,
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBlurBackground() {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: colorScheme.background.withOpacity(0.9),
        ),
      ),
    );
  }
}
