import 'package:ideashare/services/models/post/post/post_info_image.dart';

class PostHelpInfo {
  PostHelpInfo({
    this.title,
    this.description,
    this.images,
    this.language,
    this.linkedPosts,
  }) {
    this.images = this.images ?? [];
    this.linkedPosts = this.linkedPosts ?? [];
  }

  String title;
  String description;
  List<PostInfoImage> images;
  String language;
  List<String> linkedPosts;

  factory PostHelpInfo.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : PostHelpInfo(
          title: json["title"],
          description: json["description"],
          images: json['images'] == null ||
                  (json['images'] as Map<String, dynamic>).length == 0
              ? []
              : (json['images'] as Map<String, dynamic>)
                  ?.entries
                  ?.map(
                    (e) => PostInfoImage.fromMap(e.key, e.value),
                  )
                  ?.toList(),
          language: json["language"],
          linkedPosts: json["linkedPosts"] == null ||
                  (json["linkedPosts"] as List<dynamic>).length == 0
              ? []
              : List<String>.from(json["linkedPosts"].map((x) => x)),
        );

  Map<String, dynamic> toMap() => {
        "title": this.title,
        "description": this.description,
        "images": images == null
            ? null
            : {for (PostInfoImage image in images) image.id: image.toMap()},
        "linkedPosts": linkedPosts == null
            ? null
            : List<String>.from(linkedPosts.map((x) => x)),
        "language": language,
      };
}
