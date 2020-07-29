import 'package:flutter/material.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/database/label_database.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:provider/provider.dart';

class LandingWidgetBuilder extends StatelessWidget {
  const LandingWidgetBuilder({Key key, @required this.builder})
      : super(key: key);

  final Widget Function(AsyncSnapshot<UserAuth> userAuthSnapshot, AsyncSnapshot<User> userSnapshot) builder;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<UserAuth>(
      stream: authService.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<UserAuth> userAuthSnapshot) {
        final UserAuth user = userAuthSnapshot.data;
        if (user != null) {
          return MultiProvider(
            providers: [
              Provider<ProfileDatabase>(
                create: (_) => ProfileDatabase(uid: user.uid),
              ),
              Provider<LabelDatabase>(
                create: (_) => LabelDatabase(),
              ),
              Provider<PostDatabase>(
                create: (_) => PostDatabase(uid: user.uid),
              ),
              Provider<UserAuth>.value(value: user),
            ],
            child: UserStreamBuilder(
              builder: (userSnapshot) => builder(userAuthSnapshot, userSnapshot),
            ),
          );
        }
        return builder(userAuthSnapshot, AsyncSnapshot<User>.nothing());
      },
    );
  }
}

class UserStreamBuilder extends StatelessWidget {
  UserStreamBuilder({
    Key key,
    this.builder,
  }) : super(key: key);

  final Widget Function(AsyncSnapshot<User>)builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: Provider.of<ProfileDatabase>(context, listen: false)
          .profileStream(),
      builder: (context, snapshot) {
        final User user = snapshot.data;
        return Provider<User>.value(
          value: user,
          child: builder(snapshot),
        );
      },
    );
  }
}
