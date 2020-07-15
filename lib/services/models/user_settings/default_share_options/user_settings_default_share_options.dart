import 'package:ideashare/services/models/user_settings/default_share_options/user_settings_default_share_options_post.dart';

class UserSettingsDefaultShareOptions {
  UserSettingsDefaultShareOptions({
    this.idea,
    this.issue,
  });

  final UserSettingsDefaultShareOptionsPost idea;
  final UserSettingsDefaultShareOptionsPost issue;

  factory UserSettingsDefaultShareOptions.fromMap(Map<String, dynamic> json) => UserSettingsDefaultShareOptions(
    idea: UserSettingsDefaultShareOptionsPost.fromMap(json["idea"]),
    issue: UserSettingsDefaultShareOptionsPost.fromMap(json["issue"]),
  );

  Map<String, dynamic> toMap() => {
    "idea": idea.toMap(),
    "issue": issue.toMap(),
  };
}