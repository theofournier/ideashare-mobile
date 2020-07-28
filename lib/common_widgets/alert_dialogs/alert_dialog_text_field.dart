import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/alert_dialogs/alert_dialog_button.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_text_form_field.dart';
import 'package:ideashare/generated/l10n.dart';

class AlertDialogTextField extends StatefulWidget {
  AlertDialogTextField({
    this.title,
    this.message,
    this.hintText,
    this.keyboardType,
    this.autoFocus = false,
    this.maxLines,
    this.initialText = "",
  });

  final String title;
  final String message;
  final String hintText;
  final TextInputType keyboardType;
  final bool autoFocus;
  final int maxLines;
  final String initialText;

  Future<String> show(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) => this,
    );
  }

  @override
  _AlertDialogTextFieldState createState() => _AlertDialogTextFieldState();
}

class _AlertDialogTextFieldState extends State<AlertDialogTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialText;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.message != null) ...[
            Text(widget.message),
            SizedBox(
              height: 16,
            ),
          ],
          CustomTextFormField(
            controller: _controller,
            hintText: widget.hintText,
            keyboardType: widget.keyboardType,
            autoFocus: widget.autoFocus,
            maxLines: widget.maxLines,
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
            Navigator.of(context).pop(_controller.text);
          },
        ),
      ],
    );
  }
}
