import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/services/storage/firebase_storage_result.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageService {
  Future<FirebaseStorageResult> uploadFile({
    @required File fileToUpload,
    @required String title,
    @required String path,
  }) async {
    var fileName = title + "_" + Uuid().v4();

    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(path).child(fileName);

    StorageUploadTask uploadTask = firebaseStorageRef.putFile(fileToUpload);

    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      var url = downloadUrl.toString();
      return FirebaseStorageResult(
        fileUrl: url,
        fileName: fileName,
      );
    }

    return null;
  }

  Future deleteFile(String path) async {
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(path);

    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}
