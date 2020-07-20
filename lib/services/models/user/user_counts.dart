class UserCounts {
  UserCounts({
    this.ideas = 0,
    this.issues = 0,
    this.postViews = 0,
    this.postLikes = 0,
    this.postFollowers = 0,
    this.postWorkers = 0,
    this.followers = 0,
  });

  final int ideas;
  final int issues;
  final int postViews;
  final int postLikes;
  final int postFollowers;
  final int postWorkers;
  final int followers;

  factory UserCounts.fromMap(Map<String, dynamic> json) => UserCounts(
    ideas: json["ideas"],
    issues: json["issues"],
    postViews: json["postViews"],
    postLikes: json["postLikes"],
    postFollowers: json["postFollowers"],
    postWorkers: json["postWorkers"],
    followers: json["followers"],
  );

  Map<String, dynamic> toMap() => {
    "ideas": ideas,
    "issues": issues,
    "postViews": postViews,
    "postLikes": postLikes,
    "postFollowers": postFollowers,
    "postWorkers": postWorkers,
    "followers": followers,
  };
}