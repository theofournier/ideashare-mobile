import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';
import 'package:ideashare/services/models/post/post/post_counts.dart';
import 'package:ideashare/services/models/post/post/post_info.dart';
import 'package:ideashare/services/models/post/post/post_labels.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';
import 'package:ideashare/utils/enum_string.dart';
import 'package:uuid/uuid.dart';

class Post {
  Post({
    this.id,
    this.category,
    this.ownerInfo,
    this.info,
    this.labels,
    this.status = PostStatusType.open,
    this.shareOptions,
    this.counts,
    this.premium = false,
    this.docTime,
  }) {
    this.id = this.id ?? Uuid().v4();
    this.ownerInfo = this.ownerInfo ?? OwnerInfo();
    this.info = this.info ?? PostInfo();
    this.labels = this.labels ?? [];
    //this.shareOptions = this.shareOptions ?? PostShareOptions();
    this.counts = this.counts ?? PostCounts();
  }

  String id;
  PostType category;
  OwnerInfo ownerInfo;
  PostInfo info;
  List<PostLabel> labels;
  PostStatusType status;
  PostShareOptions shareOptions;
  PostCounts counts;
  bool premium;
  DocTime docTime;

  factory Post.fromMap(String id, Map<String, dynamic> json) => json == null ? null : Post(
        id: id,
        category: EnumString.fromString(PostType.values, json["category"]),
        ownerInfo: OwnerInfo.fromMap(json["ownerInfo"]),
        info: PostInfo.fromMap(json["info"]),
        labels: json['labels'] == null ||
                (json['labels'] as Map<String, dynamic>).length == 0
            ? []
            : (json['labels'] as Map<String, dynamic>)?.entries?.map(
                  (e) => e.value == null
                      ? null
                      : PostLabel(id: e.key, title: e.value),
                )?.toList(),
        status: EnumString.fromString(PostStatusType.values, json["status"]),
        shareOptions: PostShareOptions.fromMap(json["shareOptions"]),
        counts: PostCounts.fromMap(json["counts"]),
        premium: json["premium"],
        docTime: DocTime.fromMap(json["docTime"]),
      );

  Map<String, dynamic> toMap() => {
        "category": EnumString.string(category),
        "ownerInfo": ownerInfo != null ? ownerInfo.toMap() : null,
        "info": info != null ? info.toMap() : null,
        "labels": labels != null ? {for (PostLabel label in labels) label.id: label.title} : null,
        "status": status != null ? EnumString.string(status) : null,
        "shareOptions": shareOptions != null ? shareOptions.toMap() : null,
        "counts": counts != null ? counts.toMap() : null,
        "premium": premium,
        'docTime': docTime != null ? docTime.toMap() : null,
      };
}
