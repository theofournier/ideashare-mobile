import 'package:ideashare/services/models/post/post_infos/post_info_image.dart';

class PostInfo {
  PostInfo({
    this.postId,
    this.description,
    this.images,
    this.urlLinks,
    this.linkedIssue,
  });

  final String postId;
  final String description;
  final List<PostInfoImage> images;
  final List<String> urlLinks;
  final String linkedIssue;

  factory PostInfo.fromMap(String postId, Map<String, dynamic> json) => PostInfo(
    postId: postId,
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
  );

  Map<String, dynamic> toMap() => {
    "description": description,
    "images": {for (PostInfoImage image in images) image.id: image.toMap()},
    "urlLinks": List<String>.from(urlLinks.map((x) => x)),
    "linkedIssue": linkedIssue,
  };
}