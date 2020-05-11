import 'package:flutter/material.dart';
import 'package:ideashare/screens/landing/landing_screen.dart';

class Routes {
  static const landingScreen = "/";
}

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.landingScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LandingScreen(
            userSnapshot: args,
          ),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
