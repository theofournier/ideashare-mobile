import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_sliver_app_bar.dart';
import 'package:ideashare/common_widgets/post_widgets/post_list_item.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
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

class PostsContent extends StatefulWidget {
  PostsContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final PostsViewModel viewModel;

  @override
  _PostsContentState createState() => _PostsContentState();
}

class _PostsContentState extends State<PostsContent> {
  PostsViewModel get viewModel => widget.viewModel;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      this._refreshIndicatorKey.currentState.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!viewModel.isLoading && viewModel.posts.isEmpty) {
      return buildPostsNotFound(context);
    }
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          CustomSliverAppBar(
            elevation: 2,
            snap: true,
          ),
        ],
        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: viewModel.fetchPosts,
          child: buildList(context),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      separatorBuilder: (context, index) => SizedBox(
        height: 8,
      ),
      itemCount: viewModel.posts.length,
      itemBuilder: (context, index) => PostListItem(
        key: Key(viewModel.posts[index].id),
        post: viewModel.posts[index],
      ),
    );
  }

  Widget buildPostsNotFound(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).postsAppBarTitle,
      ),
      body: Padding(
        padding: ConstantWidgets.defaultPadding,
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset(ImageName.postsNotFound),
              SizedBox(
                height: 40,
              ),
              Text(
                S.of(context).postsNotFound,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
