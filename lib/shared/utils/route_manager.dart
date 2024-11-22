import 'package:flutter/material.dart';
import '../../modules/home/presentation/home_screen.dart';
import '../../modules/authentication/presentation/auth_screen.dart';
import '../../modules/smart_ui/presentation/dynamic_dashboard_screen.dart';

class RouteManager {
  static final Map<String, WidgetBuilder> routes = {
    '/auth': (context) => const AuthScreen(),
    '/home': (context) => const HomeScreen(),
    '/dashboard': (context) => const DynamicDashboardScreen(),
  };
}
