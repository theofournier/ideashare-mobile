import 'package:flutter/material.dart';
import 'package:ideashare/services/database/firestore_path.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/comment/comment.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post_help/post_help.dart';
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

  Future<void> setPostNote(String postId, PostNote postNote) =>
      _service.setData(
          path: FirestorePath.postNote(postId, postNote.id),
          data: postNote.toMap(),
          merge: true
      );

  Future<void> deletePostNote(String postId, String noteId) => _service.deleteData(
    path: FirestorePath.postNote(postId, noteId),
  );

  Future<List<PostNote>> getPostNotes(String postId) =>
      _service.getCollection(
        path: FirestorePath.postNotes(postId),
        queryBuilder: (query) =>
            query.orderBy("docTime.updatedAt", descending: true),
        builder: (data, documentId) => PostNote.fromMap(documentId, data),
      );

  Future<void> setPostStatus(String postId, PostStatus postStatus) =>
      _service.setData(
        path: FirestorePath.postStatus(postId),
        data: postStatus.toMap(),
        merge: true,
      );

  Future<List<Post>> getPosts() => _service.getCollection(
        path: FirestorePath.posts(),
        queryBuilder: (query) =>
            query.orderBy("docTime.createdAt", descending: true),
        builder: (data, documentId) => Post.fromMap(documentId, data),
      );

  Future<Post> getPost(String postId) => _service.getDocument(
        path: FirestorePath.post(postId),
        builder: (data, documentId) => Post.fromMap(documentId, data),
      );

  Future<String> addPostComment(String postId, Comment comment) =>
      _service.addData(
        collectionPath: FirestorePath.postComments(postId),
        data: comment.toMap(),
      );

  Future<void> setPostComment(String postId, Comment comment) =>
      _service.setData(
        path: FirestorePath.postComment(postId, comment.id),
        data: comment.toMap(),
        merge: true
      );

  Future<void> deletePostComment(String postId, String commentId) => _service.deleteData(
        path: FirestorePath.postComment(postId, commentId),
      );

  Future<List<Comment>> getPostComments(String postId) =>
      _service.getCollection(
        path: FirestorePath.postComments(postId),
        queryBuilder: (query) =>
            query.orderBy("docTime.createdAt", descending: true),
        builder: (data, documentId) => Comment.fromMap(documentId, data),
      );

  Future<String> addPostHelp(String postId, PostHelp postHelp) =>
      _service.addData(
        collectionPath: FirestorePath.postHelps(postId),
        data: postHelp.toMap(),
      );

  Future<void> setPostHelp(String postId, PostHelp postHelp) =>
      _service.setData(
          path: FirestorePath.postHelp(postId, postHelp.id),
          data: postHelp.toMap(),
          merge: true
      );

  Future<void> deletePostHelp(String postId, String helpId) => _service.deleteData(
    path: FirestorePath.postHelp(postId, helpId),
  );

  Future<List<PostHelp>> getPostHelps(String postId) =>
      _service.getCollection(
        path: FirestorePath.postHelps(postId),
        queryBuilder: (query) =>
            query.orderBy("docTime.createdAt", descending: true),
        builder: (data, documentId) => PostHelp.fromMap(documentId, data),
      );
}
