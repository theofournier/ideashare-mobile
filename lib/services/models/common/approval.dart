import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Approval {
  Approval({
    this.approvalId,
    this.required = false,
    this.approved = false,
    this.approvedDate,
  }) {
    this.approvalId = this.approvalId ?? Uuid().v4();
  }

  String approvalId;
  bool required;
  bool approved;
  DateTime approvedDate;

  factory Approval.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : Approval(
          approvalId: json["approvalId"],
          required: json["required"],
          approved: json["approved"],
          approvedDate: json["approvedDate"] == null
              ? null
              : (json["approvedDate"] as Timestamp).toDate(),
        );

  Map<String, dynamic> toMap() => {
        "approvalId": this.approvalId,
        "required": this.required,
        "approved": this.approved,
        "approvedDate": this.approvedDate != null
            ? Timestamp.fromDate(this.approvedDate)
            : null,
      };
}
