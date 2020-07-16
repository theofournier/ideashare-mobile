import 'package:flutter/material.dart';
import 'package:ideashare/services/database/firestore_path.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/common/default_picture.dart';
import 'package:ideashare/services/models/user/user.dart';

class ProfileDatabase {
  ProfileDatabase({@required this.uid})
      : assert(uid != null, 'Cannot create FirestoreDatabase with null uid');

  final String uid;

  final _service = FirestoreService.instance;

  Stream<User> profileStream() => _service.documentStream(
        path: FirestorePath.user(uid),
        builder: (data, documentId) => User.fromMap(documentId, data),
      );

  Future<void> setProfilePhotoUrl({String photoUrl, String photoFileName}) =>
      _service.setData(
        path: FirestorePath.user(uid),
        data: {
          "photoUrl": photoUrl,
          "photoFileName": photoFileName,
        },
        merge: true,
      );

  Future<List<DefaultPicture>> getDefaultPictures() =>
      _service.getCollection<DefaultPicture>(
          path: FirestorePath.defaultPictures(),
          builder: (data, documentId) =>
              DefaultPicture.fromMap(documentId, data));

  Future<DefaultPicture> getFirstDefaultPicture() async {
    List<DefaultPicture> defaultPictures =
        await _service.getCollection<DefaultPicture>(
            path: FirestorePath.defaultPictures(),
            queryBuilder: (query) => query.limit(1),
            builder: (data, documentId) =>
                DefaultPicture.fromMap(documentId, data));
    return defaultPictures != null && defaultPictures.length > 0
        ? defaultPictures.first
        : null;
  }
}
