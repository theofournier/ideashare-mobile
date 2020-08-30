import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/comment/comment.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:ideashare/utils/flushbar_utils.dart';

class PostViewModel with ChangeNotifier {
  PostViewModel({
    @required this.postDatabase,
    @required this.currentUser,
    this.postId,
    Post initialPost,
  }) {
    this.copyInitialPost(initialPost);
    this.fetchPost();

    this.updateWith(isLoadingPostComments: true);
    this.fetchPostComments();
  }

  final PostDatabase postDatabase;
  final User currentUser;

  final String postId;
  Post post;
  List<Comment> comments = [];

  String get getPostId => this.post != null ? this.post.id : this.postId;

  bool isLoadingPost = false;
  bool isLoadingPostComments = false;
  bool isLoadingSendComment = false;

  void updateWith({
    Post post,
    List<Comment> comments,
    bool isLoadingPost,
    bool isLoadingPostComments,
    bool isLoadingSendComment,
  }) {
    this.post = post ?? this.post;
    this.comments = comments ?? this.comments;
    this.isLoadingPost = isLoadingPost ?? this.isLoadingPost;
    this.isLoadingPostComments =
        isLoadingPostComments ?? this.isLoadingPostComments;
    this.isLoadingSendComment =
        isLoadingSendComment ?? this.isLoadingSendComment;
    notifyListeners();
  }

  void copyInitialPost(Post initialPost) {
    if (initialPost != null) {
      this.post = Post.fromMap(initialPost.id, initialPost.toMap());
    }
  }

  Future<void> fetchPost() async {
    if (this.post == null) {
      updateWith(isLoadingPost: true);
    }
    try {
      Post post = await postDatabase.getPost(getPostId);
      updateWith(post: post, isLoadingPost: false);
    } catch (e) {
      print("ERROR POST: ${e}");
      updateWith(isLoadingPost: false);
    }
  }

  Future<void> fetchPostComments() async {
    try {
      List<Comment> comments = await postDatabase.getPostComments(getPostId);
      updateWith(comments: comments, isLoadingPostComments: false);
    } catch (e) {
      print("ERROR POST COMMENTS: ${e}");
      updateWith(isLoadingPostComments: false);
    }
  }

  Future<bool> sendComment(String text) async {
    updateWith(isLoadingSendComment: true);
    try {
      Comment comment = Comment(
        text: text,
        ownerInfo: OwnerInfo.fromUser(currentUser),
        docTime: DocTime.init(),
      );
      String commentId = await postDatabase.addPostComment(getPostId, comment);
      comment.id = commentId;
      updateWith(
          isLoadingSendComment: false,
          comments: this.comments..insert(0, comment));
      fetchPostComments();
      return true;
    } catch (e) {
      print("ERROR SEND COMMENT: ${e}");
      updateWith(isLoadingSendComment: false);
      return false;
    }
  }

  Future<bool> deleteComment(BuildContext context, String commentId) async {
    try {
      int index = comments.indexWhere((element) => element.id == commentId);
      Comment comment = comments[index];
      await postDatabase.deletePostComment(getPostId, commentId);
      updateWith(
          comments: this.comments
            ..remove(comment));
      fetchPostComments();
      flushbarUndoDeleteComment(context, index, comment);
      return true;
    } catch (e) {
      print("ERROR DELETE COMMENT: ${e}");
      return false;
    }
  }

  FlushbarUtils flushbarUtils;
  void flushbarUndoDeleteComment(BuildContext context, int index, Comment comment){
    this.flushbarUtils = FlushbarUtils(
        context,
        type: FlushbarType.success,
        duration: Duration(seconds: 5),
        message: S.of(context).postCommentDeletedSuccess,
        buttonText: S.of(context).undo,
        onPressedMainButton: () async {
          await postDatabase.setPostComment(getPostId, comment);
          updateWith(
              comments: this.comments
                ..insert(index, comment));
          fetchPostComments();
          flushbarUtils.dismiss();
        }
    )..show();
  }
}
