class CommentCounts {
  CommentCounts({
    this.likes = 0,
  });

  final int likes;

  factory CommentCounts.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : CommentCounts(
    likes: json["likes"],
  );

  Map<String, dynamic> toMap() => {
    "likes": likes,
  };
}
