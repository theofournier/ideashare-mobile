import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideashare/common_widgets/alert_dialogs/platform_exception_alert_dialog.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_raised_button.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_text_form_field.dart';
import 'package:ideashare/common_widgets/util_widgets/constant_widgets.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/constants/error_keys.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:ideashare/screens/auth/sign_in/sign_in_view_model.dart';
import 'package:ideashare/screens/auth/widgets/social_footer.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/database/user_auth_database.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:ideashare/utils/validators.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.signInScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context, listen: false);
    final UserAuthDatabase userFirestoreDatabase = Provider.of<UserAuthDatabase>(context, listen: false);

    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(auth: auth, userFirestoreDatabase: userFirestoreDatabase),
      child: Consumer<SignInViewModel>(
        builder: (_, viewModel, __) => SignInContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class SignInContent extends StatefulWidget {
  const SignInContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final SignInViewModel viewModel;

  @override
  _SignInContentState createState() => _SignInContentState();
}

class _SignInContentState extends State<SignInContent> {
  SignInViewModel get viewModel => this.widget.viewModel;

  final FocusScopeNode _node = FocusScopeNode();
  bool _passwordIsVisible = false;
  bool autovalidate = false;

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordIsVisible = !_passwordIsVisible;
    });
  }

  void _showSignInError(PlatformException exception) {
    PlatformExceptionAlertDialog(
      context: context,
      title: S.of(context).signInScreenFailed,
      exception: exception,
    ).show(context);
  }

  Future<void> _submit() async {
    setState(() {
      this.autovalidate = true;
    });
    try {
      await viewModel.submit();
    } on PlatformException catch (e) {
      _showSignInError(e);
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await viewModel.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != ErrorKeys.errorAbortedByUser) {
        _showSignInError(e);
      }
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await viewModel.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != ErrorKeys.errorAbortedByUser) {
        _showSignInError(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).signInScreenAppBarTitle,
        ),
        body: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      padding: ConstantWidgets.defaultPadding,
      children: <Widget>[
        _buildImage(),
        SizedBox(
          height: 70,
        ),
        if (viewModel.isLoading) ...[
          _buildSpinner(),
        ],
        if (!viewModel.isLoading) ...[
          _buildForm(),
          SizedBox(
            height: 16,
          ),
          _buildForgotPassword(),
          SizedBox(
            height: 30,
          ),
          _buildFooter(),
        ],
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
    return Form(
      key: viewModel.formKey,
      child: FocusScope(
        node: _node,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextFormField(
              labelText: S.of(context).signInScreenEmailAddress,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autovalidate: autovalidate,
              initialValue: viewModel.email,
              enabled: !viewModel.isLoading,
              onSaved: viewModel.onSaveEmail,
              validator: (value) => Validators.emailValidator(context, value),
              onFieldSubmitted: (_) => _node.nextFocus(),
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              labelText: S.of(context).signInScreenPassword,
              passwordIsVisible: _passwordIsVisible,
              togglePasswordVisibility: _togglePasswordVisibility,
              keyboardType:
                  _passwordIsVisible ? TextInputType.visiblePassword : null,
              textInputAction: TextInputAction.done,
              autovalidate: autovalidate,
              enabled: !viewModel.isLoading,
              initialValue: viewModel.password,
              onSaved: viewModel.onSavePassword,
              validator: (value) =>
                  Validators.passwordValidator(context, value),
              onFieldSubmitted: (_) => _submit(),
            ),
            SizedBox(
              height: 24,
            ),
            CustomRaisedButton(
              onPressed: viewModel.isLoading ? null : _submit,
              loading: viewModel.isLoading,
              text: S.of(context).signInScreenButton,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: viewModel.isLoading
            ? null
            : () => ForgotPasswordScreen.show(context),
        child: Text(
          S.of(context).signInScreenForgotPassword,
          style: Theme.of(context).textTheme.bodyText2.toBold(),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return SocialFooter(
      enabled: !viewModel.isLoading,
      signInWithGoogle: _signInWithGoogle,
      signInWithFacebook: _signInWithFacebook,
    );
  }

  Widget _buildSpinner() {
    return Center(
      child: SizedBox(
        height: 40,
        width: 40,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
