import 'package:cloud_firestore/cloud_firestore.dart';

class DocTime {
  DocTime({
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final bool deleted;
  final DateTime createdAt;
  DateTime updatedAt;
  final DateTime deletedAt;

  factory DocTime.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : DocTime(
          deleted: json["deleted"],
          createdAt: json["createdAt"] == null
              ? null
              : (json["createdAt"] as Timestamp).toDate(),
          updatedAt: json["updatedAt"] == null
              ? null
              : (json["updatedAt"] as Timestamp).toDate(),
          deletedAt: json["deletedAt"] == null
              ? null
              : (json["deletedAt"] as Timestamp).toDate(),
        );

  Map<String, dynamic> toMap() => {
        "deleted": deleted,
        "createdAt":
            this.createdAt != null ? Timestamp.fromDate(this.createdAt) : null,
        "updatedAt":
            this.updatedAt != null ? Timestamp.fromDate(this.updatedAt) : null,
        "deletedAt":
            this.deletedAt != null ? Timestamp.fromDate(this.deletedAt) : null,
      };

  factory DocTime.init() => DocTime(
        deleted: false,
        createdAt: Timestamp.now().toDate(),
        updatedAt: Timestamp.now().toDate(),
        deletedAt: null,
      );
}
