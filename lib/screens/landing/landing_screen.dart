import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<UserAuth> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? Text("Authenticated") : Text("Unauthicated");
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
