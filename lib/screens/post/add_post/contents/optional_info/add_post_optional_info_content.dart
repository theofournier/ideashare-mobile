import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_text_form_field.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/screens/post/add_post/common/add_post_section_title.dart';
import 'package:ideashare/screens/post/add_post/contents/optional_info/links_section.dart';

class AddPostOptionalInfoContent extends StatefulWidget {
  AddPostOptionalInfoContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  _AddPostOptionalInfoContentState createState() =>
      _AddPostOptionalInfoContentState();
}

class _AddPostOptionalInfoContentState
    extends State<AddPostOptionalInfoContent> {
  AddPostViewModel get viewModel => widget.viewModel;

  final double _spaceSection = 40;
  final double _spaceTitle = 8;

  final TextEditingController _noteController = TextEditingController();

  void _save() {
    viewModel.postNote.text = _noteController.text;
  }

  @override
  void initState() {
    _noteController.text = viewModel.postNote.text;
    super.initState();
  }

  @override
  void dispose() {
    _save();

    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> sections = [
      _buildLanguage(),
      _buildImages(),
      _buildLinks(),
      _buildNote(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.asMap().entries.map((section) {
        return Container(
          margin: section.key < sections.length - 1
              ? EdgeInsets.only(bottom: _spaceSection)
              : null,
          child: section.value,
        );
      }).toList(),
    );
  }

  Widget _buildLanguage() {
    return Row(
      children: <Widget>[
        AddPostSectionTitle(
          title: "Language",
          description: "Description",
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(child: Text("TEST")),
      ],
    );
  }

  Widget _buildImages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AddPostSectionTitle(
          title: "Images",
          description: "Description",
          onAdd: () => print("ADD IMAGE"),
        ),
        Text("IMAGES"),
      ],
    );
  }

  Widget _buildLinks() {
    return LinksSection(
        links: viewModel.postInfo.urlLinks,
        spaceTitle: _spaceTitle,
        onAddLink: (String link) => viewModel.updateWith(
            postInfo: viewModel.postInfo..urlLinks.add(link)),
        onEditLink: (int index, String link) {
          viewModel.updateWith(
              postInfo: viewModel.postInfo..urlLinks[index] = link);
        },
        onDeleteLink: (int index) {
          viewModel.updateWith(
              postInfo: viewModel.postInfo..urlLinks.removeAt(index));
        });
  }

  Widget _buildNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AddPostSectionTitle(
          title: S.of(context).addPostOptionalInfoNoteTitle,
          description: S.of(context).addPostOptionalInfoNoteDescription,
        ),
        SizedBox(
          height: _spaceTitle,
        ),
        CustomTextFormField(
          controller: _noteController,
          keyboardType: TextInputType.multiline,
          minLines: 5,
          filled: true,
        ),
      ],
    );
  }
}
