import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LandingWidgetBuilder extends StatelessWidget {
  const LandingWidgetBuilder({Key key, @required this.builder}) : super(key: key);

  final Widget Function(BuildContext, AsyncSnapshot<UserAuth>) builder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<UserAuth>(
      stream: authService.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<UserAuth> snapshot) {
        final UserAuth user = snapshot.data;
        if (user != null) {
          return MultiProvider(
            providers: [
              Provider<UserAuth>.value(value: user),
              // NOTE: Any other user-bound providers here can be added here
            ],
            child: builder(context, snapshot),
          );
        }
        return builder(context, snapshot);
      },
    );
  }
}
