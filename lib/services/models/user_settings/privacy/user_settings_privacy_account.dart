import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/utils/enum_string.dart';

class UserSettingsPrivacyAccount {
  UserSettingsPrivacyAccount({
    this.privacy,
    this.contacted,
    this.followed,
  });

  final Privacy privacy;
  final Visibleness contacted;
  final Visibleness followed;

  factory UserSettingsPrivacyAccount.fromMap(Map<String, dynamic> json) => UserSettingsPrivacyAccount(
    privacy: EnumString.fromString(Privacy.values, json["privacy"]),
    contacted: EnumString.fromString(Visibleness.values, json["contacted"]),
    followed: EnumString.fromString(Visibleness.values, json["followed"]),
  );

  Map<String, dynamic> toMap() => {
    "privacy": EnumString.string(privacy),
    "contacted": EnumString.string(contacted),
    "followed": EnumString.string(followed),
  };
}