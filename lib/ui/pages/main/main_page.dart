import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_router.dart';
import '../../utils/theme_mixin.dart';
import '../../views/bars/app_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with ThemeMixin {
  List<PageRouteInfo<dynamic>> get _routes {
    return const [
      HomeRoute(),
      MenuRoute(),
      NotificationsRoute(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: _routes,
      builder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) {
        return AppBottomNavigationBar(
          index: tabsRouter.activeIndex,
          onTap: (index) {
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}
