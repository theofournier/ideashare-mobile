import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';
import 'package:ideashare/services/models/user_settings/default_share_options/user_settings_default_share_options.dart';
import 'package:ideashare/services/models/user_settings/notification/user_settings_notification.dart';
import 'package:ideashare/services/models/user_settings/notification/user_settings_notification_followed_posts.dart';
import 'package:ideashare/services/models/user_settings/notification/user_settings_notification_posts.dart';
import 'package:ideashare/services/models/user_settings/notification/user_settings_notification_profile.dart';
import 'package:ideashare/services/models/user_settings/privacy/user_settings_privacy.dart';
import 'package:ideashare/services/models/user_settings/privacy/user_settings_privacy_account.dart';
import 'package:ideashare/services/models/user_settings/privacy/user_settings_privacy_posts.dart';
import 'package:ideashare/services/models/user_settings/privacy/user_settings_privacy_users.dart';
import 'package:ideashare/services/models/user_settings/security/user_settings_security.dart';

class UserSettings {
  UserSettings({
    this.uid,
    this.defaultShareOptions,
    this.security,
    this.privacy,
    this.notification,
    this.language,
  });

  final String uid;
  final UserSettingsDefaultShareOptions defaultShareOptions;
  final UserSettingsSecurity security;
  final UserSettingsPrivacy privacy;
  final UserSettingsNotification notification;
  final String language;

  factory UserSettings.fromMap(String uid, Map<String, dynamic> json) =>
      UserSettings(
        uid: uid,
        defaultShareOptions: UserSettingsDefaultShareOptions.fromMap(
            json["defaultShareOptions"]),
        security: UserSettingsSecurity.fromMap(json["security"]),
        privacy: UserSettingsPrivacy.fromMap(json["privacy"]),
        notification: UserSettingsNotification.fromMap(json["notification"]),
        language: json["language"],
      );

  Map<String, dynamic> toMap() => {
        "defaultShareOptions": defaultShareOptions.toMap(),
        "security": security.toMap(),
        "privacy": privacy.toMap(),
        "notification": notification.toMap(),
        "language": language,
      };

  factory UserSettings.initUserSettings({String uid}) => UserSettings(
        uid: uid,
        defaultShareOptions: UserSettingsDefaultShareOptions(
          idea: PostShareOptions(
            privacy: Privacy.public,
            anonymous: false,
            like: Visibleness.everyone,
            comment: Visibleness.everyone,
            createComment: Visibleness.everyone,
            help: Visibleness.everyone,
            createHelp: Visibleness.approval,
            news: Visibleness.follow,
            work: Visibleness.approval,
            contact: Visibleness.work,
            follow: Visibleness.everyone,
            status: Visibleness.everyone,
          ),
          issue: PostShareOptions(
            privacy: Privacy.public,
            anonymous: false,
            like: Visibleness.everyone,
            comment: Visibleness.everyone,
            createComment: Visibleness.everyone,
            help: Visibleness.everyone,
            createHelp: Visibleness.approval,
            news: Visibleness.follow,
            createLinkedPost: Visibleness.everyone,
            linkedPosts: Visibleness.everyone,
            work: Visibleness.approval,
            contact: Visibleness.work,
            follow: Visibleness.everyone,
            status: Visibleness.everyone,
          ),
        ),
        security: UserSettingsSecurity(
          saveLoginInfo: true,
          linkedAccount: [],
        ),
        privacy: UserSettingsPrivacy(
          account: UserSettingsPrivacyAccount(
            privacy: Privacy.public,
            contacted: Visibleness.everyone,
            followed: Visibleness.everyone,
          ),
          posts: UserSettingsPrivacyPosts(
            follow: Visibleness.everyone,
            mine: Visibleness.everyone,
          ),
          users: UserSettingsPrivacyUsers(
            follow: Visibleness.everyone,
          ),
        ),
        notification: UserSettingsNotification(
          push: true,
          email: false,
          posts: UserSettingsNotificationPosts(
            like: [NotificationMethod.push],
            comment: [NotificationMethod.push],
            follow: [NotificationMethod.push],
            help: [NotificationMethod.push],
            helpApproval: [NotificationMethod.push],
            work: [NotificationMethod.push],
            workApproval: [NotificationMethod.push],
            linkedPost: [NotificationMethod.push],
            linkedPostApproval: [NotificationMethod.push],
          ),
          followedPosts: UserSettingsNotificationFollowedPosts(
            news: [NotificationMethod.push],
            help: [NotificationMethod.push],
            update: [NotificationMethod.push],
            linkedPost: [NotificationMethod.push],
          ),
          profile: UserSettingsNotificationProfile(
            followed: [NotificationMethod.push],
            contacted: [NotificationMethod.push],
          ),
        ),
        language: "default",
      );
}
