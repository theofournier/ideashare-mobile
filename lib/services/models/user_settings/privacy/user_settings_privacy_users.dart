import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsPrivacyUsers {
  UserSettingsPrivacyUsers({
    this.follow,
  });

  final Visibleness follow;

  factory UserSettingsPrivacyUsers.fromMap(Map<String, dynamic> json) => UserSettingsPrivacyUsers(
    follow: EnumString.fromString(Visibleness.values, json["follow"]),
  );

  Map<String, dynamic> toMap() => {
    "follow": EnumString.string(follow),
  };
}