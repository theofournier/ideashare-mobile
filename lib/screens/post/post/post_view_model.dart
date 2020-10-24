import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/comment/comment.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post_help/post_help.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
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

    this.updateWith(isLoadingPostNotes: true);
    this.fetchPostNotes();
  }

  final PostDatabase postDatabase;
  final User currentUser;

  final String postId;
  Post post;
  List<Comment> comments = [];
  List<PostNote> notes = [];
  List<PostHelp> helps = [];

  String get getPostId => this.post != null ? this.post.id : this.postId;

  bool isLoadingPost = false;
  bool isLoadingPostComments = false;
  bool isLoadingSendComment = false;
  bool isLoadingPostNotes = false;
  bool isLoadingPostHelps = false;

  void updateWith({
    Post post,
    List<Comment> comments,
    List<PostNote> notes,
    List<PostHelp> helps,
    bool isLoadingPost,
    bool isLoadingPostComments,
    bool isLoadingSendComment,
    bool isLoadingPostNotes,
    bool isLoadingPostHelps,
  }) {
    this.post = post ?? this.post;
    this.comments = comments ?? this.comments;
    this.notes = notes ?? this.notes;
    this.helps = helps ?? this.helps;
    this.isLoadingPost = isLoadingPost ?? this.isLoadingPost;
    this.isLoadingPostComments =
        isLoadingPostComments ?? this.isLoadingPostComments;
    this.isLoadingSendComment =
        isLoadingSendComment ?? this.isLoadingSendComment;
    this.isLoadingPostNotes = isLoadingPostNotes ?? this.isLoadingPostNotes;
    this.isLoadingPostHelps = isLoadingPostHelps ?? this.isLoadingPostHelps;
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
      updateWith(post: post);
    } catch (e) {
      print("ERROR POST: ${e}");
    } finally {
      updateWith(isLoadingPost: false);
    }
  }

  Future<void> fetchPostComments() async {
    try {
      List<Comment> comments = await postDatabase.getPostComments(getPostId);
      updateWith(comments: comments);
    } catch (e) {
      print("ERROR POST COMMENTS: ${e}");
    } finally {
      updateWith(isLoadingPostComments: false);
    }
  }

  Future<bool> sendComment(String text) async {
    bool success = false;
    updateWith(isLoadingSendComment: true);
    try {
      Comment comment = Comment(
        text: text,
        ownerInfo: OwnerInfo.fromUser(currentUser),
        docTime: DocTime.init(),
      );
      String commentId = await postDatabase.addPostComment(getPostId, comment);
      comment.id = commentId;
      updateWith(comments: this.comments..insert(0, comment));
      fetchPostComments();
      success = true;
    } catch (e) {
      print("ERROR SEND COMMENT: ${e}");
    } finally {
      updateWith(isLoadingSendComment: false);
    }
    return success;
  }

  Future<bool> deleteComment(BuildContext context, String commentId) async {
    bool success = false;
    try {
      int index = comments.indexWhere((element) => element.id == commentId);
      Comment comment = comments[index];
      await postDatabase.deletePostComment(getPostId, commentId);
      updateWith(comments: this.comments..remove(comment));
      fetchPostComments();
      flushbarUndoDeleteComment(
        context: context,
        index: index,
        comment: comment,
      );
      success = true;
    } catch (e) {
      print("ERROR DELETE COMMENT: ${e}");
    }
    return success;
  }

  Future<void> fetchPostNotes() async {
    try {
      List<PostNote> notes = await postDatabase.getPostNotes(getPostId);
      updateWith(notes: notes);
    } catch (e) {
      print("ERROR POST NOTES: ${e}");
    } finally {
      updateWith(isLoadingPostNotes: false);
    }
  }

  Future<bool> deleteNote(BuildContext context, String noteId) async {
    bool success = false;
    try {
      int index = notes.indexWhere((element) => element.id == noteId);
      PostNote note = notes[index];
      await postDatabase.deletePostNote(getPostId, noteId);
      updateWith(notes: this.notes..remove(note));
      fetchPostNotes();
      flushbarUndoDeleteNote(
        context: context,
        index: index,
        note: note,
      );
      success = true;
    } catch (e) {
      print("ERROR DELETE NOTE: ${e}");
    }
    return success;
  }

  Future<void> fetchPostHelps() async {
    try {
      List<PostHelp> helps = await postDatabase.getPostHelps(getPostId);
      updateWith(helps: helps);
    } catch (e) {
      print("ERROR POST HELPS: ${e}");
    } finally {
      updateWith(isLoadingPostHelps: false);
    }
  }

  FlushbarUtils flushbarUtils;

  void flushbarUndo({
    BuildContext context,
    String message,
    AsyncCallback undo,
  }) {
    this.flushbarUtils = FlushbarUtils(
      context,
      type: FlushbarType.success,
      duration: Duration(seconds: 5),
      message: message,
      buttonText: S.of(context).undo,
      onPressedMainButton: () async {
        await undo();
        flushbarUtils.dismiss();
      },
    )..show();
  }

  void flushbarUndoDeleteComment({
    BuildContext context,
    int index,
    Comment comment,
  }) {
    flushbarUndo(
      context: context,
      message: S.of(context).postCommentDeletedSuccess,
      undo: () async {
        await postDatabase.setPostComment(getPostId, comment);
        updateWith(comments: this.comments..insert(index, comment));
        fetchPostComments();
      },
    );
  }

  void flushbarUndoDeleteNote({
    BuildContext context,
    int index,
    PostNote note,
  }) {
    flushbarUndo(
      context: context,
      message: S.of(context).postNoteDeletedSuccess,
      undo: () async {
        await postDatabase.setPostNote(getPostId, note);
        updateWith(notes: this.notes..insert(index, note));
        fetchPostNotes();
      },
    );
  }
}
