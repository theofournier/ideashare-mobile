class OwnerInfo {
  OwnerInfo({
    this.userId,
    this.firstName,
    this.lastName,
    this.photoUrl,
  });

  String userId;
  String firstName;
  String lastName;
  String photoUrl;

  factory OwnerInfo.fromMap(Map<String, dynamic> json) => OwnerInfo(
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
}