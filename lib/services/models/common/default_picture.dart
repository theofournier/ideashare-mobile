class DefaultPicture {
  DefaultPicture({
    this.id,
    this.name,
    this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  factory DefaultPicture.fromMap(String id, Map<String, dynamic> json) {
    return json == null
        ? null
        : DefaultPicture(
            id: id,
            name: json['name'] as String,
            imageUrl: json['imageUrl'] as String,
          );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': this.name,
        'imageUrl': this.imageUrl,
      };
}
