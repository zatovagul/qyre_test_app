import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/pages/home/home_tab.dart';
import '../ui/pages/main/main_page.dart';
import '../ui/pages/menu/menu_tab.dart';
import '../ui/pages/notifications/notifications_tab.dart';


part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'main',
      page: MainPage,
      initial: true,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRoute',
          page: HomeTab,
          initial: true,
        ),
        AutoRoute(
          path: 'menu',
          name: 'MenuRoute',
          page: MenuTab,
          initial: true,
        ),
        AutoRoute(
          path: 'notifications',
          name: 'NotificationsRoute',
          page: NotificationsTab,
          initial: true,
        ),
        
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
