import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/share_options_widget.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/utils/share_options_utils.dart';

class AddPostShareOptionsContent extends StatelessWidget {
  AddPostShareOptionsContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoadingShareOptions) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    viewModel.shareOptions = ShareOptionsUtils.getShareOptions(
      context: context,
      category: viewModel.post.category,
      postShareOptions: viewModel.post.shareOptions,
      onUpdate: viewModel.notifyListeners,
    );

    return ShareOptionsWidget(
      shareOptions: viewModel.shareOptions,
    );
  }
}
