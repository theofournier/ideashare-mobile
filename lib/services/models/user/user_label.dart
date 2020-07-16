class UserLabel {
  UserLabel({
    this.id,
    this.title,
    this.postCount,
  });

  final String id;
  final String title;
  final int postCount;

  factory UserLabel.fromMap(String id, Map<String, dynamic> json) {
    return UserLabel(
      id: id,
      title: json['title'] as String,
      postCount: json['postCount'] as int,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
    'title': this.title,
    'postCount': this.postCount,
  };
}
