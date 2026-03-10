import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:server_driven_ui_flutter/features/sdui/presentation/ui/pages/home_page.dart';
import 'package:server_driven_ui_flutter/features/sdui/presentation/ui/pages/unknown_widget_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(screenName: 'home'),
      ),
      GoRoute(
        path: '/offers',
        builder: (context, state) => const HomePage(screenName: 'offers'),
      ),
    ],
    errorBuilder: (context, state) => const UnknownWidgetPage(),
  );
}
