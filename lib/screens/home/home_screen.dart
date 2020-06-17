import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = Provider.of<UserAuth>(context, listen: false);
    print(user.displayName);
    print(user.email);
    print(user.uid);
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () => authService.signOut(),
          child: Text("sign out"),
        ),
      ),
    );
  }
}
