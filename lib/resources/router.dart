import 'package:flutter/material.dart';
import 'package:ideashare/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:ideashare/screens/auth/sign_in/sign_in_screen.dart';
import 'package:ideashare/screens/auth/sign_up/sign_up_screen.dart';
import 'package:ideashare/screens/home/home_screen.dart';
import 'package:ideashare/screens/landing/landing_screen.dart';
import 'package:ideashare/screens/notifications/notifications_screen.dart';
import 'package:ideashare/screens/post/add_post/add_post_screen.dart';
import 'package:ideashare/screens/post/add_post/add_post_start_screen.dart';
import 'package:ideashare/screens/profile/profile_screen.dart';
import 'package:ideashare/screens/search/search_screen.dart';
import 'package:ideashare/screens/select_picture/default_picture/default_picture_screen.dart';
import 'package:ideashare/screens/select_picture/select_picture_screen.dart';
import 'package:ideashare/services/models/common/default_picture.dart';

class Routes {
  static const landingScreen = "/";
  static const signInScreen = "/sign-in";
  static const signUpScreen = "/sign-up";
  static const forgotPasswordScreen = "/forgot-password";
  static const selectPictureScreen = "/select-picture";
  static const defaultPictureScreen = "/default-picture";
  static const homeScreen = "/home";
  static const searchScreen = "/search";
  static const profileScreen = "/profile";
  static const notificationsScreen = "/notifications";
  static const addPostScreen = "/add-post";
  static const addPostStartScreen = "/add-post-start";
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
      case Routes.selectPictureScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SelectPictureScreen(),
          settings: settings,
        );
      case Routes.defaultPictureScreen:
        return MaterialPageRoute<DefaultPicture>(
          builder: (_) => DefaultPictureScreen(
            initialDefaultPicture: args,
          ),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomeScreen(),
          settings: settings,
        );
      case Routes.searchScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SearchScreen(),
          settings: settings,
        );
      case Routes.profileScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => ProfileScreen(),
          settings: settings,
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => NotificationsScreen(),
          settings: settings,
        );
      case Routes.addPostScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AddPostScreen(),
          settings: settings,
        );
      case Routes.addPostStartScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AddPostStartScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
