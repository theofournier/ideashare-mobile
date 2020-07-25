import 'package:ideashare/services/models/post/post/post_share_options.dart';

class UserSettingsDefaultShareOptions {
  UserSettingsDefaultShareOptions({
    this.idea,
    this.issue,
  });

  final PostShareOptions idea;
  final PostShareOptions issue;

  factory UserSettingsDefaultShareOptions.fromMap(Map<String, dynamic> json) =>
      json == null
          ? null
          : UserSettingsDefaultShareOptions(
              idea: PostShareOptions.fromMap(json["idea"]),
              issue: PostShareOptions.fromMap(json["issue"]),
            );

  Map<String, dynamic> toMap() => {
        "idea": idea == null ? null : idea.toMap(),
        "issue": issue == null ? null : issue.toMap(),
      };
}
