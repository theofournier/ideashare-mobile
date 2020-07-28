import 'package:flutter/material.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post/post.dart';

class PostsViewModel with ChangeNotifier {
  PostsViewModel({
    @required this.postDatabase,
  }) {
    this.fetchPosts();
  }

  final PostDatabase postDatabase;

  List<Post> posts = [];

  bool isLoading = false;

  void updateWith({
    List<Post> posts,
    bool isLoading,
  }) {
    this.posts = posts ?? this.posts;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    updateWith(isLoading: true);
    try {
      List<Post> posts = await postDatabase.getPosts();
      updateWith(posts: posts, isLoading: false);
    } catch (e) {
      print("ERROR POSTS: ${e}");
      updateWith(isLoading: false);
    }
  }
}
