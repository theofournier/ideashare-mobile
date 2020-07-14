import 'package:ideashare/services/database/firestore_path.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/user/user.dart';

class UserAuthDatabase {
  final _service = FirestoreService.instance;

  Future<void> createUser(
    String uid,
    String firstName,
    String lastName,
    String photoUrl,
    String email,
  ) async {
    User user = User.initUser(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      email: email,
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
