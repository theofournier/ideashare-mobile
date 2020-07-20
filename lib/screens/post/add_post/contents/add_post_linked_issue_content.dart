import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';

class AddPostLinkedIssueContent extends StatelessWidget {
  AddPostLinkedIssueContent({this.viewModel});

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (viewModel.post.category == null ||
        viewModel.post.category == PostType.issue) {
      return buildUnavailable(context);
    }
    return Column(
      children: <Widget>[
        CustomRaisedButton(
          icon: Icons.search,
          text: S.of(context).addPostLinkedIssueSearch,
          onPressed: () {}, //TODO: open post list and update linkedIssue in viewModel
        ),
        SizedBox(
          height: 40,
        ),
        buildLinkedIssue(context),
      ],
    );
  }

  Widget buildLinkedIssue(BuildContext context) {
    if (viewModel.linkedIssue != null) {
      //TODO: display post item
      return Text("OK");
    }
    return Text(
      S.of(context).addPostLinkedIssueNull,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget buildUnavailable(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(ImageName.addPostLinkedIssue),
          SizedBox(
            height: 40,
          ),
          Text(
            S.of(context).addPostLinkedIssueUnavailable,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
