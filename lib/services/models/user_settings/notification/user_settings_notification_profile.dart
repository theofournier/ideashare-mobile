import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsNotificationProfile {
  UserSettingsNotificationProfile({
    this.followed,
    this.contacted,
  });

  final List<NotificationMethod> followed;
  final List<NotificationMethod> contacted;

  factory UserSettingsNotificationProfile.fromMap(Map<String, dynamic> json) => UserSettingsNotificationProfile(
    followed: List<NotificationMethod>.from(json["followed"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
    contacted: List<NotificationMethod>.from(json["contacted"].map((x) => EnumString.fromString(NotificationMethod.values, x))),
  );

  Map<String, dynamic> toMap() => {
    "followed": List<dynamic>.from(followed.map((x) => EnumString.string(x))),
    "contacted": List<dynamic>.from(contacted.map((x) => EnumString.string(x))),
  };
}