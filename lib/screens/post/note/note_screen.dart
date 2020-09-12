import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar_button.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_text_form_field.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/note/note_view_model.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:provider/provider.dart';

class NoteScreenArguments {
  NoteScreenArguments({
    this.noteId,
    this.postId,
    this.initialNote,
  });

  final String noteId;
  final String postId;
  final PostNote initialNote;
}

class NoteScreen extends StatelessWidget {
  static Future<NoteAction> show(
    BuildContext context, {
    String noteId,
    String postId,
    PostNote initialNote,
  }) async {
    final navigator = Navigator.of(context);
    return await navigator.pushNamed(
      Routes.noteScreen,
      arguments: NoteScreenArguments(
        postId: postId,
        noteId: noteId,
        initialNote: initialNote,
      ),
    );
  }

  NoteScreen({
    this.noteId,
    this.postId,
    this.initialNote,
  });

  final String noteId;
  final String postId;
  final PostNote initialNote;

  @override
  Widget build(BuildContext context) {
    final PostDatabase postDatabase =
        Provider.of<PostDatabase>(context, listen: false);
    final User currentUser = Provider.of<User>(context);

    return ChangeNotifierProvider<NoteViewModel>(
      create: (_) => NoteViewModel(
        postDatabase: postDatabase,
        currentUser: currentUser,
        postId: postId,
        noteId: noteId,
        initialNote: initialNote,
      ),
      child: Consumer<NoteViewModel>(
        builder: (_, viewModel, __) => NoteContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class NoteContent extends StatefulWidget {
  NoteContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final NoteViewModel viewModel;

  @override
  _NoteContentState createState() => _NoteContentState();
}

class _NoteContentState extends State<NoteContent> {
  NoteViewModel get viewModel => widget.viewModel;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = viewModel.note?.text ?? "";

    _controller.addListener(() {
      viewModel.updateWith(
        note: viewModel.note..text = _controller.text,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(context),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return CustomAppBar(
      actions: [
        if (viewModel.getNoteId?.isNotEmpty ?? false) ...[
          CustomAppBarButton(
            icon: Icons.delete,
            onPressed: () {
              FocusScope.of(context).unfocus();
              viewModel.deleteNote(context);
            },
          ),
        ],
        CustomAppBarButton(
          icon: Icons.check,
          onPressed: viewModel.needSave
              ? () {
                  FocusScope.of(context).unfocus();
                  viewModel.saveNote(context);
                }
              : null,
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          if (viewModel.isLoading) ...[
            SizedBox(
              height: 1.5,
              child: LinearProgressIndicator(
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
          Expanded(
            child: CustomTextFormField(
              hintText: S.of(context).noteScreenPlaceholder,
              autoFocus: viewModel.note?.text?.isEmpty ?? true,
              keyboardType: TextInputType.multiline,
              border: InputBorder.none,
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
