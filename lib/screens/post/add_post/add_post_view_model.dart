import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post/post_info.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
import 'package:ideashare/utils/custom_locales.dart';

class AddPostViewModel with ChangeNotifier {
  AddPostStep currentStep = AddPostStep.linkedIssue;
  Post post = Post();
  PostNote postNote = PostNote();
  List<File> images = [];
  Post linkedIssue;

  List<MapEntry<String, String>> languages =
      CustomLocales.localeNamesSortedByName(
          CustomLocales.nativeLocaleNamesWithoutRegion);
  List<String> popularLanguageCodes = CustomLocales.popularLocaleCodes;

  void updateWith({
    AddPostStep currentStep,
    Post post,
    PostInfo postInfo,
    PostNote postNote,
    List<File> images,
  }) {
    this.currentStep = currentStep ?? this.currentStep;
    this.post = post ?? this.post;
    this.post.info = postInfo ?? this.post.info;
    this.postNote = postNote ?? this.postNote;
    this.images = images ?? this.images;
    notifyListeners();
  }

  void nextStep() {
    if (this.currentStep.index < AddPostStep.values.length - 1) {
      goToStep(AddPostStep.values[this.currentStep.index + 1]);
    }
  }

  void previousStep() {
    if (this.currentStep.index > 0) {
      goToStep(AddPostStep.values[this.currentStep.index - 1]);
    }
  }

  void goToStep(AddPostStep step) {
    updateWith(currentStep: step);
  }

  void reset() {
    currentStep = null;
    post = Post();
    postNote = PostNote();
    images = [];
    notifyListeners();
  }

  void save() {
    print("SAVE");
  }
}
