import 'package:ideashare/services/models/user_settings/notification/user_settings_notification_followed_posts.dart';
import 'package:ideashare/services/models/user_settings/notification/user_settings_notification_posts.dart';
import 'package:ideashare/services/models/user_settings/notification/user_settings_notification_profile.dart';

class UserSettingsNotification {
  UserSettingsNotification({
    this.push,
    this.email,
    this.posts,
    this.followedPosts,
    this.profile,
  });

  final bool push;
  final bool email;
  final UserSettingsNotificationPosts posts;
  final UserSettingsNotificationFollowedPosts followedPosts;
  final UserSettingsNotificationProfile profile;

  factory UserSettingsNotification.fromMap(Map<String, dynamic> json) =>
      json == null
          ? null
          : UserSettingsNotification(
              push: json["push"],
              email: json["email"],
              posts: UserSettingsNotificationPosts.fromMap(json["myPosts"]),
              followedPosts: UserSettingsNotificationFollowedPosts.fromMap(
                  json["followedPosts"]),
              profile: UserSettingsNotificationProfile.fromMap(json["profile"]),
            );

  Map<String, dynamic> toMap() => {
        "push": push,
        "email": email,
        "myPosts": posts == null ? null : posts.toMap(),
        "followedPosts": followedPosts == null ? null : followedPosts.toMap(),
        "profile": profile == null ? null : profile.toMap(),
      };
}
