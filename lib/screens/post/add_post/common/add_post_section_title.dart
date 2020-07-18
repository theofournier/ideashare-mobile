import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ideashare/resources/theme.dart';
import 'package:ideashare/utils/extensions/text_style.dart';

class AddPostSectionTitle extends StatelessWidget {
  AddPostSectionTitle({
    this.title = "",
    this.description,
    this.onAdd,
  });

  final String title;
  final String description;
  final VoidCallback onAdd;

  void showDescription(BuildContext context) {
    Flushbar(
      borderRadius: 8,
      message: description,
      margin: const EdgeInsets.all(8),
      icon: Icon(Icons.info_outline, color: Colors.white,),
      backgroundColor: Theme.of(context).accentColor,
      duration: Duration(seconds: 5),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      shouldIconPulse: false,
    )..show(context);
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
                  width: 8,
                ),
                Icon(
                  Icons.info_outline,
                  color: AppColors.greyMedium,
                  size: 20,
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
              color: Theme.of(context).accentColor,
            ),
            iconSize: 35,
            onPressed: onAdd,
          )
        ],
      ],
    );
  }
}
