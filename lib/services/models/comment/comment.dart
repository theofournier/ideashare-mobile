import 'package:ideashare/services/models/comment/comment_counts.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';

class Comment {
  Comment({
    this.id,
    this.ownerInfo,
    this.text = "",
    this.counts,
    this.anonymous = false,
    this.docTime,
  }){
    this.counts = this.counts ?? CommentCounts();
  }

  String id;
  OwnerInfo ownerInfo;
  String text;
  CommentCounts counts;
  bool anonymous;
  DocTime docTime;

  factory Comment.fromMap(String id, Map<String, dynamic> json) => json == null
      ? null
      : Comment(
    id: id,
    ownerInfo: OwnerInfo.fromMap(json["ownerInfo"]),
    text: json["text"],
    counts: CommentCounts.fromMap(json["counts"]),
    anonymous: json["premium"],
    docTime: DocTime.fromMap(json["docTime"]),
  );

  Map<String, dynamic> toMap() => {
    "ownerInfo": ownerInfo != null ? ownerInfo.toMap() : null,
    "text": text,
    "counts": counts != null ? counts.toMap() : null,
    "anonymous": anonymous,
    'docTime': docTime != null ? docTime.toMap() : null,
  };
}
