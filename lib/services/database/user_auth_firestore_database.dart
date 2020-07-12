import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideashare/constants/constants.dart' as Constants;
import 'package:ideashare/services/database/firestore_path.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/user/user.dart';

class UserAuthFirestoreDatabase {
  final _service = FirestoreService.instance;

  Future<void> createUser(
    String uid,
    String firstName,
    String lastName,
    String photoUrl,
    String email,
  ) async {
    User user = User(
      id: uid,
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      email: email,
      privacy: Constants.Privacy.public,
      followed: Constants.Visibility.everyone,
      ideasCount: 0,
      issuesCount: 0,
      postViewsCount: 0,
      postLikesCount: 0,
      postFollowersCount: 0,
      postWorkersCount: 0,
      labels: [],
      followersCount: 0,
      premium: false,
      userRole: Constants.UserRole.user,
      deleted: false,
      createdAt: Timestamp.now().toDate(),
      updatedAt: Timestamp.now().toDate(),
      deletedAt: null,
    );

    final userExists = await _service.isDataExists(
      path: FirestorePath.user(uid),
    );

    if (userExists) {
      return null;
    } else {
      return setUser(user);
    }
  }

  Future<User> getUser(String uid) => _service.getData<User>(
        path: FirestorePath.user(uid),
        builder: (data, documentId) => User.fromMap(documentId, data),
      );

  Future<void> setUser(User user) => _service.setData(
        path: FirestorePath.user(user.id),
        data: user.toMap(),
      );
}
