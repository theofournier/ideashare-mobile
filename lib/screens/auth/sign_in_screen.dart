import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/custom_app_bar.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/auth/widgets/social_footer.dart';

class SignInScreen extends StatefulWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.signInScreen,
    );
  }

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).signInScreenAppBarTitle,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView(
      padding: ConstantWidgets.defaultPadding,
      children: <Widget>[
        _buildImage(),
        SizedBox(
          height: 100,
        ),
        _buildForm(),
        SizedBox(
          height: 30,
        ),
        _buildFooter(),
      ],
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.asset(
        ImageName.signIn,
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Text("Form"),
          SizedBox(
            height: 50,
          ),
          Text("End"),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return SocialFooter();
  }
}
