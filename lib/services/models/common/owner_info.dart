import 'package:ideashare/services/models/user/user.dart';

class OwnerInfo {
  OwnerInfo({
    this.userId,
    this.firstName,
    this.lastName,
    this.photoUrl,
  });

  String get displayName {
    List<String> names = [];
    if (firstName != null && firstName.isNotEmpty) {
      names.add(firstName);
    }
    if (lastName != null && lastName.isNotEmpty) {
      names.add(lastName);
    }
    return names.isNotEmpty ? names.join(" ") : "";
  }

  String userId;
  String firstName;
  String lastName;
  String photoUrl;

  factory OwnerInfo.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : OwnerInfo(
          userId: json["userId"],
          firstName: json["firstName"],
          lastName: json["lastName"],
          photoUrl: json["photoUrl"],
        );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "photoUrl": photoUrl,
      };

  factory OwnerInfo.fromUser(User user) => OwnerInfo(
        userId: user.id,
        firstName: user.info.firstName,
        lastName: user.info.lastName,
        photoUrl: user.info.photoUrl,
      );
}
