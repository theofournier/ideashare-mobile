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
  }){
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

  factory PostInfo.fromMap(Map<String, dynamic> json) => PostInfo(
        title: json["title"],
        resume: json["resume"],
        description: json["description"],
        images: (json['images'] as Map<String, dynamic>) == null ||
                (json['images'] as Map<String, dynamic>).length == 0
            ? []
            : (json['images'] as Map<String, dynamic>)?.entries?.map(
                  (e) => e.value == null
                      ? null
                      : PostInfoImage.fromMap(e.key, e.value),
                ),
        urlLinks: List<String>.from(json["urlLinks"].map((x) => x)),
        linkedIssue: json["linkedIssue"],
        language: json["language"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "resume": resume,
        "description": description,
        "images": {for (PostInfoImage image in images) image.id: image.toMap()},
        "urlLinks": List<String>.from(urlLinks.map((x) => x)),
        "linkedIssue": linkedIssue,
        "language": language,
      };
}
