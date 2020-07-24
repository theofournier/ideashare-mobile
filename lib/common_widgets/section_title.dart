import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/extensions/text_style.dart';
import 'package:ideashare/utils/flushbar_utils.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({
    this.title = "",
    this.description,
    this.onAdd,
  });

  final String title;
  final String description;
  final VoidCallback onAdd;

  void showDescription(BuildContext context) {
    FlushbarUtils(
      context,
      message: description,
      duration: Duration(seconds: 5),
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: description == null ? null : () => showDescription(context),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headline6.toSemiBold(),
              ),
              if (description != null) ...[
                SizedBox(
                  width: 2,
                ),
                Icon(
                  Icons.info_outline,
                  color: AppColors.greyMedium,
                  size: 15,
                ),
              ],
            ],
          ),
        ),
        if (onAdd != null) ...[
          SizedBox(
            width: 16,
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle,
            ),
            color: Theme.of(context).accentColor,
            iconSize: 35,
            onPressed: onAdd,
          )
        ],
      ],
    );
  }
}
