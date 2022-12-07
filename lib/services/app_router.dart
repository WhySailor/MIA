import 'package:flutter/material.dart';
import 'package:mia/screens/bin_screen.dart';
import 'package:mia/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BinScreen.id:
        return MaterialPageRoute(builder: (_) => const BinScreen());
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      default:
        null;
    }
    return null;
  }
}
