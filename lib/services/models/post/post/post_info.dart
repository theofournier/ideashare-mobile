import 'package:ideashare/services/models/post/post/post_info_image.dart';

class PostInfo {
  PostInfo({
    this.title,
    this.resume,
    this.description,
    this.images,
    this.urlLinks,
    this.linkedIssue,
    this.language,
  }) {
    this.images = this.images ?? [];
    this.urlLinks = this.urlLinks ?? [];
  }

  String title;
  String resume;
  String description;
  List<PostInfoImage> images;
  List<String> urlLinks;
  String linkedIssue;
  String language;

  factory PostInfo.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : PostInfo(
          title: json["title"],
          resume: json["resume"],
          description: json["description"],
          images: json['images'] == null ||
                  (json['images'] as Map<String, dynamic>).length == 0
              ? []
              : (json['images'] as Map<String, dynamic>)?.entries?.map(
                    (e) => PostInfoImage.fromMap(e.key, e.value),
                  ),
          urlLinks: json["urlLinks"] == null ||
                  (json["urlLinks"] as List<String>).length == 0
              ? []
              : List<String>.from(json["urlLinks"].map((x) => x)),
          linkedIssue: json["linkedIssue"],
          language: json["language"],
        );

  Map<String, dynamic> toMap() => {
        "title": title,
        "resume": resume,
        "description": description,
        "images": images == null
            ? null
            : {for (PostInfoImage image in images) image.id: image.toMap()},
        "urlLinks":
            urlLinks == null ? null : List<String>.from(urlLinks.map((x) => x)),
        "linkedIssue": linkedIssue,
        "language": language,
      };
}
