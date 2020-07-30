import 'package:flutter/material.dart';
import 'package:ideashare/services/database/firestore_path.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
import 'package:ideashare/services/models/post/post_status/post_status.dart';

class PostDatabase {
  PostDatabase({@required this.uid})
      : assert(uid != null, 'Cannot create FirestoreDatabase with null uid');

  final String uid;

  final _service = FirestoreService.instance;

  Future<void> setPost(Post post) => _service.setData(
        path: FirestorePath.post(post.id),
        data: post.toMap(),
        merge: true,
      );

  Future<String> addPostNote(String postId, PostNote postNote) =>
      _service.addData(
        collectionPath: FirestorePath.postNotes(postId),
        data: postNote.toMap(),
      );

  Future<void> setPostStatus(String postId, PostStatus postStatus) =>
      _service.setData(
        path: FirestorePath.postStatus(postId),
        data: postStatus.toMap(),
        merge: true,
      );

  Future<List<Post>> getPosts() => _service.getCollection(
        path: FirestorePath.posts(),
        queryBuilder: (query) => query.orderBy("docTime.createdAt", descending: true),
        builder: (data, documentId) => Post.fromMap(documentId, data),
      );

  Future<Post> getPost(String postId) => _service.getDocument(
    path: FirestorePath.post(postId),
    builder: (data, documentId) => Post.fromMap(documentId, data),
  );
}
