import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/post_widgets/help_list_item.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/screens/post/help/help_screen.dart';
import 'package:ideashare/screens/post/help/help_view_model.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';

class PostHelpsContent extends StatelessWidget {
  const PostHelpsContent({
    Key key,
    this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.isLoadingPostHelps) {
      return buildLoading(context);
    }
    return RefreshIndicator(
      onRefresh: viewModel.fetchPostHelps,
      child: buildList(context),
    );
  }

  Widget buildList(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          separatorBuilder: (context, index) => SizedBox(
            height: 8,
          ),
          itemCount: viewModel.helps.length,
          itemBuilder: (context, index) => HelpListItem(
            key: Key(viewModel.helps[index].id),
            help: viewModel.helps[index],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              onPressed: () async {
                HelpAction result = await HelpScreen.show(
                  context,
                  postId: viewModel.getPostId,
                );
                if (result != null) {
                  viewModel.updateWith(isLoadingPostHelps: true);
                  viewModel.fetchPostHelps();
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
