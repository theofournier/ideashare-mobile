import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
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
    this.docTime,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String photoFileName;
  final String email;
  final Privacy privacy;
  final Visibleness followed;
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
  final DocTime docTime;

  factory User.fromMap(String id, Map<String, dynamic> json) {
    return json == null
        ? null
        : User(
            id: id,
            firstName: json['firstName'] as String,
            lastName: json['lastName'] as String,
            photoUrl: json['photoUrl'] as String,
            photoFileName: json['photoFileName'] as String,
            email: json['email'] as String,
            privacy: EnumString.fromString(Privacy.values, json['privacy']),
            followed:
                EnumString.fromString(Visibleness.values, json['followed']),
            ideasCount: json['ideasCount'] as int,
            issuesCount: json['issuesCount'] as int,
            postViewsCount: json['postViewsCount'] as int,
            postLikesCount: json['postLikesCount'] as int,
            postFollowersCount: json['postFollowersCount'] as int,
            postWorkersCount: json['postWorkersCount'] as int,
            labels: (json['labels'] as Map<String, dynamic>) == null ||
                    (json['labels'] as Map<String, dynamic>).length == 0
                ? []
                : (json['labels'] as Map<String, dynamic>)?.entries?.map(
                      (e) => e.value == null
                          ? null
                          : UserLabel.fromMap(
                              e.key, e.value as Map<String, dynamic>),
                    ),
            followersCount: json['followersCount'] as int,
            premium: json['premium'] as bool,
            userRole: EnumString.fromString(UserRole.values, json['userRole']),
            docTime: DocTime.fromMap(json["docTime"]),
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
      firstName: firstName,
      lastName: lastName,
      photoUrl: photoUrl,
      photoFileName: null,
      email: email,
      privacy: Privacy.public,
      followed: Visibleness.everyone,
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
      docTime: DocTime(
        deleted: false,
        createdAt: Timestamp.now().toDate(),
        updatedAt: Timestamp.now().toDate(),
        deletedAt: null,
      ),
    );
  }
}
