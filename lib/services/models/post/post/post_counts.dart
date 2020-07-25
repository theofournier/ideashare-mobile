class PostCounts {
  PostCounts({
    this.views = 0,
    this.likes = 0,
    this.followers = 0,
    this.workers = 0,
    this.comments = 0,
    this.helps = 0,
    this.news = 0,
    this.linkedPosts = 0,
    this.notes = 0,
  });

  final int views;
  final int likes;
  final int followers;
  final int workers;
  final int comments;
  final int helps;
  final int news;
  final int linkedPosts;
  final int notes;

  factory PostCounts.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : PostCounts(
          views: json["views"],
          likes: json["likes"],
          followers: json["followers"],
          workers: json["workers"],
          comments: json["comments"],
          helps: json["helps"],
          news: json["news"],
          linkedPosts: json["linkedPosts"],
          notes: json["notes"],
        );

  Map<String, dynamic> toMap() => {
        "views": views,
        "likes": likes,
        "followers": followers,
        "workers": workers,
        "comments": comments,
        "helps": helps,
        "news": news,
        "linkedPosts": linkedPosts,
        "notes": notes,
      };
}
