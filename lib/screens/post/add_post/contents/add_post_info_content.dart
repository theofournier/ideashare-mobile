import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_text_form_field.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/post/post_infos/post_info.dart';

class AddPostInfoContent extends StatefulWidget {
  AddPostInfoContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  _AddPostInfoContentState createState() => _AddPostInfoContentState();
}

class _AddPostInfoContentState extends State<AddPostInfoContent> {
  AddPostViewModel get viewModel => widget.viewModel;

  final FocusScopeNode _node = FocusScopeNode();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _resumeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _save() {
    Post post = viewModel.post;
    PostInfo postInfo = viewModel.postInfo;

    post.title = _titleController.text;
    post.resume = _resumeController.text;
    postInfo.description = _descriptionController.text;
  }

  @override
  void initState() {
    _titleController.text = viewModel.post.title;
    _resumeController.text = viewModel.post.resume;
    _descriptionController.text = viewModel.postInfo.description;

    super.initState();
  }

  @override
  void dispose() {
    _save();

    _node.dispose();
    _titleController.dispose();
    _resumeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: _node,
      child: Column(
        children: <Widget>[
          CustomTextFormField(
            controller: _titleController,
            hintText: S.of(context).addPostInfoInputTitle,
            textInputAction: TextInputAction.next,
            textSize: 24,
            autoFocus: _titleController.text == "",
            border: InputBorder.none,
            onFieldSubmitted: (_) => _node.nextFocus(),
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            controller: _resumeController,
            labelText: S.of(context).addPostInfoInputResume,
            keyboardType: TextInputType.multiline,
            minLines: 5,
            filled: true,
            border: InputBorder.none,
          ),
          SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            controller: _descriptionController,
            labelText: S.of(context).addPostInfoInputDescription,
            keyboardType: TextInputType.multiline,
            minLines: 10,
            filled: true,
            border: InputBorder.none,
          ),
        ],
      ),
    );
  }
}
