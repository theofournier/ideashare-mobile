import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsNotificationProfile {
  UserSettingsNotificationProfile({
    this.followed,
    this.contacted,
  });

  final List<NotificationMethod> followed;
  final List<NotificationMethod> contacted;

  factory UserSettingsNotificationProfile.fromMap(Map<String, dynamic> json) =>
      json == null
          ? null
          : UserSettingsNotificationProfile(
              followed: json["followed"] == null
                  ? []
                  : List<NotificationMethod>.from(json["followed"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
              contacted: json["contacted"] == null
                  ? []
                  : List<NotificationMethod>.from(json["contacted"].map((x) =>
                      EnumString.fromString(NotificationMethod.values, x))),
            );

  Map<String, dynamic> toMap() => {
        "followed": followed == null
            ? null
            : List<dynamic>.from(followed.map((x) => EnumString.string(x))),
        "contacted": contacted == null
            ? null
            : List<dynamic>.from(contacted.map((x) => EnumString.string(x))),
      };
}
