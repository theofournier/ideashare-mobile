import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_app_bar.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';

class SignInScreen extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.signInScreen,
    );
  }

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).signInScreenAppBarTitle,),
      body: Center(
        child: Text('Sign In'),
      ),
    );
  }
}
