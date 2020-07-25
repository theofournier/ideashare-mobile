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

  factory UserSettingsNotificationPosts.fromMap(Map<String, dynamic> json) =>
      json == null
          ? null
          : UserSettingsNotificationPosts(
              like: json["like"] == null
                  ? []
                  : List<NotificationMethod>.from(json["like"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
              comment: json["comment"] == null
                  ? []
                  : List<NotificationMethod>.from(json["comment"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
              follow: json["follow"] == null
                  ? []
                  : List<NotificationMethod>.from(json["follow"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
              help: json["help"] == null
                  ? []
                  : List<NotificationMethod>.from(json["help"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
              helpApproval: json["helpApproval"] == null
                  ? []
                  : List<NotificationMethod>.from(json["helpApproval"].map(
                      (x) =>
                          EnumString.fromString(NotificationMethod.values, x))),
              work: json["work"] == null
                  ? []
                  : List<NotificationMethod>.from(json["work"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
              workApproval: json["workApproval"] == null
                  ? []
                  : List<NotificationMethod>.from(json["workApproval"].map(
                      (x) =>
                          EnumString.fromString(NotificationMethod.values, x))),
              linkedPost: json["linkedPost"] == null
                  ? []
                  : List<NotificationMethod>.from(json["linkedPost"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
              linkedPostApproval: json["linkedPostApproval"] == null
                  ? []
                  : List<NotificationMethod>.from(json["linkedPostApproval"]
                      .map((x) =>
                          EnumString.fromString(NotificationMethod.values, x))),
            );

  Map<String, dynamic> toMap() => {
        "like": like == null
            ? null
            : List<dynamic>.from(like.map((x) => EnumString.string(x))),
        "comment": comment == null
            ? null
            : List<dynamic>.from(comment.map((x) => EnumString.string(x))),
        "follow": follow == null
            ? null
            : List<dynamic>.from(follow.map((x) => EnumString.string(x))),
        "help": help == null
            ? null
            : List<dynamic>.from(help.map((x) => EnumString.string(x))),
        "helpApproval": helpApproval == null
            ? null
            : List<dynamic>.from(helpApproval.map((x) => EnumString.string(x))),
        "work": work == null
            ? null
            : List<dynamic>.from(work.map((x) => EnumString.string(x))),
        "workApproval": workApproval == null
            ? null
            : List<dynamic>.from(workApproval.map((x) => EnumString.string(x))),
        "linkedPost": linkedPost == null
            ? null
            : List<dynamic>.from(linkedPost.map((x) => EnumString.string(x))),
        "linkedPostApproval": linkedPostApproval == null
            ? null
            : List<dynamic>.from(
                linkedPostApproval.map((x) => EnumString.string(x))),
      };
}
