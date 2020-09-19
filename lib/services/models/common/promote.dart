import 'package:cloud_firestore/cloud_firestore.dart';

class Promote {
  Promote({
    this.promoted = false,
    this.order = 0,
    this.promotedDate,
  });

  bool promoted;
  int order;
  DateTime promotedDate;

  factory Promote.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : Promote(
          promoted: json["promoted"],
          order: json["order"],
          promotedDate: json["promotedDate"] == null
              ? null
              : (json["promotedDate"] as Timestamp).toDate(),
        );

  Map<String, dynamic> toMap() => {
        "promoted": this.promoted,
        "order": this.order,
        "promotedDate": this.promotedDate != null
            ? Timestamp.fromDate(this.promotedDate)
            : null,
      };
}
