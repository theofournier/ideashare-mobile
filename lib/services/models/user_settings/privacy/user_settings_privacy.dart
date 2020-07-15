import 'package:ideashare/services/models/user_settings/privacy/user_settings_privacy_account.dart';
import 'package:ideashare/services/models/user_settings/privacy/user_settings_privacy_posts.dart';
import 'package:ideashare/services/models/user_settings/privacy/user_settings_privacy_users.dart';

class UserSettingsPrivacy {
  UserSettingsPrivacy({
    this.account,
    this.posts,
    this.users,
  });

  final UserSettingsPrivacyAccount account;
  final UserSettingsPrivacyPosts posts;
  final UserSettingsPrivacyUsers users;

  factory UserSettingsPrivacy.fromMap(Map<String, dynamic> json) => UserSettingsPrivacy(
    account: UserSettingsPrivacyAccount.fromMap(json["account"]),
    posts: UserSettingsPrivacyPosts.fromMap(json["posts"]),
    users: UserSettingsPrivacyUsers.fromMap(json["users"]),
  );

  Map<String, dynamic> toMap() => {
    "account": account.toMap(),
    "posts": posts.toMap(),
    "users": users.toMap(),
  };
}