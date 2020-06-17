import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_outline_button.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/common_widgets/custom_app_bar_button.dart';
import 'package:ideashare/constants/constants.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/auth/select_picture/select_picture_view_model.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SelectPictureScreen extends StatelessWidget {
  static Future<void> show(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      Routes.selectPictureScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context, listen: false);

    return ChangeNotifierProvider<SelectPictureViewModel>(
      create: (_) => SelectPictureViewModel(auth: auth),
      child: Consumer<SelectPictureViewModel>(
        builder: (_, viewModel, __) => SelectPictureContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class SelectPictureContent extends StatefulWidget {
  const SelectPictureContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final SelectPictureViewModel viewModel;

  @override
  _SelectPictureContentState createState() => _SelectPictureContentState();
}

class _SelectPictureContentState extends State<SelectPictureContent> {
  Future<void> _submit() async {
    try {
      final bool success = await widget.viewModel.submit();
      if (success) {
        //TODO: pop
      }
    } catch (e) {
      //TODO: Show error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).selectPictureScreenAppBarTitle,
        actions: <Widget>[
          CustomAppBarButton(
            text: S.of(context).selectPictureScreenSkip,
            onPressed: widget.viewModel.isLoading ? null : () {},
          ),
        ],
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
          height: 40,
        ),
        if (widget.viewModel.isLoading) ...[
          _buildSpinner(),
        ],
        if (!widget.viewModel.isLoading) ...[
          _buildButtons(),
          SizedBox(
            height: 100,
          ),
          _buildSaveButton(),
        ],
      ],
    );
  }

  Widget _buildImage() {
    return Center(
      child: CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage(ImageName.selectPicture),
        backgroundColor: Colors.blue,
        child: Text("TF"),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _button(
            text: S.of(context).selectPictureScreenImportButton,
            onPressed: () {},
          ),
          SizedBox(
            height: 16,
          ),
          _button(
            text: S.of(context).selectPictureScreenTakeButton,
            onPressed: () {},
          ),
          SizedBox(
            height: 16,
          ),
          _button(
            text: S.of(context).selectPictureScreenFromDefaultButton,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return CustomRaisedButton(
      onPressed: widget.viewModel.isLoading ? null : _submit,
      loading: widget.viewModel.isLoading,
      text: S.of(context).selectPictureScreenSaveButton,
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

  Widget _button({VoidCallback onPressed, String text}) {
    return CustomOutlineButton(
      text: text,
      textColor: Theme.of(context).accentColor,
      borderColor: Theme.of(context).accentColor,
      loading: widget.viewModel.isLoading,
      onPressed: widget.viewModel.isLoading ? null : onPressed,
    );
  }
}
