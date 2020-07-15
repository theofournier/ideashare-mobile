import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsNotificationPosts {
  UserSettingsNotificationPosts({
    this.like,
    this.comment,
    this.follow,
    this.help,
    this.helpApproval,
    this.work,
    this.workApproval,
    this.linkedPost,
    this.linkedPostApproval,
  });

  final List<NotificationMethod> like;
  final List<NotificationMethod> comment;
  final List<NotificationMethod> follow;
  final List<NotificationMethod> help;
  final List<NotificationMethod> helpApproval;
  final List<NotificationMethod> work;
  final List<NotificationMethod> workApproval;
  final List<NotificationMethod> linkedPost;
  final List<NotificationMethod> linkedPostApproval;

  factory UserSettingsNotificationPosts.fromMap(Map<String, dynamic> json) => UserSettingsNotificationPosts(
    like: List<NotificationMethod>.from(json["like"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    comment: List<NotificationMethod>.from(json["comment"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    follow: List<NotificationMethod>.from(json["follow"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    help: List<NotificationMethod>.from(json["help"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    helpApproval: List<NotificationMethod>.from(json["helpApproval"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    work: List<NotificationMethod>.from(json["work"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    workApproval: List<NotificationMethod>.from(json["workApproval"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    linkedPost: List<NotificationMethod>.from(json["linkedPost"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    linkedPostApproval: List<NotificationMethod>.from(json["linkedPostApproval"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
  );

  Map<String, dynamic> toMap() => {
    "like": List<dynamic>.from(like.map((x) => EnumString.string(x))),
    "comment": List<dynamic>.from(comment.map((x) => EnumString.string(x))),
    "follow": List<dynamic>.from(follow.map((x) => EnumString.string(x))),
    "help": List<dynamic>.from(help.map((x) => EnumString.string(x))),
    "helpApproval": List<dynamic>.from(helpApproval.map((x) => EnumString.string(x))),
    "work": List<dynamic>.from(work.map((x) => EnumString.string(x))),
    "workApproval": List<dynamic>.from(workApproval.map((x) => EnumString.string(x))),
    "linkedPost": List<dynamic>.from(linkedPost.map((x) => EnumString.string(x))),
    "linkedPostApproval": List<dynamic>.from(linkedPostApproval.map((x) => EnumString.string(x))),
  };
}