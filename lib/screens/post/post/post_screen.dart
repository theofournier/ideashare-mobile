import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/common_widgets.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar_button.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_sliver_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_sliver_tab_bar_screen.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_tab_bar.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/post/contents/post_comments_content.dart';
import 'package:ideashare/screens/post/post/contents/post_helps_content.dart';
import 'package:ideashare/screens/post/post/contents/post_info_content.dart';
import 'package:ideashare/screens/post/post/contents/post_linked_content.dart';
import 'package:ideashare/screens/post/post/contents/post_news_content.dart';
import 'package:ideashare/screens/post/post/contents/post_notes_content.dart';
import 'package:ideashare/screens/post/post/post_header.dart';
import 'package:ideashare/screens/post/post/post_view_model.dart';
import 'package:ideashare/services/database/post_database.dart';
import 'package:ideashare/services/models/post/post/post.dart';
import 'package:ideashare/services/models/user/user.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

class PostScreenArguments {
  PostScreenArguments({
    this.postId,
    this.initialPost,
  });

  final String postId;
  final Post initialPost;
}

class PostScreen extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    String postId,
    Post initialPost,
  }) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.postScreen,
      arguments: PostScreenArguments(
        postId: postId,
        initialPost: initialPost,
      ),
    );
  }

  PostScreen({
    this.postId,
    this.initialPost,
  });

  final String postId;
  final Post initialPost;

  @override
  Widget build(BuildContext context) {
    final PostDatabase postDatabase =
        Provider.of<PostDatabase>(context, listen: false);
    final User currentUser = Provider.of<User>(context);

    return ChangeNotifierProvider<PostViewModel>(
      create: (_) => PostViewModel(
        postDatabase: postDatabase,
        currentUser: currentUser,
        postId: postId,
        initialPost: initialPost,
      ),
      child: Consumer<PostViewModel>(
        builder: (_, viewModel, __) => PostContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class PostContent extends StatelessWidget {
  PostContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final PostViewModel viewModel;

  final List<TabBarItemData> tabBarItems = [
    TabBarItemData(
      text: S.current.postTabBarInfo,
    ),
    TabBarItemData(
      text: S.current.postTabBarComments,
    ),
    TabBarItemData(
      text: S.current.postTabBarHelps,
    ),
    TabBarItemData(
      text: S.current.postTabBarNews,
    ),
    TabBarItemData(
      text: S.current.postTabBarLinked,
    ),
    TabBarItemData(
      text: S.current.postTabBarNotes,
    ),
  ];

  List<Widget> tabViews() => [
        PostInfoContent(
          viewModel: viewModel,
        ),
        PostCommentsContent(
          viewModel: viewModel,
        ),
        PostHelpsContent(
          viewModel: viewModel,
        ),
        PostNewsContent(
          viewModel: viewModel,
        ),
        PostLinkedContent(
          viewModel: viewModel,
        ),
        PostNotesContent(
          viewModel: viewModel,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: CustomSliverTabBarScreen(
        appBar: CustomSliverAppBar(
          pinned: true,
          actions: <Widget>[
            if (viewModel.post.premium) ...[
              PremiumIcon(),
            ],
            CustomAppBarButton(
              icon: OMIcons.edit,
              text: S.of(context).postEditPost,
              onPressed: () => print("EDIT POST"),
            ),
          ],
        ),
        headerChild: PostHeader(
          viewModel: viewModel,
        ),
        tabIsScrollable: true,
        tabItems: tabBarItems,
        tabBarViewItems: tabViews(),
      ),
    );
  }
}
