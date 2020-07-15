import 'package:ideashare/services/database/firestore_path.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:ideashare/services/models/user_settings/user_settings.dart';

class UserAuthDatabase {
  final _service = FirestoreService.instance;

  Future<void> createUser(
    String uid,
    String firstName,
    String lastName,
    String photoUrl,
    String email,
  ) async {
    final userExists = await _service.isDataExists(
      path: FirestorePath.user(uid),
    );

    if (userExists) {
      return;
    }
    // Create User doc
    User user = User.initUser(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      email: email,
    );
    await setUser(user);

    // Create User Settings doc
    UserSettings userSettings = UserSettings.initUserSettings(uid: uid);
    await setUserSettings(userSettings);

    return;
  }

  Future<void> setUser(User user) => _service.setData(
        path: FirestorePath.user(user.id),
        data: user.toMap(),
      );

  Future<void> setUserSettings(UserSettings userSettings) => _service.setData(
        path: FirestorePath.userSettings(userSettings.uid),
        data: userSettings.toMap(),
      );
}
