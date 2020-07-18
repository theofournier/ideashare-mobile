import 'package:ideashare/services/models/common/doc_time.dart';

class PostNote {
  PostNote({
    this.userId,
    this.text,
    this.docTime,
  });

  final String userId;
  String text;
  final DocTime docTime;

  factory PostNote.fromMap(Map<String, dynamic> json) => PostNote(
    userId: json["userId"],
    text: json["text"],
    docTime: DocTime.fromMap(json["docTime"]),
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "text": text,
    "docTime": docTime.toMap(),
  };
}