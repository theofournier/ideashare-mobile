import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/screens/auth/auth_screen.dart';
import 'package:ideashare/screens/main/main_screen.dart';
import 'package:ideashare/services/auth/auth_service.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<UserAuth> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData
          ? MainScreen()
          : AuthScreen();
    }
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
