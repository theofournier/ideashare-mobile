import 'package:ideashare/services/models/common/doc_time.dart';

class PostNote {
  PostNote({
    this.id,
    this.userId,
    this.text,
    this.docTime,
  });

  final String id;
  String userId;
  String text;
  DocTime docTime;

  factory PostNote.fromMap(String id, Map<String, dynamic> json) => json == null
      ? null
      : PostNote(
          id: id,
          userId: json["userId"],
          text: json["text"],
          docTime: DocTime.fromMap(json["docTime"]),
        );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "text": text,
        "docTime": docTime == null ? null : docTime.toMap(),
      };
}
