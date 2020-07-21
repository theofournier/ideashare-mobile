import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/share_options_widget.dart';
import 'package:ideashare/constants/constants.dart';
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

  Post post = Post(category: PostType.idea);
  PostNote postNote = PostNote();
  List<File> images = [];
  Post linkedIssue;
  List<ShareOptionsData> shareOptions;

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
    this.isLoadingShareOptions = isLoadingShareOptions ?? this.isLoadingShareOptions;
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

  Future<void> fetchDefaultShareOptions() async {
    updateWith(isLoadingShareOptions: true);
    UserSettings userSettings = await profileDatabase.getUserSettings();
    updateWith(isLoadingShareOptions: false, defaultShareOptions: userSettings.defaultShareOptions);
  }

  void resetShareOptions() {
    if(defaultShareOptions != null){
      PostShareOptions postShareOptions;
      if(post.category == PostType.idea){
        postShareOptions = defaultShareOptions.idea;
      }
      if(post.category == PostType.issue){
        postShareOptions = defaultShareOptions.issue;
      }
      if(postShareOptions != null){
        PostShareOptions copyPostShareOptions = PostShareOptions.fromMap(postShareOptions.toMap());
        updateWith(postShareOptions: copyPostShareOptions);
      }
    }
  }
}
