import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/alert_dialogs/platform_alert_dialog.dart';
import 'package:ideashare/constants/constants.dart';
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

  Post post = Post();
  PostNote postNote = PostNote();
  List<File> images = [];
  Post linkedIssue;

  List<MapEntry<String, String>> languages =
      CustomLocales.localeNamesSortedByName(
          CustomLocales.nativeLocaleNamesWithoutRegion);
  List<String> popularLanguageCodes = CustomLocales.popularLocaleCodes;

  bool isLoadingLabels = false;
  bool isLoadingShareOptions = false;

  bool isLoadingSave = false;
  bool isLoadingUploadImages = false;
  bool isLoadingSavePost = false;
  bool isLoadingSavePostNote = false;
  bool isLoadingSavePostStatus = false;
  bool success = false;
  bool fail = false;

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
    bool isLoadingUploadImages,
    bool isLoadingSavePost,
    bool isLoadingSavePostNote,
    bool isLoadingSavePostStatus,
    bool success,
    bool fail,
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
    this.isLoadingUploadImages =
        isLoadingUploadImages ?? this.isLoadingUploadImages;
    this.isLoadingSavePost = isLoadingSavePost ?? this.isLoadingSavePost;
    this.isLoadingSavePostNote =
        isLoadingSavePostNote ?? this.isLoadingSavePostNote;
    this.isLoadingSavePostStatus =
        isLoadingSavePostStatus ?? this.isLoadingSavePostStatus;
    this.success = success ?? this.success;
    this.fail = fail ?? this.fail;
    notifyListeners();
  }

  Map<AddPostStep, String Function()> validators() => {
        AddPostStep.category: () => post.category == null
            ? S.current.addPostTitleCategory.capitalize() +
                " " +
                S.current.isRequired
            : null,
        AddPostStep.info: () {
          List<String> fields = [];
          if (post.info.title == null || post.info.title.isEmpty) {
            fields.add(S.current.addPostInfoInputTitle);
          }
          if (post.info.resume == null || post.info.resume.isEmpty) {
            fields.add(S.current.addPostInfoInputResume);
          }
          if (fields.isNotEmpty) {
            return fields
                .map((e) => e.capitalize() + " " + S.current.isRequired)
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
    if (validators()[step] != null) {
      String text = validators()[step]();
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

  void reset(
    BuildContext context, {
    bool showDialog = true,
    bool close = true,
  }) async {
    bool result = showDialog ? await showDeleteAlertDialog(context) : true;
    if (result != null && result) {
      updateWith(
        currentStep: AddPostStep.category,
        images: [],
        post: Post(),
        postNote: PostNote(),
        isLoadingSave: false,
        isLoadingUploadImages: false,
        isLoadingSavePost: false,
        isLoadingSavePostNote: false,
        isLoadingSavePostStatus: false,
        success: false,
        fail: false,
      );
      if (close) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }

  Future<bool> saveTest() async {
    updateWith(
      isLoadingSave: true,
      success: false,
      fail: false,
    );

    updateWith(isLoadingUploadImages: true);
    await Future.delayed(Duration(seconds: 3));
    updateWith(isLoadingUploadImages: false);

    updateWith(isLoadingSavePost: true);
    await Future.delayed(Duration(seconds: 2));
    updateWith(isLoadingSavePost: false);

    updateWith(isLoadingSavePostNote: true);
    await Future.delayed(Duration(seconds: 1));
    updateWith(isLoadingSavePostNote: false);

    updateWith(isLoadingSavePostStatus: true);
    await Future.delayed(Duration(seconds: 1));
    updateWith(isLoadingSavePostStatus: false);

    updateWith(
      isLoadingSave: false,
      success: false,
      fail: true,
    );
    return false;
  }

  Future<bool> save(BuildContext context) async {
    bool result = await PlatformAlertDialog(
      defaultActionText: S.of(context).save,
      title: S.of(context).addPostSaveTitle,
      cancelActionText: S.of(context).cancel,
      content: S.of(context).addPostSaveMessage,
    ).show(context);
    if (result != null && result) {
      updateWith(
        isLoadingSave: true,
        success: false,
        fail: false,
      );

      try {
        //COPY POST
        Post finalPost = Post.fromMap(null, post.toMap());

        //STORAGE
        List<FirebaseStorageResult> storageResults;
        if (images != null && images.isNotEmpty) {
          updateWith(isLoadingUploadImages: true);
          storageResults = await firebaseStorageService.uploadMultipleFiles(
            files: images,
            uid: finalPost.id,
            path: StorageKeys.postImages,
          );
          updateWith(isLoadingUploadImages: false);
        }

        //POST IMAGES
        updateWith(isLoadingSavePost: true);
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
        updateWith(isLoadingSavePost: false);

        //SAVE POST NOTE
        if (postNote != null &&
            postNote.text != null &&
            postNote.text.isNotEmpty) {
          updateWith(isLoadingSavePostNote: true);

          PostNote finalPostNote = PostNote.fromMap(null, postNote.toMap());
          finalPostNote.userId = currentUser.id;
          finalPostNote.docTime = DocTime.init();

          await postDatabase.addPostNote(finalPost.id, finalPostNote);

          updateWith(isLoadingSavePostNote: false);
        }

        //SAVE POST STATUS
        updateWith(isLoadingSavePostStatus: true);
        PostStatus postStatus = PostStatus.init();
        await postDatabase.setPostStatus(finalPost.id, postStatus);
        updateWith(isLoadingSavePostStatus: false);

        updateWith(
          isLoadingSave: false,
          success: true,
          fail: false,
        );
        return true;
      } catch (e) {
        print(e);
        updateWith(
          isLoadingSave: false,
          isLoadingUploadImages: false,
          isLoadingSavePost: false,
          isLoadingSavePostNote: false,
          isLoadingSavePostStatus: false,
          success: false,
          fail: true,
        );
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
  }

  void resetShareOptions() {
    PostShareOptions postShareOptions = PostShareOptions();
    if (defaultShareOptions != null) {
      if (post.category == PostType.idea) {
        postShareOptions = defaultShareOptions.idea;
      }
      if (post.category == PostType.issue) {
        postShareOptions = defaultShareOptions.issue;
      }
    }
    PostShareOptions copyPostShareOptions =
        PostShareOptions.fromMap(postShareOptions.toMap());
    updateWith(postShareOptions: copyPostShareOptions);
  }
}
