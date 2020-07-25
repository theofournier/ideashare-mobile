import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/utils/enum_string.dart';

class PostStatus {
  PostStatus({
    this.id,
    this.type,
    this.docTime,
  });

  final String id;
  final PostStatusType type;
  final DocTime docTime;

  factory PostStatus.fromMap(String id, Map<String, dynamic> json) =>
      json == null
          ? null
          : PostStatus(
              id: id,
              type: EnumString.fromString(PostStatusType.values, json["type"]),
              docTime: DocTime.fromMap(json["docTime"]),
            );

  Map<String, dynamic> toMap() => {
        "type": EnumString.string(type),
        "docTime": docTime == null ? null : docTime.toMap(),
      };

  factory PostStatus.init() => PostStatus(
        type: PostStatusType.open,
        docTime: DocTime.init(),
      );
}
