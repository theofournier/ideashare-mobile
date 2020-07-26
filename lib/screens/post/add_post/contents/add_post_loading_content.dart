import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/constant_widgets.dart';
import 'package:ideashare/common_widgets/custom_circular_progress.dart';
import 'package:ideashare/common_widgets/custom_outline_button.dart';
import 'package:ideashare/common_widgets/custom_raised_button.dart';
import 'package:ideashare/generated/l10n.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/screens/post/add_post/add_post_view_model.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class AddPostLoadingContent extends StatelessWidget {
  AddPostLoadingContent({
    @required this.viewModel,
  });

  final AddPostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
                ConstantWidgets.defaultPadding.add(EdgeInsets.only(top: 40)),
            child: buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    if (viewModel.isLoadingSave) {
      return buildLoading(context);
    } else if (viewModel.success) {
      return buildSuccess(context);
    } else if (viewModel.fail) {
      return buildFail(context);
    }
    return Container();
  }

  Widget buildLoading(BuildContext context) {
    String text = "";
    if (viewModel.isLoadingUploadImages) {
      text = S.of(context).addPostLoadingImages;
    } else if (viewModel.isLoadingSavePost ||
        viewModel.isLoadingSavePostNote ||
        viewModel.isLoadingSavePostStatus) {
      text = S.of(context).addPostLoadingPost;
    }
    return Column(
      children: <Widget>[
        Text(
          S.of(context).addPostLoadingTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5.toSemiBold(),
        ),
        SizedBox(
          height: 40,
        ),
        CustomCircularProgress(
          size: 100,
          icon: Icons.cloud_upload,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "$text...",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget buildSuccess(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.check_circle,
          color: AppColors.success,
          size: 100,
        ),
        Text(
          S.of(context).addPostSuccessTitle,
          style: Theme.of(context).textTheme.headline5.toSemiBold(),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          S.of(context).addPostSuccessMessage,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomOutlineButton(
                text: S.of(context).addPostSuccessAnother,
                textColor: Theme.of(context).accentColor,
                borderColor: Theme.of(context).accentColor,
                onPressed: () => viewModel.reset(
                  context,
                  showDialog: false,
                  close: false,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomRaisedButton(
                text: S.of(context).close,
                onPressed: () => viewModel.reset(
                  context,
                  showDialog: false,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildFail(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.error,
          color: Theme.of(context).errorColor,
          size: 100,
        ),
        Text(
          S.of(context).addPostFailTitle,
          style: Theme.of(context).textTheme.headline5.toSemiBold(),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          S.of(context).addPostFailMessage,
          style: Theme.of(context).textTheme.bodyText1,
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomOutlineButton(
                text: S.of(context).tryAgain,
                textColor: Theme.of(context).errorColor,
                borderColor: Theme.of(context).errorColor,
                onPressed: () => viewModel.save(context),
              ),
              SizedBox(
                height: 16,
              ),
              CustomOutlineButton(
                text: S.of(context).addPostFailEdit,
                textColor: Theme.of(context).accentColor,
                borderColor: Theme.of(context).accentColor,
                onPressed: () => viewModel.updateWith(
                  fail: false,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomRaisedButton(
                text: S.of(context).close,
                onPressed: () => viewModel.reset(
                  context,
                  showDialog: false,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
