
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/user/user.dart';

import 'firestore_path.dart';

class ProfileDatabase {
  ProfileDatabase({@required this.uid})
      : assert(uid != null, 'Cannot create FirestoreDatabase with null uid');

  final String uid;

  final _service = FirestoreService.instance;


  Stream<User> profileStream() => _service.documentStream(
    path: FirestorePath.user(uid),
    builder: (data, documentId) => User.fromMap(documentId, data),
  );

  Future<void> setProfilePhotoUrl(String photoUrl) => _service.setData(
    path: FirestorePath.user(uid),
    data: {"photoUrl": photoUrl},
    merge: true,
  );
}