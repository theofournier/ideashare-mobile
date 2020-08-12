import 'package:flutter/material.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';

class PostInfoContent extends StatelessWidget {
  const PostInfoContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("INFO"),
    );
  }
}
