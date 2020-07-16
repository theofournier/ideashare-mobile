import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/home/home_view_model.dart';
import 'package:ideashare/screens/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.profileScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileViewModel>(
      create: (_) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (_, viewModel, __) => ProfileContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ProfileViewModel viewModel;

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  ProfileViewModel get viewModel => this.widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PROFILE"),
      ),
    );
  }
}
