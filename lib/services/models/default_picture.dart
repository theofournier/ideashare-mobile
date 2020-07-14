import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/services/models/user/user_label.dart';
import 'package:ideashare/utils/enum_string.dart';

class DefaultPicture {
  DefaultPicture({
    this.id,
    this.name,
    this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  factory DefaultPicture.fromMap(String id, Map<String, dynamic> value) {
    return value == null
        ? null
        : DefaultPicture(
            id: id,
            name: value['name'] as String,
            imageUrl: value['imageUrl'] as String,
          );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': this.name,
        'imageUrl': this.imageUrl,
      };
}
