import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/post/post/post_labels.dart';
import 'package:ideashare/services/models/post/post_share_options/post_share_options.dart';
import 'package:ideashare/utils/enum_string.dart';

class Post {
  Post({
    this.id,
    this.category,
    this.ownerId,
    this.ownerFirstname,
    this.ownerLastname,
    this.ownerPhotoUrl,
    this.title,
    this.imageUrl,
    this.resume,
    this.labels,
    this.language,
    this.status,
    this.shareOptions,
    this.viewsCount,
    this.likesCount,
    this.followersCount,
    this.workersCount,
    this.commentsCount,
    this.helpsCount,
    this.newsCount,
    this.linkedPostsCount,
    this.notesCount,
    this.premium,
    this.docTime,
  });

  final String id;
  final PostType category;
  final String ownerId;
  final String ownerFirstname;
  final String ownerLastname;
  final String ownerPhotoUrl;
  final String title;
  final String imageUrl;
  final String resume;
  final List<PostLabel> labels;
  final String language;
  final PostStatusType status;
  final PostShareOptions shareOptions;
  final int viewsCount;
  final int likesCount;
  final int followersCount;
  final int workersCount;
  final int commentsCount;
  final int helpsCount;
  final int newsCount;
  final int linkedPostsCount;
  final int notesCount;
  final bool premium;
  final DocTime docTime;

  factory Post.fromMap(String id, Map<String, dynamic> json) => Post(
        id: id,
        category: EnumString.fromString(PostType.values, json["category"]),
        ownerId: json["ownerId"],
        ownerFirstname: json["ownerFirstname"],
        ownerLastname: json["ownerLastname"],
        ownerPhotoUrl: json["ownerPhotoUrl"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        resume: json["resume"],
        labels: (json['labels'] as Map<String, dynamic>) == null ||
                (json['labels'] as Map<String, dynamic>).length == 0
            ? []
            : (json['labels'] as Map<String, dynamic>)?.entries?.map(
                  (e) => e.value == null
                      ? null
                      : PostLabel(id: e.key, title: e.value),
                ),
        language: json["language"],
        status: EnumString.fromString(PostStatusType.values, json["status"]),
        shareOptions: PostShareOptions.fromMap(id, json["shareOptions"]),
        viewsCount: json["viewsCount"],
        likesCount: json["likesCount"],
        followersCount: json["followersCount"],
        workersCount: json["workersCount"],
        commentsCount: json["commentsCount"],
        helpsCount: json["helpsCount"],
        newsCount: json["newsCount"],
        linkedPostsCount: json["linkedPostsCount"],
        notesCount: json["notesCount"],
        premium: json["premium"],
        docTime: DocTime.fromMap(json["docTime"]),
      );

  Map<String, dynamic> toMap() => {
        "category": EnumString.string(category),
        "ownerId": ownerId,
        "ownerFirstname": ownerFirstname,
        "ownerLastname": ownerLastname,
        "ownerPhotoUrl": ownerPhotoUrl,
        "title": title,
        "imageUrl": imageUrl,
        "resume": resume,
        "labels": {for (PostLabel label in labels) label.id: label.title},
        "language": language,
        "status": EnumString.string(status),
        "shareOptions": shareOptions.toMap(),
        "viewsCount": viewsCount,
        "likesCount": likesCount,
        "followersCount": followersCount,
        "workersCount": workersCount,
        "commentsCount": commentsCount,
        "helpsCount": helpsCount,
        "newsCount": newsCount,
        "linkedPostsCount": linkedPostsCount,
        "notesCount": notesCount,
        "premium": premium,
        'deleted': docTime.toMap(),
      };
}
