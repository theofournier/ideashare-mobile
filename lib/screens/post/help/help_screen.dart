import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar_button.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/help/help_content.dart';
import 'package:ideashare/screens/post/help/help_view_model.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post_help/post_help.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:ideashare/services/storage/firebase_storage_service.dart';
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
    final FirebaseStorageService firebaseStorageService =
    Provider.of<FirebaseStorageService>(context, listen: false);

    return ChangeNotifierProvider<HelpViewModel>(
      create: (_) => HelpViewModel(
        postDatabase: postDatabase,
        currentUser: currentUser,
        firebaseStorageService: firebaseStorageService,
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
