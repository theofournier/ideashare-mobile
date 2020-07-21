import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/services/database/label_database.dart';
import 'package:ideashare/services/models/label/label.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post/post_info.dart';
import 'package:ideashare/services/models/post/post/post_labels.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
import 'package:ideashare/utils/custom_locales.dart';

class AddPostViewModel with ChangeNotifier {
  AddPostViewModel({
    @required this.labelDatabase,
  }) {
    this.fetchLabels();
  }

  final LabelDatabase labelDatabase;

  AddPostStep currentStep = AddPostStep.labels;
  Post post = Post();
  PostNote postNote = PostNote();
  List<File> images = [];
  Post linkedIssue;

  List<MapEntry<String, String>> languages =
      CustomLocales.localeNamesSortedByName(
          CustomLocales.nativeLocaleNamesWithoutRegion);
  List<String> popularLanguageCodes = CustomLocales.popularLocaleCodes;

  bool isLoadingLabels = false;
  List<Label> labels = [];

  void updateWith({
    AddPostStep currentStep,
    Post post,
    PostInfo postInfo,
    List<PostLabel> postLabels,
    PostNote postNote,
    List<File> images,
    List<Label> labels,
    bool isLoadingLabels,
  }) {
    this.currentStep = currentStep ?? this.currentStep;
    this.post = post ?? this.post;
    this.post.info = postInfo ?? this.post.info;
    this.post.labels = postLabels ?? this.post.labels;
    this.postNote = postNote ?? this.postNote;
    this.images = images ?? this.images;
    this.labels = labels ?? this.labels;
    this.isLoadingLabels = isLoadingLabels ?? this.isLoadingLabels;
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

  Future<void> fetchLabels() async {
    updateWith(isLoadingLabels: true);
    List<Label> labels = await labelDatabase.getLabels();
    updateWith(isLoadingLabels: false, labels: labels);
  }

  void setPostLabel({String id, String title}) {
    int index = post.labels.indexWhere((label) => label.id == id);
    if (index != -1) {
      updateWith(postLabels: post.labels..removeAt(index));
    } else {
      updateWith(postLabels: post.labels..add(PostLabel(id: id, title: title)));
    }
  }
}
