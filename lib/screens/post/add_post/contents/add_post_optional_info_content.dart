import 'package:flutter/material.dart';
import 'package:ideashare/screens/post/add_post/add_post_screen.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';

class AddPostOptionalInfoContent extends StatelessWidget {
  AddPostOptionalInfoContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Text("OPTIONAL INFO");
  }

}
