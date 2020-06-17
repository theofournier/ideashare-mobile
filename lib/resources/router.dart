import 'package:flutter/material.dart';
import 'package:ideashare/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:ideashare/screens/auth/sign_up/sign_up_screen.dart';
import 'file:///C:/Users/fourn/Documents/Projets/IdeaShare/Projects/ideashare/lib/screens/auth/sign_in/sign_in_screen.dart';
import 'package:ideashare/screens/landing/landing_screen.dart';

class Routes {
  static const landingScreen = "/";
  static const signInScreen = "/sign-in";
  static const signUpScreen = "/sign-up";
  static const forgotPasswordScreen = "/forgot-password";
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
      case Routes.signInScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInScreen(),
          settings: settings,
        );
      case Routes.signUpScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignUpScreen(),
          settings: settings,
        );
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ForgotPasswordScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
