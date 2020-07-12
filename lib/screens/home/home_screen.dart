import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = Provider.of<User>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: FlatButton(
                onPressed: () => authService.signOut(),
                child: Text("sign out"),
              ),
            ),
            if (user != null) ...[
              Text(user.id ?? ""),
              Text(user.firstName ?? ""),
              Text(user.lastName ?? ""),
              Text(user.photoUrl ?? ""),
              Text(user.email ?? ""),
              Text(user.ideasCount.toString() ?? ""),
              Text(user.createdAt.toString() ?? ""),
            ],
          ],
        ),
      ),
    );
  }
}
