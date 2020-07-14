import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/custom_app_bar.dart';
import 'package:ideashare/common_widgets/custom_app_bar_button.dart';
import 'package:ideashare/common_widgets/platform_alert_dialog.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/router.dart';
import 'package:ideashare/screens/select_picture/default_picture/default_picture_item.dart';
import 'package:ideashare/screens/select_picture/default_picture/default_picture_view_model.dart';
import 'package:ideashare/services/database/profile_database.dart';
import 'package:ideashare/services/models/default_picture.dart';
import 'package:provider/provider.dart';

class DefaultPictureScreen extends StatelessWidget {
  static Future<DefaultPicture> show(BuildContext context, {DefaultPicture initialDefaultPicture}) async {
    final navigator = Navigator.of(context);
    return await navigator.pushNamed(
      Routes.defaultPictureScreen,
      arguments: initialDefaultPicture,
    );
  }
  DefaultPictureScreen({this.initialDefaultPicture});

  final DefaultPicture initialDefaultPicture;

  @override
  Widget build(BuildContext context) {
    final ProfileDatabase profileDatabase =
        Provider.of<ProfileDatabase>(context, listen: false);

    return ChangeNotifierProvider<DefaultPictureViewModel>(
      create: (_) => DefaultPictureViewModel(
        profileDatabase: profileDatabase,
        initialDefaultPicture: initialDefaultPicture,
      ),
      child: Consumer<DefaultPictureViewModel>(
        builder: (_, viewModel, __) => DefaultPictureContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class DefaultPictureContent extends StatefulWidget {
  const DefaultPictureContent({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  final DefaultPictureViewModel viewModel;

  @override
  _DefaultPictureContentState createState() => _DefaultPictureContentState();
}

class _DefaultPictureContentState extends State<DefaultPictureContent> {
  DefaultPictureViewModel get viewModel => this.widget.viewModel;

  void _save() {
    if(viewModel.selectedDefaultPicture != null) {
      Navigator.of(context).pop(viewModel.selectedDefaultPicture);
    } else {
      PlatformAlertDialog(
        title: S.of(context).defaultPictureScreenErrorTitle,
        defaultActionText: S.of(context).ok,
      ).show(context);
    }
  }

  void onTap(DefaultPicture defaultPicture) {
    viewModel.updateWith(selectedDefaultPicture: defaultPicture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).defaultPictureScreenAppBarTitle,
        actions: <Widget>[
          CustomAppBarButton(
            text: S.of(context).defaultPictureScreenSave,
            onPressed: _save,
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    if (viewModel.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.count(
      padding: ConstantWidgets.defaultPadding,
      crossAxisCount: 2,
      children:
          viewModel
          .defaultPictures
          .map((defaultPicture) => DefaultPictureItem(
                imageUrl: defaultPicture.imageUrl,
                isSelected:
                    viewModel.selectedDefaultPicture != null &&
                        viewModel.selectedDefaultPicture.id ==
                            defaultPicture.id,
                onTap: () => onTap(defaultPicture),
              ))
          .toList(),
    );
  }
}
