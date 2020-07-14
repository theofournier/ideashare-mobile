import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/common_widgets/custom_text_form_field.dart';
import 'package:ideashare/common_widgets/platform_alert_dialog.dart';
import 'package:ideashare/common_widgets/platform_exception_alert_dialog.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/auth/forgot_password/forgot_password_view_model.dart';
import 'package:ideashare/screens/auth/widgets/social_footer.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:ideashare/utils/validators.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.forgotPasswordScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context, listen: false);

    return ChangeNotifierProvider<ForgotPasswordViewModel>(
      create: (_) => ForgotPasswordViewModel(auth: auth),
      child: Consumer<ForgotPasswordViewModel>(
        builder: (_, viewModel, __) => ForgotPasswordContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class ForgotPasswordContent extends StatefulWidget {
  const ForgotPasswordContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final ForgotPasswordViewModel viewModel;

  @override
  _ForgotPasswordContentState createState() => _ForgotPasswordContentState();
}

class _ForgotPasswordContentState extends State<ForgotPasswordContent> {
  final FocusScopeNode _node = FocusScopeNode();
  bool autovalidate = false;

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  void _showForgotPasswordError(PlatformException exception) {
    PlatformExceptionAlertDialog(
      context: context,
      title: S.of(context).forgotPasswordScreenFailed,
      exception: exception,
    ).show(context);
  }
  
  void _showForgotPasswordSuccess() async {
    await PlatformAlertDialog(
      defaultActionText: S.of(context).ok,
      title: S.of(context).forgotPasswordScreenSuccessTitle,
      content: S.of(context).forgotPasswordScreenSuccessContent,
    ).show(context);
  }

  Future<void> _submit() async {
    setState(() {
      this.autovalidate = true;
    });
    try {
      final bool success = await widget.viewModel.submit();
      if (success) {
        await _showForgotPasswordSuccess();
        Navigator.of(context).pop();
      }
    } on PlatformException catch (e) {
      _showForgotPasswordError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstantWidgets.unfocusGestureDetector(
      context: context,
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).forgotPasswordScreenAppBarTitle,
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
        if (widget.viewModel.isLoading) ...[
          _buildSpinner(),
        ],
        if (!widget.viewModel.isLoading) ...[
          _buildText(),
          SizedBox(
            height: 32,
          ),
          _buildForm(),
        ],
      ],
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.asset(
        ImageName.forgotPassword,
      ),
    );
  }

  Widget _buildText() {
    return Text(
      S.of(context).forgotPasswordScreenText,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget _buildForm() {
    return Form(
      key: widget.viewModel.formKey,
      child: FocusScope(
        node: _node,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextFormField(
              labelText: S.of(context).forgotPasswordScreenEmailAddress,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.send,
              autovalidate: autovalidate,
              initialValue: widget.viewModel.email,
              enabled: !widget.viewModel.isLoading,
              onSaved: widget.viewModel.onSaveEmail,
              validator: (value) => Validators.emailValidator(context, value),
              onFieldSubmitted: (_) => _submit(),
            ),
            SizedBox(
              height: 24,
            ),
            CustomRaisedButton(
              onPressed: widget.viewModel.isLoading ? null : _submit,
              loading: widget.viewModel.isLoading,
              text: S.of(context).forgotPasswordScreenButton,
            ),
          ],
        ),
      ),
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
