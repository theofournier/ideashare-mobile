import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsDefaultShareOptionsPost {
  UserSettingsDefaultShareOptionsPost({
    this.privacy,
    this.anonymous,
    this.like,
    this.comment,
    this.help,
    this.news,
    this.work,
    this.contact,
    this.follow,
    this.status,
    this.createLinkedPost,
    this.linkedPosts,
  });

  final Privacy privacy;
  final bool anonymous;
  final Visibleness like;
  final Visibleness comment;
  final Visibleness help;
  final Visibleness news;
  final Visibleness work;
  final Visibleness contact;
  final Visibleness follow;
  final Visibleness status;
  final Visibleness createLinkedPost;
  final Visibleness linkedPosts;

  factory UserSettingsDefaultShareOptionsPost.fromMap(Map<String, dynamic> json) => UserSettingsDefaultShareOptionsPost(
    privacy: EnumString.fromString(Privacy.values, json["privacy"]),
    anonymous: json["anonymous"],
    like: EnumString.fromString(Visibleness.values, json["like"]),
    comment: EnumString.fromString(Visibleness.values, json["comment"]),
    help: EnumString.fromString(Visibleness.values, json["help"]),
    news: EnumString.fromString(Visibleness.values, json["news"]),
    work: EnumString.fromString(Visibleness.values, json["work"]),
    contact: EnumString.fromString(Visibleness.values, json["contact"]),
    follow: EnumString.fromString(Visibleness.values, json["follow"]),
    status: EnumString.fromString(Visibleness.values, json["status"]),
    createLinkedPost: EnumString.fromString(Visibleness.values, json["createLinkedPost"]),
    linkedPosts: EnumString.fromString(Visibleness.values, json["linkedPosts"]),
  );

  Map<String, dynamic> toMap() => {
    "privacy": EnumString.string(privacy),
    "anonymous": anonymous,
    "like": EnumString.string(like),
    "comment": EnumString.string(comment),
    "help": EnumString.string(help),
    "news": EnumString.string(news),
    "work": EnumString.string(work),
    "contact": EnumString.string(contact),
    "follow": EnumString.string(follow),
    "status": EnumString.string(status),
    "createLinkedPost": EnumString.string(createLinkedPost),
    "linkedPosts": EnumString.string(linkedPosts),
  };
}