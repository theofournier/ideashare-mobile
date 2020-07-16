import 'package:flutter/material.dart';
import 'package:ideashare/services/database/firestore_service.dart';

class FirestoreDatabase {
  FirestoreDatabase({@required this.uid})
      : assert(uid != null, 'Cannot create FirestoreDatabase with null uid');

  final String uid;

  final _service = FirestoreService.instance;

}