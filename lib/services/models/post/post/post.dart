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
    this.ownerFirstName,
    this.ownerLastName,
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

   String id;
   PostType category;
   String ownerId;
   String ownerFirstName;
   String ownerLastName;
   String ownerPhotoUrl;
   String title;
   String imageUrl;
   String resume;
   List<PostLabel> labels;
   String language;
   PostStatusType status;
   PostShareOptions shareOptions;
   int viewsCount;
   int likesCount;
   int followersCount;
   int workersCount;
   int commentsCount;
   int helpsCount;
   int newsCount;
   int linkedPostsCount;
   int notesCount;
   bool premium;
   DocTime docTime;

  

  factory Post.fromMap(String id, Map<String, dynamic> json) => Post(
        id: id,
        category: EnumString.fromString(PostType.values, json["category"]),
        ownerId: json["ownerId"],
        ownerFirstName: json["ownerFirstName"],
        ownerLastName: json["ownerLastName"],
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
        "ownerFirstName": ownerFirstName,
        "ownerLastName": ownerLastName,
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
