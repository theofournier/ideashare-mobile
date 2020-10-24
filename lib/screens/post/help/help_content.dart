import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar_button.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_text_form_field.dart';
import 'package:ideashare/common_widgets/post_widgets/images_section.dart';
import 'package:ideashare/common_widgets/post_widgets/language_section.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/help/help_view_model.dart';
import 'package:ideashare/utils/extensions/list.dart';
import 'package:ideashare/utils/validators.dart';

class HelpContent extends StatefulWidget {
  HelpContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final HelpViewModel viewModel;

  @override
  _HelpContentState createState() => _HelpContentState();
}

class _HelpContentState extends State<HelpContent> {
  HelpViewModel get viewModel => this.widget.viewModel;

  final FocusScopeNode _node = FocusScopeNode();
  bool _autoValidate = false;

  void _initLanguage(BuildContext context) {
    if (viewModel.help.info.language == null) {
      viewModel.help.info.language =
          Localizations.localeOf(context).languageCode;
    }
  }

  void _submit(BuildContext context) {
    setState(() {
      this._autoValidate = true;
    });
    FocusScope.of(context).unfocus();
    viewModel.saveHelp(context);
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initLanguage(context);

    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: WillPopScope(
        onWillPop: () => viewModel.showDeleteAlertDialog(context),
        child: IgnorePointer(
          ignoring: viewModel.isLoadingSave,
          child: Scaffold(
            appBar: buildAppBar(context),
            body: buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return CustomAppBar(
      actions: [
        if (viewModel.initialHelp != null) ...[
          CustomAppBarButton(
            icon: Icons.delete,
            onPressed: () {
              FocusScope.of(context).unfocus();
              viewModel.deleteHelp(context);
            },
          ),
        ],
        CustomAppBarButton(
          icon: Icons.check,
          onPressed: () => _submit(context),
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    List<Widget> sections = [
      buildInfo(context),
      buildLanguage(context),
      buildImages(context),
    ];

    return Column(
      children: [
        if (viewModel.isLoadingSave) ...[
          SizedBox(
            height: 1.5,
            child: LinearProgressIndicator(
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            separatorBuilder: (_, __) => SizedBox(
              height: 32,
            ),
            itemCount: sections.length,
            itemBuilder: (_, index) => sections[index],
          ),
        ),
      ],
    );
  }

  Widget buildInfo(BuildContext context) {
    return Form(
      key: viewModel.formKey,
      child: FocusScope(
        node: _node,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: S.of(context).helpTitlePlaceholder,
              textInputAction: TextInputAction.next,
              textSize: 20,
              autovalidate: _autoValidate,
              initialValue: viewModel.help.info.title,
              enabled: !viewModel.isLoadingSave,
              border: InputBorder.none,
              onSaved: (value) => viewModel.updateWith(
                  help: viewModel.help..info.title = value),
              validator: (value) => Validators.requiredValidator(value),
              onFieldSubmitted: (_) => _node.nextFocus(),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextFormField(
              hintText: S.of(context).helpDescription,
              keyboardType: TextInputType.multiline,
              minLines: 8,
              filled: true,
              border: InputBorder.none,
              autovalidate: _autoValidate,
              initialValue: viewModel.help.info.description,
              enabled: !viewModel.isLoadingSave,
              onSaved: (value) => viewModel.updateWith(
                  help: viewModel.help..info.description = value),
              onFieldSubmitted: (_) => _node.nextFocus(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLanguage(BuildContext context) {
    return LanguageSection(
      descriptionTitle: S.of(context).helpLanguageDescription,
      currentLanguageKey: viewModel.help.info.language,
      languages: viewModel.languages,
      popularLanguageCodes: viewModel.popularLanguageCodes,
      onSave: (languageKey) => viewModel.updateWith(
        help: viewModel.help..info.language = languageKey,
      ),
    );
  }

  Widget buildImages(BuildContext context) {
    return ImagesSection(
      id: "HELP",
      images: viewModel.images,
      onAddImage: (image) =>
          viewModel.updateWith(images: viewModel.images..add(image)),
      onDeleteImage: (index) =>
          viewModel.updateWith(images: viewModel.images..removeAt(index)),
      onDoubleTapImage: (index) => viewModel.updateWith(
          images: viewModel.images..rearrangeByIndex(index)),
      isSectionTitle: true,
      sectionDescription: S.of(context).helpImageDescription,
      displayFirst: true,
      displayImage: true,
    );
  }
}
