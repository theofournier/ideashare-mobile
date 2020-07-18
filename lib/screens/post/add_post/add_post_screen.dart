import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_app_bar_button.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/add_post/add_post_bottom_app_bar.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_category_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_info_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_labels_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_linked_issue_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_resume_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_share_options_content.dart';
import 'package:ideashare/screens/post/add_post/contents/add_post_start_content.dart';
import 'package:ideashare/screens/post/add_post/contents/optional_info/add_post_optional_info_content.dart';
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
    return ChangeNotifierProvider<AddPostViewModel>(
      create: (_) => AddPostViewModel(),
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

  Map<AddPostStep, AddPostStepData> stepData(
    BuildContext context,
  ) =>
      {
        AddPostStep.category: AddPostStepData(
          content: AddPostCategoryContent(
            viewModel: viewModel,
          ),
          title: S.of(context).addPostTitleCategory,
          description: "Category description",
        ),
        AddPostStep.info: AddPostStepData(
          content: AddPostInfoContent(
            viewModel: viewModel,
          ),
          title: S.of(context).addPostTitleInfo,
          description: "Info description",
        ),
        AddPostStep.optionalInfo: AddPostStepData(
          content: AddPostOptionalInfoContent(
            viewModel: viewModel,
          ),
          title: S.of(context).addPostTitleOptionalInfo,
          description: "Optional Info description",
        ),
        AddPostStep.linkedIssue: AddPostStepData(
          content: AddPostLinkedIssueContent(
            viewModel: viewModel,
          ),
          title: S.of(context).addPostTitleLinkedIssue,
        ),
        AddPostStep.labels: AddPostStepData(
          content: AddPostLabelsContent(
            viewModel: viewModel,
          ),
          title: S.of(context).addPostTitleLabels,
        ),
        AddPostStep.shareOptions: AddPostStepData(
          content: AddPostShareOptionsContent(
            viewModel: viewModel,
          ),
          title: S.of(context).addPostTitleShareOptions,
          description: "Share options description",
        ),
        AddPostStep.resume: AddPostStepData(
          content: AddPostResumeContent(
            viewModel: viewModel,
          ),
          title: S.of(context).addPostTitleResume,
        ),
      };

  AddPostStepData currentStepData(BuildContext context) {
    if (viewModel.currentStep != null) {
      return stepData(context)[viewModel.currentStep];
    }
    return null;
  }

  String title(BuildContext context) {
    AddPostStepData currentStepData = this.currentStepData(context);
    return currentStepData != null
        ? currentStepData.title
        : S.of(context).addPostTitleAddPost;
  }

  String description(BuildContext context) {
    AddPostStepData currentStepData = this.currentStepData(context);
    return currentStepData != null ? currentStepData.description : null;
  }

  Widget content(BuildContext context) {
    AddPostStepData currentStepData = this.currentStepData(context);
    return currentStepData != null ? currentStepData.content : null;
  }

  @override
  Widget build(BuildContext context) {
    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: Scaffold(
        appBar: buildAppBar(context),
        bottomNavigationBar: buildBottomAppBar(context),
        body: buildBody(context),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: title(context),
      titleSpacing: 24,
      actions: viewModel.currentStep == null
          ? []
          : [
              CustomAppBarButton(
                icon: Icons.delete,
                onPressed: viewModel.reset,
              ),
            ],
    );
  }

  Widget buildBottomAppBar(BuildContext context) {
    if (viewModel.currentStep != null) {
      return AddPostBottomAppBar(
        currentStep: viewModel.currentStep.index,
        totalStep: AddPostStep.values.length,
        onNext: viewModel.currentStep != AddPostStep.resume ? viewModel.nextStep : viewModel.save,
        onPrevious: viewModel.currentStep != AddPostStep.category ? viewModel.previousStep : null,
        saveButton: viewModel.currentStep == AddPostStep.resume,
      );
    }
    return null;
  }

  Widget buildBody(BuildContext context) {
    if (viewModel.currentStep != null) {
      return ListView(
        padding: ConstantWidgets.addPostPadding,
        children: <Widget>[
          if (description(context) != null) ...[
            Text(
              description(context),
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
          SizedBox(
            height: 24,
          ),
          content(context),
        ],
      );
    }
    return Padding(
      padding: ConstantWidgets.addPostPadding,
      child: AddPostStartContent(
        viewModel: viewModel,
      ),
    );
  }
}
