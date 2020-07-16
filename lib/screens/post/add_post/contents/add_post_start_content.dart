import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/screens/post/add_post/add_post_step_data.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';

class AddPostStartContent extends StatelessWidget {
  AddPostStartContent({
    @required this.viewModel,
  });

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildImage(),
        SizedBox(
          height: 40,
        ),
        buildDescription(context),
        SizedBox(
          height: 70,
        ),
        buildButton(context),
      ],
    );
  }

  Widget buildImage() {
    return Center(
      child: Image.asset(
        ImageName.addPostStart,
      ),
    );
  }

  Widget buildDescription(BuildContext context) {
    return Text(
      "Description",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget buildButton(BuildContext context) {
    return Center(
      child: CustomRaisedButton(
        text: S.of(context).addPostStartButton,
        onPressed: () => viewModel.goToStep(AddPostStep.category),
      ),
    );
  }
}
