import 'package:flutter/material.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post/post.dart';

class PostViewModel with ChangeNotifier {
  PostViewModel({
    @required this.postDatabase,
    this.postId,
    Post initialPost,
  }) {
    this.copyInitialPost(initialPost);
    this.fetchPost();
  }

  final PostDatabase postDatabase;

  final String postId;
  Post post;

  bool isLoadingPost = false;

  void updateWith({
    Post post,
    bool isLoadingPost,
  }) {
    this.post = post ?? this.post;
    this.isLoadingPost = isLoadingPost ?? this.isLoadingPost;
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
      Post post =
          await postDatabase.getPost(this.post != null ? this.post.id : postId);
      updateWith(post: post, isLoadingPost: false);
    } catch (e) {
      print("ERROR POST: ${e}");
      updateWith(isLoadingPost: false);
    }
  }
}
