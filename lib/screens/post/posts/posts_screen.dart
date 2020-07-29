import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_sliver_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_sliver_list.dart';
import 'package:ideashare/common_widgets/post_widgets/post_list_item.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/screens/post/posts/posts_view_model.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.postsScreen,
    );
  }

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final PostDatabase postDatabase =
        Provider.of<PostDatabase>(context, listen: false);

    return ChangeNotifierProvider<PostsViewModel>(
      create: (_) => PostsViewModel(
        postDatabase: postDatabase,
      ),
      child: Consumer<PostsViewModel>(
        builder: (_, viewModel, __) => PostsContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class PostsContent extends StatelessWidget {
  const PostsContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final PostsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: CustomScrollView(
        slivers: <Widget>[
          CustomSliverAppBar(
            title: "Post",
            elevation: 2,
          ),
          buildBody(context),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    if (viewModel.isLoading) {
      return SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return buildList(context);
  }

  Widget buildList(BuildContext context) {
    return CustomSliverList(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: viewModel.posts.length,
      itemBuilder: (context, index) => PostListItem(
        key: Key(viewModel.posts[index].id),
        post: viewModel.posts[index],
      ),
      separated: true,
    );
  }
}
