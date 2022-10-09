import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    );
  }
}
