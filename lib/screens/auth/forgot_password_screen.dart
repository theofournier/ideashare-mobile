import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';

class ForgotPasswordScreen extends StatefulWidget {

  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.forgotPasswordScreen,
    );
  }

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Forgot password'),),
    );
  }
}

