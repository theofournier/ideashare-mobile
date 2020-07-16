import 'package:flutter/material.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/home/home_view_model.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.addPostScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPostViewModel>(
      create: (_) => AddPostViewModel(),
      child: Consumer<AddPostViewModel>(
        builder: (_, viewModel, __) => AddPostContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class AddPostContent extends StatefulWidget {
  const AddPostContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final AddPostViewModel viewModel;

  @override
  _AddPostContentState createState() => _AddPostContentState();
}

class _AddPostContentState extends State<AddPostContent> {
  AddPostViewModel get viewModel => this.widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ADD POST"),
      ),
    );
  }
}
