import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/comment_widget/comments_widget.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';

class PostCommentsContent extends StatelessWidget {
  const PostCommentsContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if(viewModel.isLoadingPostComments){
      return buildLoading(context);
    }
    return RefreshIndicator(
      onRefresh: viewModel.fetchPostComments,
      child: buildList(context),
    );
  }

  Widget buildList(BuildContext context) {
    return CommentsWidget(
      currentUser: viewModel.currentUser,
      isOwner: viewModel.currentUser.id == viewModel.post?.ownerInfo?.userId ?? false,
      comments: viewModel.comments,
      onSend: viewModel.sendComment,
      isLoading: viewModel.isLoadingSendComment,
      onDelete: (String commentId) => viewModel.deleteComment(context, commentId),
    );
  }

  Widget buildLoading(BuildContext context){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
