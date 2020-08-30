import 'package:flutter/material.dart';
import 'package:ideashare/common_widgets/custom_widgets/custom_text_form_field.dart';
import 'package:ideashare/generated/l10n.dart';

class CommentTextField extends StatefulWidget {
  CommentTextField({
    Key key,
    this.onSend,
    this.isLoading,
  }) : super(key: key);

  final Future<bool> Function(String text) onSend;
  final bool isLoading;

  @override
  _CommentTextFieldState createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  TextEditingController _controller = TextEditingController();

  bool isEnable = false;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        isEnable = _controller.text.trim().isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> onSend() async {
    String comment = _controller.text.trim();
    if (comment.isEmpty) {
      return;
    }
    bool success = await widget.onSend(comment);
    if (success) {
      _controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 8,
          top: 8,
          bottom: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: CustomTextFormField(
                maxLines: 5,
                hintText: S.of(context).newComment,
                controller: _controller,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            if (widget.isLoading) ...[
              CircularProgressIndicator(),
            ],
            if (!widget.isLoading) ...[
              IconButton(
                icon: Icon(Icons.send),
                iconSize: 30,
                onPressed: widget.onSend == null || !isEnable ? null : onSend,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
