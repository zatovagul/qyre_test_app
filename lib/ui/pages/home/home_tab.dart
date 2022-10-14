// ignore_for_file: unnecessary_new

import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_cubit.dart';
import '../../../constants/app_images.dart';
import '../../../di/di.dart';
import '../../../l10n/localization_helper.dart';
import '../../../utils/date_util.dart';
import '../../utils/theme_mixin.dart';
import '../../views/calendar/calendar_day_small_view.dart';
import '../../views/calendar/calendar_day_view.dart';
import '../../views/expand_stack.dart';
import 'components/gradient_card.dart';
import 'components/job_offer_placeholder.dart';
import 'components/production_view.dart';
import 'components/task_view.dart';

class HomeTab extends StatefulWidget with AutoRouteWrapper {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => locator()..init(),
      child: this,
    );
  }
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
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  _buildAppBar(),
                  _buildCalendar(state),
                  _buildTasks(),
                  _sizedBoxSliver(10),
                  _buildProductions(state),
                  _sizedBoxSliver(10),
                  _buildCards(),
                  _sizedBoxSliver(10),
                  _buildJobOffers(),
                  _sizedBoxSliver(100),
                ],
              ),
              _buildSmallCalendar(state),
            ],
          );
        },
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

  Widget _buildSmallCalendar(HomeState state) {
    return ValueListenableBuilder(
      valueListenable: _expandListenable,
      builder: (context, expand, child) {
        return ExpandStack(
          expand: expand,
          child: SizedBox(
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
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final date = DateUtil.today.add(Duration(days: index));
                        final child = CalendarDaySmallView(
                          date: date,
                          dayStatus: state.schedule[date],
                        );
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

  Widget _buildCalendar(HomeState state) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 10),
        child: SizedBox(
          height: 112,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final date = DateUtil.today.add(Duration(days: index));
              final child = CalendarDayView(
                date: date,
                dayStatus: state.schedule[date],
              );
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

  Widget _buildTasks() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 156,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(width: 16),
            TaskView(
              title: context.strings.completeYourProfileTitle,
              progress: 0.7,
              buttonText: context.strings.completeProfile,
            ),
            const SizedBox(width: 10),
            TaskView(
              title: context.strings.completeYourProfileTitle,
              progress: 0.7,
              buttonText: context.strings.completeProfile,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  Widget _sizedBoxSliver(double height) {
    return SliverToBoxAdapter(child: SizedBox(height: height));
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 44,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: textTheme.headline6,
          ),
        ),
      ),
    );
  }

  Widget _buildProductions(HomeState state) {
    final productions = state.productions;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _buildTitle(context.strings.todaysProduction),
          ...productions.map((prod) {
            final child = ProductionView(production: prod);
            final last = productions.last == prod;
            if (last) return child;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: child,
            );
          }),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildCards() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: GradientCard(
                image: AppImages.persons,
                title: context.strings.myNetwork,
                info: context.strings.connectYourNetwork,
                startColor: colorScheme.tertiary,
                endColor: colorScheme.onTertiary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: GradientCard(
                image: AppImages.qyre,
                title: context.strings.quickHire,
                info: context.strings.hireSomeone,
                startColor: colorScheme.secondary,
                endColor: colorScheme.onSecondary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: GradientCard(
                image: AppImages.document,
                title: context.strings.myCv,
                info: context.strings.keepYourCvUpdated,
                startColor: colorScheme.surface,
                endColor: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobOffers() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _buildTitle(context.strings.myJobOffers),
          const JobOfferPlaceHolder(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
