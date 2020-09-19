class PostHelpCounts {
  PostHelpCounts({
    this.likes = 0,
    this.comments = 0,
  });

  final int likes;
  final int comments;

  factory PostHelpCounts.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : PostHelpCounts(
    likes: json["likes"],
    comments: json["comments"],
  );

  Map<String, dynamic> toMap() => {
    "likes": likes,
    "comments": comments,
  };
}
