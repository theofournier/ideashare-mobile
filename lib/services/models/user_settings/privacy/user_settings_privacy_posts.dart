import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsPrivacyPosts {
  UserSettingsPrivacyPosts({
    this.mine,
    this.follow,
  });

  final Visibleness mine;
  final Visibleness follow;

  factory UserSettingsPrivacyPosts.fromMap(Map<String, dynamic> json) => UserSettingsPrivacyPosts(
    mine: EnumString.fromString(Visibleness.values, json["mine"]),
    follow: EnumString.fromString(Visibleness.values, json["follow"]),
  );

  Map<String, dynamic> toMap() => {
    "mine": EnumString.string(mine),
    "follow": EnumString.string(follow),
  };
}