import 'package:ideashare/services/models/common/approval.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';
import 'package:ideashare/services/models/common/promote.dart';
import 'package:ideashare/services/models/post/post_help/post_help_counts.dart';
import 'package:ideashare/services/models/post/post_help/post_help_info.dart';
import 'package:uuid/uuid.dart';

class PostHelp {
  PostHelp({
    this.id,
    this.ownerInfo,
    this.info,
    this.counts,
    this.promote,
    this.approval,
    this.anonymous = false,
    this.docTime,
  }) {
    this.id = this.id ?? Uuid().v4();
    this.ownerInfo = this.ownerInfo ?? OwnerInfo();
    this.info = this.info ?? PostHelpInfo();
    this.counts = this.counts ?? PostHelpCounts();
    this.promote = this.promote ?? Promote();
    //this.approval = this.approval ?? Approval();
  }

  String id;
  OwnerInfo ownerInfo;
  PostHelpInfo info;
  PostHelpCounts counts;
  Promote promote;
  Approval approval;
  bool anonymous;
  DocTime docTime;

  factory PostHelp.fromMap(String id, Map<String, dynamic> json) => json == null
      ? null
      : PostHelp(
          id: id,
          ownerInfo: OwnerInfo.fromMap(json["ownerInfo"]),
          info: PostHelpInfo.fromMap(json["info"]),
          counts: PostHelpCounts.fromMap(json["counts"]),
          promote: Promote.fromMap(json["promote"]),
          approval: Approval.fromMap(json["approval"]),
          anonymous: json["anonymous"],
          docTime: DocTime.fromMap(json["docTime"]),
        );

  Map<String, dynamic> toMap() => {
        "ownerInfo": ownerInfo != null ? ownerInfo.toMap() : null,
        "info": info != null ? info.toMap() : null,
        "counts": counts != null ? counts.toMap() : null,
        "promote": promote != null ? promote.toMap() : null,
        "approval": approval != null ? approval.toMap() : null,
        "anonymous": anonymous,
        'docTime': docTime != null ? docTime.toMap() : null,
      };
}
