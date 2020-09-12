import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ideashare/common_widgets/post_widgets/note_list_item.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/screens/post/note/note_screen.dart';
import 'package:ideashare/screens/post/note/note_view_model.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';
import 'package:ideashare/services/models/post/post_note/post_note.dart';

class PostNotesContent extends StatelessWidget {
  const PostNotesContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoadingPostNotes) {
      return buildLoading(context);
    }
    return RefreshIndicator(
      onRefresh: viewModel.fetchPostNotes,
      child: buildList(context),
    );
  }

  Widget buildList(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.greyBackground,
          child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: 40,
            ),
            itemCount: viewModel.notes.length,
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 12,
            staggeredTileBuilder: (_) => StaggeredTile.fit(1),
            itemBuilder: (_, index) => NoteListItem(
              key: Key(viewModel.notes[index].id),
              note: viewModel.notes[index],
              isOwner: viewModel.currentUser.id ==
                      viewModel.post?.ownerInfo?.userId ??
                  false,
              onDelete: () =>
                  viewModel.deleteNote(context, viewModel.notes[index].id),
              onTap: () async {
                NoteAction result = await NoteScreen.show(
                  context,
                  postId: viewModel.getPostId,
                  initialNote: viewModel.notes[index],
                );
                if (result != null) {
                  if(result == NoteAction.delete) {
                    viewModel.flushbarUndoDeleteNote(
                      context: context,
                      index: index,
                      note: viewModel.notes[index],
                    );
                  }
                  viewModel.updateWith(isLoadingPostNotes: true);
                  viewModel.fetchPostNotes();
                }
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () async {
                NoteAction result = await NoteScreen.show(
                  context,
                  postId: viewModel.getPostId,
                );
                if (result != null) {
                  viewModel.updateWith(isLoadingPostNotes: true);
                  viewModel.fetchPostNotes();
                }
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
