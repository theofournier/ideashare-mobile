import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsNotificationFollowedPosts {
  UserSettingsNotificationFollowedPosts({
    this.news,
    this.help,
    this.update,
    this.linkedPost,
  });

  final List<NotificationMethod> news;
  final List<NotificationMethod> help;
  final List<NotificationMethod> update;
  final List<NotificationMethod> linkedPost;

  factory UserSettingsNotificationFollowedPosts.fromMap(Map<String, dynamic> json) => UserSettingsNotificationFollowedPosts(
    news: List<NotificationMethod>.from(json["news"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    help: List<NotificationMethod>.from(json["help"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    update: List<NotificationMethod>.from(json["update"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    linkedPost: List<NotificationMethod>.from(json["linkedPost"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
  );

  Map<String, dynamic> toMap() => {
    "news": List<dynamic>.from(news.map((x) => EnumString.string(x))),
    "help": List<dynamic>.from(help.map((x) => EnumString.string(x))),
    "update": List<dynamic>.from(update.map((x) => EnumString.string(x))),
    "linkedPost": List<dynamic>.from(linkedPost.map((x) => EnumString.string(x))),
  };
}