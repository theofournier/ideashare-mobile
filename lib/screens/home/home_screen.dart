import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/home/home_view_model.dart';
import 'package:ideashare/screens/post/posts/posts_screen.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.homeScreen,
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (_, viewModel, __) => HomeContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final User currentUser = Provider.of<User>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              currentUser.toMap().toString(),
            ),
            RaisedButton(
              onPressed: () =>
                  Provider.of<AuthService>(context, listen: false).signOut(),
              child: Text("SIGN OUT"),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              onPressed: () => PostsScreen.show(context),
              child: Text("POSTS"),
            ),
          ],
        ),
      ),
    );
  }
}
