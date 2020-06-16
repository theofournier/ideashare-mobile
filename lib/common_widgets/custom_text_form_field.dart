import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String value) validator;
  final Function(String value) onFieldSubmitted;
  final Function(String value) onSaved;
  final String initialValue;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool autoFocus;
  final bool passwordIsVisible;
  final VoidCallback togglePasswordVisibility;
  final TextCapitalization textCapitalization;
  final int minLines;
  final int maxLines;
  final double textSize;
  final TextAlign textAlign;
  final bool autovalidate;
  final bool enabled;

  CustomTextFormField({
    Key key,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.initialValue,
    this.focusNode,
    this.controller,
    this.autoFocus = false,
    this.passwordIsVisible,
    this.togglePasswordVisibility,
    this.textCapitalization = TextCapitalization.none,
    this.minLines = 1,
    this.maxLines,
    this.textSize = 16,
    this.textAlign = TextAlign.start,
    this.autovalidate = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      autovalidate: autovalidate,
      autofocus: autoFocus,
      obscureText: passwordIsVisible != null ? !passwordIsVisible : false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      initialValue: initialValue,
      minLines: passwordIsVisible != null && !passwordIsVisible ? 1 : minLines,
      maxLines: passwordIsVisible != null && !passwordIsVisible ? 1 : maxLines,
      textAlign: textAlign,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: textSize),
        enabled: enabled,
        alignLabelWithHint: true,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        suffixIcon: _buildSuffixIcon(context),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: textSize,
      ),
      textCapitalization: textCapitalization,
    );
  }

  Widget _buildSuffixIcon(BuildContext context) {
    if (passwordIsVisible != null)
      return IconButton(
        icon: Icon(passwordIsVisible ? Icons.visibility_off : Icons.visibility),
        onPressed: togglePasswordVisibility,
        color: Theme.of(context).accentColor.withOpacity(0.8),
      );
    if (suffixIcon != null)
      Icon(
        suffixIcon,
      );
    return null;
  }
}
