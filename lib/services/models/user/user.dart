import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/user/user_counts.dart';
import 'package:ideashare/services/models/user/user_info.dart';
import 'package:ideashare/services/models/user/user_label.dart';
import 'package:ideashare/services/models/user/user_premium.dart';
import 'package:ideashare/utils/enum_string.dart';

class User {
  User({
    this.id,
    this.info,
    this.privacy,
    this.followed,
    this.counts,
    this.labels,
    this.premium,
    this.userRole = UserRole.user,
    this.docTime,
  }) {
    this.info = this.info ?? UserInfo();
    this.counts = this.counts ?? UserCounts();
    this.labels = this.labels ?? [];
    this.premium = this.premium ?? UserPremium();
  }

  final String id;
  UserInfo info;
  final Privacy privacy;
  final Visibleness followed;
  UserCounts counts;
  List<UserLabel> labels;
  UserPremium premium;
  final UserRole userRole;
  final DocTime docTime;

  factory User.fromMap(String id, Map<String, dynamic> json) {
    return json == null
        ? null
        : User(
            id: id,
            info: UserInfo.fromMap(json["info"]),
            privacy: EnumString.fromString(Privacy.values, json['privacy']),
            followed:
                EnumString.fromString(Visibleness.values, json['followed']),
            counts: UserCounts.fromMap(json["counts"]),
            labels: (json['labels'] as Map<String, dynamic>) == null ||
                    (json['labels'] as Map<String, dynamic>).length == 0
                ? []
                : (json['labels'] as Map<String, dynamic>)?.entries?.map(
                      (e) => e.value == null
                          ? null
                          : UserLabel.fromMap(
                              e.key, e.value as Map<String, dynamic>),
                    ),
            premium: UserPremium.fromMap(json['premium']),
            userRole: EnumString.fromString(UserRole.values, json['userRole']),
            docTime: DocTime.fromMap(json["docTime"]),
          );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        "info": info.toMap(),
        'privacy': EnumString.string(this.privacy),
        'followed': EnumString.string(this.followed),
        "counts": counts.toMap(),
        'labels': {for (UserLabel label in labels) label.id: label.toMap()},
        'premium': this.premium.toMap(),
        'userRole': EnumString.string(this.userRole),
        'deleted': this.docTime.toMap(),
      };

  factory User.initUser({
    String uid,
    String firstName,
    String lastName,
    String photoUrl,
    String email,
  }) {
    return User(
      id: uid,
      info: UserInfo(
        firstName: firstName,
        lastName: lastName,
        photoUrl: photoUrl,
        email: email,
      ),
      privacy: Privacy.public,
      followed: Visibleness.everyone,
      counts: UserCounts(
        ideas: 0,
        issues: 0,
        postViews: 0,
        postLikes: 0,
        postFollowers: 0,
        postWorkers: 0,
        followers: 0,
      ),
      labels: [],
      premium: UserPremium(
        premium: false,
        createdAt: null,
        expiresAt: null,
      ),
      userRole: UserRole.user,
      docTime: DocTime(
        deleted: false,
        createdAt: Timestamp.now().toDate(),
        updatedAt: Timestamp.now().toDate(),
        deletedAt: null,
      ),
    );
  }
}
