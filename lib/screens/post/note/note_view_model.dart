import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
import 'package:ideashare/services/models/user/user.dart';

enum NoteAction {
  delete,
  save,
}

class NoteViewModel with ChangeNotifier {
  NoteViewModel({
    @required this.postDatabase,
    @required this.currentUser,
    this.postId,
    this.noteId,
    this.initialNote,
  }) {
    this.copyInitialNote(initialNote);
  }

  final PostDatabase postDatabase;
  final User currentUser;

  final String postId;
  final String noteId;
  final PostNote initialNote;
  PostNote note;

  String get getNoteId => this.note?.id ?? this.noteId;

  bool get needSave =>
      (note?.text?.isNotEmpty ?? false) &&
      (note?.text != initialNote?.text ?? false);

  bool isLoading = false;

  void updateWith({
    PostNote note,
    bool isLoading,
  }) {
    this.note = note ?? this.note;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }

  void copyInitialNote(PostNote initialNote) {
    if (initialNote != null) {
      this.note = PostNote.fromMap(initialNote.id, initialNote.toMap());
    } else {
      this.note = PostNote();
    }
  }

  Future<bool> saveNote(BuildContext context) async {
    try {
      updateWith(isLoading: true);
      if (note.id != null) {
        note.docTime.updatedAt = Timestamp.now().toDate();
        await postDatabase.setPostNote(postId, note);
      } else {
        note.userId = currentUser.id;
        note.docTime = DocTime.init();
        await postDatabase.addPostNote(postId, note);
      }
      updateWith(isLoading: false);
      Navigator.of(context).pop(NoteAction.save);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      print("ERROR SAVE NOTE: ${e}");
      return false;
    }
  }

  Future<bool> deleteNote(BuildContext context) async {
    try {
      updateWith(isLoading: true);
      await postDatabase.deletePostNote(postId, getNoteId);
      updateWith(isLoading: false);
      Navigator.of(context).pop(NoteAction.delete);
      return true;
    } catch (e) {
      updateWith(isLoading: false);
      print("ERROR DELETE NOTE: ${e}");
      return false;
    }
  }
}
