import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/auth/sign_in_screen.dart';
import 'package:ideashare/screens/auth/sign_up_screen.dart';
import 'package:ideashare/common_widgets/custom_outline_button.dart';
import 'package:ideashare/common_widgets/custom_flat_button.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ConstantWidgets.gradientBoxDecoration(context),
        child: SafeArea(
          child: _buildAuth(context),
        ),
      ),
    );
  }

  Widget _buildAuth(BuildContext context) {
    return Padding(
      padding: ConstantWidgets.defaultPadding,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              S.of(context).authScreenTitle,
              style: Theme.of(context).textTheme.headline2.toWhite(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Image.asset(
            "assets/images/logo_white.png",
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(
            height: 32,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              S.of(context).authScreenSubtitle,
              style: Theme.of(context).textTheme.headline4.toWhite(),
            ),
          ),
          SizedBox(
            height: 64,
          ),
          CustomOutlineButton(
            text: S.of(context).authScreenSignIn,
            textSize: 20,
            height: 50,
            width: 200,
            onPressed: () => SignInScreen.show(context),
          ),
          SizedBox(
            height: 16,
          ),
          CustomFlatButton(
            onPressed: () => SignUpScreen.show(context),
            text: S.of(context).authScreenSignUp,
            textSize: 18,
          )
        ],
      ),
    );
  }
}
