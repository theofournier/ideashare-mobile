import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/alert_dialog_button.dart';
import 'package:ideashare/common_widgets/custom_text_form_field.dart';
import 'package:ideashare/generated/l10n.dart';

class AlertDialogTextField extends StatelessWidget {
  AlertDialogTextField({
    this.title,
    this.message,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.autoFocus = false,
    this.maxLines,
  });

  final String title;
  final String message;
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool autoFocus;
  final int maxLines;

  Future<String> show(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (message != null) ...[
            Text(message),
            SizedBox(
              height: 16,
            ),
          ],
          CustomTextFormField(
            controller: controller,
            hintText: hintText,
            keyboardType: keyboardType,
            autoFocus: autoFocus,
            maxLines: maxLines,
          ),
        ],
      ),
      actions: <Widget>[
        AlertDialogButton(
          text: S.of(context).cancel,
          color: Theme.of(context).errorColor,
        ),
        AlertDialogButton(
          text: S.of(context).save,
          fontWeight: FontWeight.w600,
          onPressed: () {
            String text = controller.text;
            controller.text = "";
            Navigator.of(context).pop(text);
          },
        ),
      ],
    );
  }
}
