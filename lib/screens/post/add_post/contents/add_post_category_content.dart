import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';

class AddPostCategoryContent extends StatelessWidget {
  AddPostCategoryContent({
    @required this.viewModel,
  });

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("CATEGORY")
      ],
    );
  }

}
