import 'package:cloud_firestore/cloud_firestore.dart';

class UserPremium {
  UserPremium({
    this.premium = false,
    this.expiresAt,
    this.createdAt,
  });

  final bool premium;
  final DateTime expiresAt;
  final DateTime createdAt;

  factory UserPremium.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : UserPremium(
          premium: json["premium"],
          expiresAt: json["expiresAt"] == null
              ? null
              : (json["expiresAt"] as Timestamp).toDate(),
          createdAt: json["createdAt"] == null
              ? null
              : (json["createdAt"] as Timestamp).toDate(),
        );

  Map<String, dynamic> toMap() => {
        "premium": premium,
        "expiresAt":
            this.expiresAt != null ? Timestamp.fromDate(this.expiresAt) : null,
        "createdAt":
            this.createdAt != null ? Timestamp.fromDate(this.createdAt) : null,
      };
}
