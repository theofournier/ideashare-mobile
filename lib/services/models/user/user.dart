import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/user/user_label.dart';
import 'package:ideashare/utils/enum_string.dart';

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.photoUrl,
    this.photoFileName,
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
  final String photoFileName;
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
    return value == null
        ? null
        : User(
            id: id,
            firstName: value['firstName'] as String,
            lastName: value['lastName'] as String,
            photoUrl: value['photoUrl'] as String,
            photoFileName: value['photoFileName'] as String,
            email: value['email'] as String,
            privacy: EnumString.fromString(Privacy.values, value['privacy']),
            followed:
                EnumString.fromString(Visibility.values, value['followed']),
            ideasCount: value['ideasCount'] as int,
            issuesCount: value['issuesCount'] as int,
            postViewsCount: value['postViewsCount'] as int,
            postLikesCount: value['postLikesCount'] as int,
            postFollowersCount: value['postFollowersCount'] as int,
            postWorkersCount: value['postWorkersCount'] as int,
            labels: (value['labels'] as Map<String, dynamic>) == null ||
                    (value['labels'] as Map<String, dynamic>).length == 0
                ? []
                : (value['labels'] as Map<String, dynamic>)?.entries?.map(
                      (e) => e.value == null
                          ? null
                          : UserLabel.fromMap(
                              e.key, e.value as Map<String, dynamic>),
                    ),
            followersCount: value['followersCount'] as int,
            premium: value['premium'] as bool,
            userRole: EnumString.fromString(UserRole.values, value['userRole']),
            deleted: value['deleted'] as bool,
            createdAt: value['createdAt'] == null
                ? null
                : (value['createdAt'] as Timestamp).toDate(),
            updatedAt: value['updatedAt'] == null
                ? null
                : (value['updatedAt'] as Timestamp).toDate(),
            deletedAt: value['deletedAt'] == null
                ? null
                : (value['deletedAt'] as Timestamp).toDate(),
          );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'firstName': this.firstName,
        'lastName': this.lastName,
        'photoUrl': this.photoUrl,
        'photoFileName': this.photoFileName,
        'email': this.email,
        'privacy': EnumString.string(this.privacy),
        'followed': EnumString.string(this.followed),
        'ideasCount': this.ideasCount,
        'issuesCount': this.issuesCount,
        'postViewsCount': this.postViewsCount,
        'postLikesCount': this.postLikesCount,
        'postFollowersCount': this.postFollowersCount,
        'postWorkersCount': this.postWorkersCount,
        'labels': {for (UserLabel label in labels) label.id: label.toMap()},
        'followers': this.followersCount,
        'premium': this.premium,
        'userRole': EnumString.string(this.userRole),
        'deleted': this.deleted,
        'createdAt':
            this.createdAt != null ? Timestamp.fromDate(this.createdAt) : null,
        'updatedAt':
            this.updatedAt != null ? Timestamp.fromDate(this.updatedAt) : null,
        'deletedAt':
            this.deletedAt != null ? Timestamp.fromDate(this.deletedAt) : null,
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
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      photoFileName: null,
      email: email,
      privacy: Privacy.public,
      followed: Visibility.everyone,
      ideasCount: 0,
      issuesCount: 0,
      postViewsCount: 0,
      postLikesCount: 0,
      postFollowersCount: 0,
      postWorkersCount: 0,
      labels: [],
      followersCount: 0,
      premium: false,
      userRole: UserRole.user,
      deleted: false,
      createdAt: Timestamp.now().toDate(),
      updatedAt: Timestamp.now().toDate(),
      deletedAt: null,
    );
  }
}
