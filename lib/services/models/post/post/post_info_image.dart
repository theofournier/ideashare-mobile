class PostInfoImage implements Comparable<PostInfoImage> {
  PostInfoImage({
    this.id,
    this.order,
    this.imageUrl,
  });

  final String id;
  final int order;
  final String imageUrl;

  factory PostInfoImage.fromMap(String id, Map<String, dynamic> json) =>
      json == null
          ? null
          : PostInfoImage(
              id: id,
              order: json["order"],
              imageUrl: json["imageUrl"],
            );

  Map<String, dynamic> toMap() => {
        "order": this.order,
        "imageUrl": this.imageUrl,
      };

  @override
  int compareTo(PostInfoImage other) {
    return order.compareTo(other.order);
  }
}
