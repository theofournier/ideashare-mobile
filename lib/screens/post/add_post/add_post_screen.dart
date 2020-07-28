import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar_button.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/add_post/add_post_bottom_app_bar.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_category_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_info_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_labels_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_linked_issue_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_loading_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_optional_info_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_resume_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_share_options_content.dart';
import 'package:ideashare/services/database/label_database.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:ideashare/services/storage/firebase_storage_service.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.addPostScreen,
    );
  }

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final LabelDatabase labelDatabase =
        Provider.of<LabelDatabase>(context, listen: false);
    final ProfileDatabase profileDatabase =
        Provider.of<ProfileDatabase>(context, listen: false);
    final PostDatabase postDatabase =
        Provider.of<PostDatabase>(context, listen: false);
    final FirebaseStorageService firebaseStorageService =
        Provider.of<FirebaseStorageService>(context, listen: false);
    final User currentUser = Provider.of<User>(context);

    return ChangeNotifierProvider<AddPostViewModel>(
      create: (_) => AddPostViewModel(
        labelDatabase: labelDatabase,
        profileDatabase: profileDatabase,
        postDatabase: postDatabase,
        firebaseStorageService: firebaseStorageService,
        currentUser: currentUser,
      ),
      child: Consumer<AddPostViewModel>(
        builder: (_, viewModel, __) => AddPostContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class AddPostContent extends StatelessWidget {
  const AddPostContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final AddPostViewModel viewModel;

  Map<AddPostStep, AddPostStepData> stepData() =>
      {
        AddPostStep.category: AddPostStepData(
          content: AddPostCategoryContent(
            viewModel: viewModel,
          ),
          title: S.current.addPostTitleCategory,
          description: "Category description",
        ),
        AddPostStep.info: AddPostStepData(
          content: AddPostInfoContent(
            viewModel: viewModel,
          ),
          title: S.current.addPostTitleInfo,
          description: "Info description",
        ),
        AddPostStep.optionalInfo: AddPostStepData(
          content: AddPostOptionalInfoContent(
            viewModel: viewModel,
          ),
          title: S.current.addPostTitleOptionalInfo,
          description: "Optional Info description",
        ),
        AddPostStep.linkedIssue: AddPostStepData(
          content: AddPostLinkedIssueContent(
            viewModel: viewModel,
          ),
          title: S.current.addPostTitleLinkedIssue,
          description: "Linked Issue description",
        ),
        AddPostStep.labels: AddPostStepData(
          content: AddPostLabelsContent(
            viewModel: viewModel,
          ),
          title: S.current.addPostTitleLabels,
          description: "Labels description",
        ),
        AddPostStep.shareOptions: AddPostStepData(
          content: AddPostShareOptionsContent(
            viewModel: viewModel,
          ),
          title: S.current.addPostTitleShareOptions,
          description: "Share options description",
          appBarButton: S.current.addPostShareOptionsAppBarButton,
          onPressedAppBarButton: viewModel.resetShareOptions,
        ),
        AddPostStep.resume: AddPostStepData(
          content: AddPostResumeContent(
            viewModel: viewModel,
          ),
          title: S.current.addPostTitleResume,
        ),
      };

  AddPostStepData currentStepData() {
    return stepData()[viewModel.currentStep];
  }

  String title() {
    AddPostStepData currentStepData = this.currentStepData();
    return currentStepData != null
        ? currentStepData.title
        : S.current.addPostTitleAddPost;
  }

  String description() {
    AddPostStepData currentStepData = this.currentStepData();
    return currentStepData != null ? currentStepData.description : null;
  }

  Widget content() {
    AddPostStepData currentStepData = this.currentStepData();
    return currentStepData != null ? currentStepData.content : null;
  }

  @override
  Widget build(BuildContext context) {
    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: WillPopScope(
        onWillPop: () => viewModel.showDeleteAlertDialog(context),
        child: viewModel.isLoadingSave || viewModel.success || viewModel.fail
            ? AddPostLoadingContent(
                viewModel: viewModel,
              )
            : Scaffold(
                appBar: buildAppBar(context),
                bottomNavigationBar: buildBottomAppBar(context),
                body: buildBody(context),
              ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: title(),
      titleSpacing: 24,
      automaticallyImplyLeading: false,
      actions: [
        if (currentStepData().appBarButton != null) ...[
          CustomAppBarButton(
            text: currentStepData().appBarButton,
            onPressed: currentStepData().onPressedAppBarButton,
          ),
        ],
        CustomAppBarButton(
          icon: Icons.clear,
          onPressed: () => viewModel.reset(context),
        ),
      ],
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    return AddPostBottomAppBar(
      currentStep: viewModel.currentStepIndex(),
      totalStep: viewModel.totalStep(),
      onNext: viewModel.currentStep != AddPostStep.resume
          ? () => viewModel.nextStep(context)
          : () => viewModel.save(context),
      onPrevious: viewModel.currentStep != AddPostStep.category
          ? viewModel.previousStep
          : null,
      saveButton: viewModel.currentStep == AddPostStep.resume,
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView(
      padding: ConstantWidgets.addPostPadding,
      children: <Widget>[
        if (description() != null) ...[
          Text(
            description(),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: 24,
          ),
        ],
        content(),
      ],
    );
  }
}
