import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/screens/auth/auth_screen.dart';
import 'package:ideashare/screens/main/main_screen.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/models/user/user.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    Key key,
    @required this.userAuthSnapshot,
    this.userSnapshot,
  }) : super(key: key);
  final AsyncSnapshot<UserAuth> userAuthSnapshot;
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userAuthSnapshot.connectionState == ConnectionState.active &&
        !userAuthSnapshot.hasData) {
      return AuthScreen();
    }
    if (userSnapshot.connectionState == ConnectionState.none) {
      return AuthScreen();
    }
    if (userAuthSnapshot.connectionState == ConnectionState.active &&
        userAuthSnapshot.hasData &&
        userSnapshot.connectionState == ConnectionState.active &&
        userSnapshot.hasData) {
      return MainScreen();
    }
    return buildLoadingScreen(context);
  }

  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ConstantWidgets.gradientBoxDecoration(context),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}
