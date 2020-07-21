import 'package:ideashare/services/models/post/post/post_share_options.dart';

class UserSettingsDefaultShareOptions {
  UserSettingsDefaultShareOptions({
    this.idea,
    this.issue,
  });

  final PostShareOptions idea;
  final PostShareOptions issue;

  factory UserSettingsDefaultShareOptions.fromMap(Map<String, dynamic> json) => UserSettingsDefaultShareOptions(
    idea: PostShareOptions.fromMap(json["idea"]),
    issue: PostShareOptions.fromMap(json["issue"]),
  );

  Map<String, dynamic> toMap() => {
    "idea": idea.toMap(),
    "issue": issue.toMap(),
  };
}