import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';
import 'package:ideashare/services/models/post/post/post_counts.dart';
import 'package:ideashare/services/models/post/post/post_info.dart';
import 'package:ideashare/services/models/post/post/post_labels.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';
import 'package:ideashare/utils/enum_string.dart';

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
    this.ownerInfo = this.ownerInfo ?? OwnerInfo();
    this.info = this.info ?? PostInfo();
    this.labels = this.labels ?? [];
    this.shareOptions = this.shareOptions ?? PostShareOptions();
    this.counts = this.counts ?? PostCounts();
  }

  final String id;
  PostType category;
  OwnerInfo ownerInfo;
  PostInfo info;
  List<PostLabel> labels;
  PostStatusType status;
  PostShareOptions shareOptions;
  PostCounts counts;
  bool premium;
  DocTime docTime;

  factory Post.fromMap(String id, Map<String, dynamic> json) => Post(
        id: id,
        category: EnumString.fromString(PostType.values, json["category"]),
        ownerInfo: OwnerInfo.fromMap(json["ownerInfo"]),
        info: PostInfo.fromMap(json["info"]),
        labels: (json['labels'] as Map<String, dynamic>) == null ||
                (json['labels'] as Map<String, dynamic>).length == 0
            ? []
            : (json['labels'] as Map<String, dynamic>)?.entries?.map(
                  (e) => e.value == null
                      ? null
                      : PostLabel(id: e.key, title: e.value),
                ),
        status: EnumString.fromString(PostStatusType.values, json["status"]),
        shareOptions: PostShareOptions.fromMap(json["shareOptions"]),
        counts: PostCounts.fromMap(json["counts"]),
        premium: json["premium"],
        docTime: DocTime.fromMap(json["docTime"]),
      );

  Map<String, dynamic> toMap() => {
        "category": EnumString.string(category),
        "ownerInfo": ownerInfo.toMap(),
        "info": info.toMap(),
        "labels": {for (PostLabel label in labels) label.id: label.title},
        "status": EnumString.string(status),
        "shareOptions": shareOptions.toMap(),
        "counts": counts.toMap(),
        "premium": premium,
        'deleted': docTime.toMap(),
      };
}
