import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_text_form_field.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';

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

  @override
  void initState() {
    _titleController.text = viewModel.post.info.title;
    _resumeController.text = viewModel.post.info.resume;
    _descriptionController.text = viewModel.post.info.description;

    _titleController.addListener(() {
      viewModel.updateWith(postInfo: viewModel.post.info..title = _titleController.text);
    });
    _resumeController.addListener(() {
      viewModel.updateWith(postInfo: viewModel.post.info..resume = _resumeController.text);
    });
    _descriptionController.addListener(() {
      viewModel.updateWith(postInfo: viewModel.post.info..description = _descriptionController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
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
            height: 16,
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
