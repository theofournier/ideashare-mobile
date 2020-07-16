import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class PostShareOptions {
  PostShareOptions({
    this.postId,
    this.privacy,
    this.anonymous,
    this.like,
    this.comment,
    this.help,
    this.news,
    this.createLinkedPost,
    this.linkedPosts,
    this.work,
    this.contact,
    this.follow,
    this.status,
  });

  final String postId;
  final Privacy privacy;
  final bool anonymous;
  final Visibleness like;
  final Visibleness work;
  final Visibleness follow;
  final Visibleness comment;
  final Visibleness help;
  final Visibleness news;
  final Visibleness createLinkedPost;
  final Visibleness linkedPosts;
  final Visibleness contact;
  final Visibleness status;

  factory PostShareOptions.fromMap(String postId, Map<String, dynamic> json) => PostShareOptions(
    postId: postId,
    privacy: EnumString.fromString(Privacy.values, json["privacy"]),
    anonymous: json["anonymous"],
    like: EnumString.fromString(Visibleness.values, json["like"]),
    work: EnumString.fromString(Visibleness.values, json["work"]),
    follow: EnumString.fromString(Visibleness.values, json["follow"]),
    comment: EnumString.fromString(Visibleness.values, json["comment"]),
    help: EnumString.fromString(Visibleness.values, json["help"]),
    news: EnumString.fromString(Visibleness.values, json["news"]),
    createLinkedPost: EnumString.fromString(Visibleness.values, json["createLinkedPost"]),
    linkedPosts: EnumString.fromString(Visibleness.values, json["linkedPosts"]),
    contact: EnumString.fromString(Visibleness.values, json["contact"]),
    status: EnumString.fromString(Visibleness.values, json["status"]),
  );

  Map<String, dynamic> toMap() => {
    "privacy": EnumString.string(privacy),
    "anonymous": anonymous,
    "like": EnumString.string(like),
    "work": EnumString.string(work),
    "follow": EnumString.string(follow),
    "comment": EnumString.string(comment),
    "help": EnumString.string(help),
    "news": EnumString.string(news),
    "createLinkedPost": EnumString.string(createLinkedPost),
    "linkedPosts": EnumString.string(linkedPosts),
    "contact": EnumString.string(contact),
    "status": EnumString.string(status),
  };
}