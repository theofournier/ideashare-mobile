import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';

class SignUpScreen extends StatefulWidget {

  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.signUpScreen,
    );
  }

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Sign Up'),),
    );
  }
}

