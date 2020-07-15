class UserSettingsSecurity {
  UserSettingsSecurity({
    this.saveLoginInfo,
    this.linkedAccount,
  });

  final bool saveLoginInfo;
  final List<String> linkedAccount;

  factory UserSettingsSecurity.fromMap(Map<String, dynamic> json) => UserSettingsSecurity(
    saveLoginInfo: json["saveLoginInfo"],
    linkedAccount: List<String>.from(json["linkedAccount"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "saveLoginInfo": saveLoginInfo,
    "linkedAccount": List<dynamic>.from(linkedAccount.map((x) => x)),
  };
}