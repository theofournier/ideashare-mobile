import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  Future<bool> isDataExists({
    @required String path,
  }) async {
    final doc = await Firestore.instance.document(path).get();
    return (doc != null && doc.exists);
  }

  Future<T> getDocument<T>({
    @required String path,
    @required T Function(Map<String, dynamic> data, String documentID) builder,
  }) async {
    final doc = await Firestore.instance.document(path).get();
    return builder(doc.data, doc.documentID);
  }

  Future<void> setData({
    @required String path,
    @required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.setData(data, merge: merge);
  }

  Future<String> addData({
    @required String collectionPath,
    @required Map<String, dynamic> data
  }) async {
    CollectionReference collectionReference = Firestore.instance.collection(collectionPath);
    print('$collectionPath: $data');
    DocumentReference documentReference = await collectionReference.add(data);
    return documentReference.documentID;
  }

  Future<void> deleteData({@required String path}) async {
    final reference = Firestore.instance.document(path);
    print('delete: $path');
    await reference.delete();
  }

  Future<List<T>> getCollection<T>({
    @required String path,
    @required T Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query) queryBuilder,
  }) async {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = await query.getDocuments();
    return snapshots.documents
        .map((doc) => builder(doc.data, doc.documentID))
        .toList();
  }

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query) queryBuilder,
    int Function(T lhs, T rhs) sort,
  }) {
    Query query = Firestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.documents
          .map((snapshot) => builder(snapshot.data, snapshot.documentID))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    @required String path,
    @required T Function(Map<String, dynamic> data, String documentID) builder,
  }) {
    final DocumentReference reference = Firestore.instance.document(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots
        .map((snapshot) => builder(snapshot.data, snapshot.documentID));
  }
}
