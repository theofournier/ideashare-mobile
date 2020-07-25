class UserInfo {
  UserInfo({
    this.firstName,
    this.lastName,
    this.photoUrl,
    this.email,
  });

  final String firstName;
  final String lastName;
  final String photoUrl;
  final String email;

  factory UserInfo.fromMap(Map<String, dynamic> json) => json == null
      ? null
      : UserInfo(
          firstName: json["firstName"],
          lastName: json["lastName"],
          photoUrl: json["photoUrl"],
          email: json["email"],
        );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "photoUrl": photoUrl,
        "email": email,
      };
}
