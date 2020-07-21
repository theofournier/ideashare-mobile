import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/share_options_widget.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';
import 'package:ideashare/utils/share_options_utils.dart';

class AddPostShareOptionsContent extends StatefulWidget {
  AddPostShareOptionsContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  _AddPostShareOptionsContentState createState() =>
      _AddPostShareOptionsContentState();
}

class _AddPostShareOptionsContentState
    extends State<AddPostShareOptionsContent> {

  @override
  void initState() {
    if (widget.viewModel.post.shareOptions == null) {
      widget.viewModel.post.shareOptions = PostShareOptions();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewModel.isLoadingShareOptions) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    widget.viewModel.shareOptions = ShareOptionsUtils.getShareOptions(
      context: context,
      category: widget.viewModel.post.category,
      postShareOptions: widget.viewModel.post.shareOptions,
      onUpdate: widget.viewModel.notifyListeners,
    );

    return ShareOptionsWidget(
      shareOptions: widget.viewModel.shareOptions,
    );
  }
}
