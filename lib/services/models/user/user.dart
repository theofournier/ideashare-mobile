import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/user/user_label.dart';
import 'package:ideashare/utils/enum_string.dart';

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.photoUrl,
    this.email,
    this.privacy,
    this.followed,
    this.ideasCount,
    this.issuesCount,
    this.postViewsCount,
    this.postLikesCount,
    this.postFollowersCount,
    this.postWorkersCount,
    this.labels,
    this.followersCount,
    this.premium,
    this.userRole,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String email;
  final Privacy privacy;
  final Visibility followed;
  final int ideasCount;
  final int issuesCount;
  final int postViewsCount;
  final int postLikesCount;
  final int postFollowersCount;
  final int postWorkersCount;
  final List<UserLabel> labels;
  final int followersCount;
  final bool premium;
  final UserRole userRole;
  final bool deleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  factory User.fromMap(String id, Map<String, dynamic> value) {
    return User(
      firstName: value['firstName'] as String,
      lastName: value['lastName'] as String,
      photoUrl: value['photoUrl'] as String,
      email: value['email'] as String,
      privacy: EnumString.fromString(Privacy.values, value['privacy']),
      followed: EnumString.fromString(Visibility.values, value['followed']),
      ideasCount: value['ideasCount'] as int,
      issuesCount: value['issuesCount'] as int,
      postViewsCount: value['postViewsCount'] as int,
      postLikesCount: value['postLikesCount'] as int,
      postFollowersCount: value['postFollowersCount'] as int,
      postWorkersCount: value['postWorkersCount'] as int,
      labels: (value['labels'] as Map<String, dynamic>)?.entries?.map(
            (e) => e.value == null
                ? null
                : UserLabel.fromMap(e.key, e.value as Map<String, dynamic>),
          ),
      followersCount: value['followersCount'],
      premium: value['premium'] as bool,
      userRole: EnumString.fromString(UserRole.values, value['userRole']),
      deleted: value['deleted'] as bool,
      createdAt: value['createdAt'] == null
          ? null
          : DateTime.parse(value['createdAt'] as String),
      updatedAt: value['updatedAt'] == null
          ? null
          : DateTime.parse(value['updatedAt'] as String),
      deletedAt: value['deletedAt'] == null
          ? null
          : DateTime.parse(value['deletedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'firstName': this.firstName,
        'lastName': this.lastName,
        'photoUrl': this.photoUrl,
        'email': this.email,
        'privacy': EnumString.toString(this.privacy),
        'followed': EnumString.toString(this.followed),
        'ideasCount': this.ideasCount,
        'issuesCount': this.issuesCount,
        'postViewsCount': this.postViewsCount,
        'postLikesCount': this.postLikesCount,
        'postFollowersCount': this.postFollowersCount,
        'postWorkersCount': this.postWorkersCount,
        'followers': this.followersCount,
        'premium': this.premium,
        'userRole': EnumString.toString(this.userRole),
        'deleted': this.deleted,
        'createdAt': this.createdAt?.toIso8601String(),
        'updatedAt': this.updatedAt?.toIso8601String(),
        'deletedAt': this.deletedAt?.toIso8601String(),
      };
}
