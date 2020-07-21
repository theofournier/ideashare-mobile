import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class PostShareOptions {
  PostShareOptions({
    this.privacy = Privacy.public,
    this.anonymous = false,
    this.like = Visibleness.everyone,
    this.comment = Visibleness.everyone,
    this.createComment = Visibleness.everyone,
    this.help = Visibleness.everyone,
    this.createHelp = Visibleness.everyone,
    this.news = Visibleness.follow,
    this.createLinkedPost = Visibleness.follow,
    this.linkedPosts = Visibleness.follow,
    this.work = Visibleness.approval,
    this.contact = Visibleness.work,
    this.follow = Visibleness.follow,
    this.status = Visibleness.follow,
  });

  final Privacy privacy;
  final bool anonymous;
  final Visibleness like;
  final Visibleness work;
  final Visibleness follow;
  final Visibleness comment;
  final Visibleness createComment;
  final Visibleness help;
  final Visibleness createHelp;
  final Visibleness news;
  final Visibleness createLinkedPost;
  final Visibleness linkedPosts;
  final Visibleness contact;
  final Visibleness status;

  factory PostShareOptions.fromMap(Map<String, dynamic> json) =>
      PostShareOptions(
        privacy: EnumString.fromString(Privacy.values, json["privacy"]),
        anonymous: json["anonymous"],
        like: EnumString.fromString(Visibleness.values, json["like"]),
        work: EnumString.fromString(Visibleness.values, json["work"]),
        follow: EnumString.fromString(Visibleness.values, json["follow"]),
        comment: EnumString.fromString(Visibleness.values, json["comment"]),
        createComment:
            EnumString.fromString(Visibleness.values, json["createComment"]),
        help: EnumString.fromString(Visibleness.values, json["help"]),
        createHelp:
            EnumString.fromString(Visibleness.values, json["createHelp"]),
        news: EnumString.fromString(Visibleness.values, json["news"]),
        createLinkedPost:
            EnumString.fromString(Visibleness.values, json["createLinkedPost"]),
        linkedPosts:
            EnumString.fromString(Visibleness.values, json["linkedPosts"]),
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
        "createComment": EnumString.string(createComment),
        "help": EnumString.string(help),
        "createHelp": EnumString.string(createHelp),
        "news": EnumString.string(news),
        "createLinkedPost": EnumString.string(createLinkedPost),
        "linkedPosts": EnumString.string(linkedPosts),
        "contact": EnumString.string(contact),
        "status": EnumString.string(status),
      };
}
