import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_cached_network_image.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/common_widgets/custom_app_bar_button.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/select_picture/default_picture/default_picture_screen.dart';
import 'package:ideashare/screens/select_picture/select_picture_view_model.dart';
import 'package:ideashare/services/auth/auth_service.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/default_picture.dart';
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
    final ProfileDatabase profileDatabase =
        Provider.of<ProfileDatabase>(context, listen: false);

    return ChangeNotifierProvider<SelectPictureViewModel>(
      create: (_) => SelectPictureViewModel(
        auth: auth,
        profileDatabase: profileDatabase,
      ),
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
  SelectPictureViewModel get viewModel => this.widget.viewModel;

  Future<void> _save() async {
    try {
      final bool success = await viewModel.save();
    } catch (e) {
      viewModel.updateWith(isLoading: false);
    }
  }

  void _showDefaultPictureScreen() async {
    DefaultPicture defaultPicture = await DefaultPictureScreen.show(context,
        initialDefaultPicture: viewModel.defaultPicture);
    if (defaultPicture != null) {
      viewModel.updateWith(
        pictureUrl: defaultPicture.imageUrl,
        pictureFileName: defaultPicture.name,
        defaultPicture: defaultPicture,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).selectPictureScreenAppBarTitle,
        actions: <Widget>[
          CustomAppBarButton(
            text: S.of(context).selectPictureScreenSaveButton,
            onPressed: viewModel.isLoading ? null : _save,
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
        if (viewModel.isLoading) ...[
          _buildSpinner(),
        ],
        if (!viewModel.isLoading) ...[
          _buildButtons(),
        ],
      ],
    );
  }

  Widget _buildImage() {
    return Center(
      child: CustomCachedNetworkImage(
        imageUrl: viewModel.pictureUrl,
        imageBuilder: (context, imageProvider) => ClipOval(
          child: Image(
            height: 130,
            width: 130,
            fit: BoxFit.fill,
            image: imageProvider,
          ),
        ),
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
            onPressed: _showDefaultPictureScreen,
          ),
        ],
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

  Widget _button({VoidCallback onPressed, String text}) {
    return CustomRaisedButton(
      text: text,
      textColor: Theme.of(context).accentColor,
      borderColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      loading: viewModel.isLoading,
      onPressed: viewModel.isLoading ? null : onPressed,
    );
  }
}
