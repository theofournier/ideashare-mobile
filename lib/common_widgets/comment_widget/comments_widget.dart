import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/comment_widget/comment_list_item.dart';
import 'package:ideashare/common_widgets/comment_widget/comment_text_field.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/services/models/comment/comment.dart';
import 'package:ideashare/services/models/user/user.dart';

class CommentsWidget extends StatelessWidget {
  CommentsWidget({
    this.currentUser,
    this.isOwner = false,
    this.comments,
    this.onSend,
    this.onDelete,
    this.isLoading,
  });

  final User currentUser;
  final bool isOwner;
  List<Comment> comments = [];
  final Future<bool> Function(String text) onSend;
  final Future<bool> Function(String commentId) onDelete;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            color: AppColors.greyBackground,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 12),
              separatorBuilder: (context, index) => SizedBox(
                height: 12,
              ),
              itemCount: comments.length,
              itemBuilder: (_, index) => CommentListItem(
                key: ValueKey(comments[index].id),
                isOwner: isOwner || currentUser.id == comments[index].ownerInfo.userId,
                comment: comments[index],
                onDelete: () async => await onDelete(comments[index].id),
              ),
            ),
          ),
        ),
        CommentTextField(
          onSend: onSend,
          isLoading: isLoading,
        )
      ],
    );
  }
}
