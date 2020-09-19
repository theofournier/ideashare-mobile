import 'package:flutter/material.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post_help/post_help.dart';
import 'package:ideashare/services/models/user/user.dart';

enum HelpAction {
  delete,
  save,
}

class HelpViewModel with ChangeNotifier {
  HelpViewModel({
    @required this.postDatabase,
    @required this.currentUser,
    this.postId,
    this.helpId,
    this.initialHelp,
  }) {
    this.copyInitialHelp(initialHelp);
  }

  final PostDatabase postDatabase;
  final User currentUser;

  final String postId;
  final String helpId;
  final PostHelp initialHelp;
  PostHelp help;

  String get getHelpId => this.help?.id ?? this.helpId;

  bool isLoading = false;

  void updateWith({
    PostHelp help,
    bool isLoading,
  }) {
    this.help = help ?? this.help;
    this.isLoading = isLoading ?? this.isLoading;
    notifyListeners();
  }

  void copyInitialHelp(PostHelp initialHelp) {
    if (initialHelp != null) {
      this.help = PostHelp.fromMap(initialHelp.id, initialHelp.toMap());
    } else {
      this.help = PostHelp();
    }
  }

}
