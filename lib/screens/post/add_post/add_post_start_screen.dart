import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_raised_button.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/post/add_post/add_post_screen.dart';

class AddPostStartScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.addPostStartScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: ConstantWidgets.addPostPadding,
            child: Column(
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
            ),
          ),
        ),
      ),
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
        onPressed: () => AddPostScreen.show(context),
      ),
    );
  }
}
