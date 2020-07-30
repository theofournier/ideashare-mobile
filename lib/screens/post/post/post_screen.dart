import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:provider/provider.dart';

class PostScreenArguments {
  PostScreenArguments({
    this.postId,
    this.initialPost,
  });

  final String postId;
  final Post initialPost;
}

class PostScreen extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    String postId,
    Post initialPost,
  }) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.postScreen,
      arguments: PostScreenArguments(
        postId: postId,
        initialPost: initialPost,
      ),
    );
  }

  PostScreen({
    this.postId,
    this.initialPost,
  });

  final String postId;
  final Post initialPost;

  @override
  Widget build(BuildContext context) {
    final PostDatabase postDatabase =
        Provider.of<PostDatabase>(context, listen: false);

    return ChangeNotifierProvider<PostViewModel>(
      create: (_) => PostViewModel(
        postDatabase: postDatabase,
        postId: postId,
        initialPost: initialPost,
      ),
      child: Consumer<PostViewModel>(
        builder: (_, viewModel, __) => PostContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class PostContent extends StatelessWidget {
  const PostContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: <Widget>[],
      ),
      body: Center(
        child: viewModel.isLoadingPost ? CircularProgressIndicator() : Text("Post ${viewModel.post.info.title}"),
      ),
    );
  }
}
