import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/constants/data_example.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/services/database/label_database.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/label/label.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post/post_info.dart';
import 'package:ideashare/services/models/post/post/post_labels.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
import 'package:ideashare/services/models/user_settings/default_share_options/user_settings_default_share_options.dart';
import 'package:ideashare/services/models/user_settings/user_settings.dart';
import 'package:ideashare/utils/custom_locales.dart';

class AddPostViewModel with ChangeNotifier {
  AddPostViewModel({
    @required this.labelDatabase,
    @required this.profileDatabase,
  }) {
    this.fetchLabels();
    this.fetchDefaultShareOptions();
  }

  final LabelDatabase labelDatabase;
  final ProfileDatabase profileDatabase;

  AddPostStep currentStep = AddPostStep.category;

  Post post = postExample;
  PostNote postNote = postNoteExample;
  List<File> images = imagesExample;
  Post linkedIssue;

  List<MapEntry<String, String>> languages =
      CustomLocales.localeNamesSortedByName(
          CustomLocales.nativeLocaleNamesWithoutRegion);
  List<String> popularLanguageCodes = CustomLocales.popularLocaleCodes;

  bool isLoadingLabels = false;
  bool isLoadingShareOptions = false;
  List<Label> labels = [];
  UserSettingsDefaultShareOptions defaultShareOptions;

  void updateWith({
    AddPostStep currentStep,
    Post post,
    PostInfo postInfo,
    List<PostLabel> postLabels,
    PostShareOptions postShareOptions,
    PostNote postNote,
    List<File> images,
    List<Label> labels,
    UserSettingsDefaultShareOptions defaultShareOptions,
    bool isLoadingLabels,
    bool isLoadingShareOptions,
  }) {
    this.currentStep = currentStep ?? this.currentStep;
    this.post = post ?? this.post;
    this.post.info = postInfo ?? this.post.info;
    this.post.labels = postLabels ?? this.post.labels;
    this.post.shareOptions = postShareOptions ?? this.post.shareOptions;
    this.postNote = postNote ?? this.postNote;
    this.images = images ?? this.images;
    this.labels = labels ?? this.labels;
    this.defaultShareOptions = defaultShareOptions ?? this.defaultShareOptions;
    this.isLoadingLabels = isLoadingLabels ?? this.isLoadingLabels;
    this.isLoadingShareOptions =
        isLoadingShareOptions ?? this.isLoadingShareOptions;
    notifyListeners();
  }

  int totalStep() {
    if (post.category == null || post.category == PostType.issue) {
      return AddPostStep.values.length - 1;
    }
    return AddPostStep.values.length;
  }

  int currentStepIndex() {
    if (post.category != null &&
        post.category == PostType.issue &&
        currentStep.index >= AddPostStep.linkedIssue.index) {
      return currentStep.index - 1;
    }
    return currentStep.index;
  }

  void nextStep() {
    if (this.currentStep.index < AddPostStep.values.length - 1) {
      int nextIndex = this.currentStep.index + 1;
      if (post.category != null &&
          post.category == PostType.issue &&
          currentStep.index == (AddPostStep.linkedIssue.index - 1)) {
        nextIndex += 1;
      }
      goToStep(AddPostStep.values[nextIndex]);
    }
  }

  void previousStep() {
    if (this.currentStep.index > 0) {
      int previousIndex = this.currentStep.index - 1;
      if (post.category != null &&
          post.category == PostType.issue &&
          currentStep.index == (AddPostStep.linkedIssue.index + 1)) {
        previousIndex -= 1;
      }
      goToStep(AddPostStep.values[previousIndex]);
    }
  }

  void goToStep(AddPostStep step) {
    updateWith(currentStep: step);
  }

  void reset(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
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

  Future<void> fetchDefaultShareOptions() async {
    updateWith(isLoadingShareOptions: true);
    UserSettings userSettings = await profileDatabase.getUserSettings();
    updateWith(
      isLoadingShareOptions: false,
      defaultShareOptions: userSettings.defaultShareOptions,
    );
    if (post.shareOptions == null) {
      resetShareOptions();
    }
  }

  void resetShareOptions() {
    if (defaultShareOptions != null) {
      PostShareOptions postShareOptions = PostShareOptions();
      if (post.category == PostType.idea) {
        postShareOptions = defaultShareOptions.idea;
      }
      if (post.category == PostType.issue) {
        postShareOptions = defaultShareOptions.issue;
      }
      PostShareOptions copyPostShareOptions =
          PostShareOptions.fromMap(postShareOptions.toMap());
      updateWith(postShareOptions: copyPostShareOptions);
    }
  }
}
