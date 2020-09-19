import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/help/help_view_model.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post_help/post_help.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:provider/provider.dart';

class HelpScreenArguments {
  HelpScreenArguments({
    this.helpId,
    this.postId,
    this.initialHelp,
  });

  final String helpId;
  final String postId;
  final PostHelp initialHelp;
}

class HelpScreen extends StatelessWidget {
  static Future<HelpAction> show(
    BuildContext context, {
    String helpId,
    String postId,
    PostHelp initialHelp,
  }) async {
    final navigator = Navigator.of(context);
    return await navigator.pushNamed(
      Routes.helpScreen,
      arguments: HelpScreenArguments(
        postId: postId,
        helpId: helpId,
        initialHelp: initialHelp,
      ),
    );
  }

  HelpScreen({
    this.helpId,
    this.postId,
    this.initialHelp,
  });

  final String helpId;
  final String postId;
  final PostHelp initialHelp;

  @override
  Widget build(BuildContext context) {
    final PostDatabase postDatabase =
        Provider.of<PostDatabase>(context, listen: false);
    final User currentUser = Provider.of<User>(context);

    return ChangeNotifierProvider<HelpViewModel>(
      create: (_) => HelpViewModel(
        postDatabase: postDatabase,
        currentUser: currentUser,
        postId: postId,
        helpId: helpId,
        initialHelp: initialHelp,
      ),
      child: Consumer<HelpViewModel>(
        builder: (_, viewModel, __) => HelpContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class HelpContent extends StatelessWidget {
  HelpContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final HelpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: Scaffold(
        body: Center(
          child: Text("HELP"),
        ),
      ),
    );
  }

}
