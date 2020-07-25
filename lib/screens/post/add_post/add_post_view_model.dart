import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/platform_alert_dialog.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/constants/data_example.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/services/database/label_database.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/common/doc_time.dart';
import 'package:ideashare/services/models/common/owner_info.dart';
import 'package:ideashare/services/models/label/label.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post/post_info.dart';
import 'package:ideashare/services/models/post/post/post_info_image.dart';
import 'package:ideashare/services/models/post/post/post_labels.dart';
import 'package:ideashare/services/models/post/post/post_share_options.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
import 'package:ideashare/services/models/post/post_status/post_status.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:ideashare/services/models/user_settings/default_share_options/user_settings_default_share_options.dart';
import 'package:ideashare/services/models/user_settings/user_settings.dart';
import 'package:ideashare/services/storage/firebase_storage_result.dart';
import 'package:ideashare/services/storage/firebase_storage_service.dart';
import 'package:ideashare/utils/custom_locales.dart';
import 'package:ideashare/utils/extensions/string.dart';
import 'package:ideashare/utils/flushbar_utils.dart';

class AddPostViewModel with ChangeNotifier {
  AddPostViewModel({
    @required this.labelDatabase,
    @required this.profileDatabase,
    @required this.postDatabase,
    @required this.firebaseStorageService,
    @required this.currentUser,
  }) {
    this.fetchLabels();
    this.fetchDefaultShareOptions();
  }

  final LabelDatabase labelDatabase;
  final ProfileDatabase profileDatabase;
  final PostDatabase postDatabase;
  final FirebaseStorageService firebaseStorageService;
  final User currentUser;

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
  bool isLoadingSave = false;

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
    bool isLoadingSave,
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
    this.isLoadingSave = isLoadingSave ?? this.isLoadingSave;
    notifyListeners();
  }

  Map<AddPostStep, String Function()> validators(BuildContext context) => {
        AddPostStep.category: () => post.category == null
            ? S.of(context).addPostTitleCategory.capitalize() +
                " " +
                S.of(context).isRequired
            : null,
        AddPostStep.info: () {
          List<String> fields = [];
          if (post.info.title == null || post.info.title.isEmpty) {
            fields.add(S.of(context).addPostInfoInputTitle);
          }
          if (post.info.resume == null || post.info.resume.isEmpty) {
            fields.add(S.of(context).addPostInfoInputResume);
          }
          if (fields.isNotEmpty) {
            return fields
                .map((e) => e.capitalize() + " " + S.of(context).isRequired)
                .toList()
                .join("\n");
          }
          return null;
        }
      };

  bool validate(BuildContext context, {AddPostStep addPostStep}) {
    AddPostStep step = addPostStep;
    if (step == null) {
      step = this.currentStep;
    }
    if (validators(context)[step] != null) {
      String text = validators(context)[step]();
      if (text != null) {
        FlushbarUtils(
          context,
          type: FlushbarType.error,
          message: text,
          duration: Duration(seconds: 7),
        ).show();
        return false;
      }
    }
    return true;
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

  void nextStep(BuildContext context) {
    if (validate(context)) {
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

  Future<bool> showDeleteAlertDialog(BuildContext context) async {
    if (isLoadingSave) {
      return false;
    }
    return await PlatformAlertDialog(
      defaultActionText: S.of(context).delete,
      title: S.of(context).addPostDeleteTitle,
      cancelActionText: S.of(context).cancel,
      content: S.of(context).addPostDeleteMessage,
    ).show(context);
  }

  void reset(BuildContext context) async {
    bool result = await showDeleteAlertDialog(context);
    if (result != null && result) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  Future<bool> save(BuildContext context) async {
    bool result = await PlatformAlertDialog(
      defaultActionText: S.of(context).save,
      title: S.of(context).addPostSaveTitle,
      cancelActionText: S.of(context).cancel,
      content: S.of(context).addPostSaveMessage,
    ).show(context);
    if (result != null && result) {
      updateWith(isLoadingSave: true);

      try {
        //COPY POST
        Post finalPost = Post.fromMap(null, post.toMap());

        //STORAGE
        List<FirebaseStorageResult> storageResults;
        if (images != null && images.isNotEmpty) {
          storageResults = await firebaseStorageService.uploadMultipleFiles(
            files: images,
            uid: finalPost.id,
            path: StorageKeys.postImages,
          );
        }

        //POST IMAGES
        if (storageResults != null) {
          storageResults.asMap().forEach((key, value) {
            finalPost.info.images.add(PostInfoImage(
              id: value.fileName,
              order: key,
              imageUrl: value.fileUrl,
            ));
          });
        }

        //INIT POST
        finalPost.ownerInfo = OwnerInfo.fromUser(currentUser);
        finalPost.status = PostStatusType.open;
        finalPost.docTime = DocTime.init();

        //SAVE POST
        await postDatabase.setPost(finalPost);

        //SAVE POST NOTE
        if (postNote != null &&
            postNote.text != null &&
            postNote.text.isNotEmpty) {
          PostNote finalPostNote = PostNote.fromMap(null, postNote.toMap());
          finalPostNote.userId = currentUser.id;
          finalPostNote.docTime = DocTime.init();

          await postDatabase.addPostNote(finalPost.id, finalPostNote);
        }

        //SAVE POST STATUS
        PostStatus postStatus = PostStatus.init();
        await postDatabase.setPostStatus(finalPost.id, postStatus);

        updateWith(isLoadingSave: false);
        return true;
      } catch (e) {
        print(e);
        updateWith(isLoadingSave: false);
        return false;
      }
    }
    return false;
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
