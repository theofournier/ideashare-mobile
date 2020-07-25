class UserSettingsSecurity {
  UserSettingsSecurity({
    this.saveLoginInfo,
    this.linkedAccount,
  });

  final bool saveLoginInfo;
  final List<String> linkedAccount;

  factory UserSettingsSecurity.fromMap(Map<String, dynamic> json) =>
      json == null
          ? null
          : UserSettingsSecurity(
              saveLoginInfo: json["saveLoginInfo"],
              linkedAccount: json["linkedAccount"] == null
                  ? []
                  : List<String>.from(json["linkedAccount"].map((x) => x)),
            );

  Map<String, dynamic> toMap() => {
        "saveLoginInfo": saveLoginInfo,
        "linkedAccount": linkedAccount == null
            ? null
            : List<dynamic>.from(linkedAccount.map((x) => x)),
      };
}
