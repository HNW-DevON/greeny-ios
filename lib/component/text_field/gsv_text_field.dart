import 'package:flutter/material.dart';
import 'package:flutterproj/component/text_field/text_field_type.dart';

class GsvTextField extends StatefulWidget {
  static const double height = 52;

  final TextEditingController controller;
  final bool isPassword;
  final bool isEnabled;
  final String? helperText;
  final String? labelText;
  final int? maxLines;
  final IconData? prefixIconData;
  final IconData? hideIcon;
  final IconData? showIcon;
  final TextFieldType textFieldType;
  final VoidCallback? callback;

  const GsvTextField({
    Key? key,
    required this.controller,
    this.isPassword = false,
    this.isEnabled = true,
    this.helperText,
    this.labelText,
    this.prefixIconData,
    this.hideIcon,
    this.showIcon,
    this.maxLines = 1,
    this.textFieldType = TextFieldType.defaultTextField,
    this.callback
  }) : super(key: key);

  @override
  _GsvTextFieldState createState() => _GsvTextFieldState();
}

class _GsvTextFieldState extends State<GsvTextField> {
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isShowPassword,
      maxLines: !isShowPassword ? widget.maxLines : 1,
      enabled: widget.isEnabled,
      style: TextStyle(
        color: widget.isEnabled
          ? widget.textFieldType.contentColor
          : widget.textFieldType.disabledContentColor,
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: widget.isEnabled
          ? widget.textFieldType.backgroundColor
          : widget.textFieldType.disabledBackgroundColor,
        labelText: widget.labelText ?? '',
        labelStyle: TextStyle(color: widget.textFieldType.labelColor),
        helperText: widget.helperText,
        prefixIcon: widget.prefixIconData != null
          ? Icon(widget.prefixIconData, color: widget.textFieldType.labelColor) // Set accent color for prefix icon
          : null,
        suffixIcon:
        widget.isPassword
          ? IconButton(
          onPressed: () {
            setState(() {
              isShowPassword = !isShowPassword;
            });
          },
          icon: Icon(
            isShowPassword
              ? widget.showIcon ?? Icons.visibility
              : widget.hideIcon ?? Icons.visibility_off),
          color: widget.textFieldType.labelColor)
          : widget.callback != null && widget.hideIcon != null
          ? IconButton(
          onPressed: () {
            widget.callback!();
          },
          icon: Icon(
            widget.hideIcon,
            color: widget.textFieldType.labelColor))
          : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.isEnabled
              ? widget.textFieldType.strokeColor
              : widget.textFieldType.disabledStrokeColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.isEnabled
              ? widget.textFieldType.strokeColor
              : widget.textFieldType.disabledStrokeColor, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: widget.isEnabled
              ? widget.textFieldType.strokeColor
              : widget.textFieldType.disabledStrokeColor, width: 1.5),
        ),

      ),
    );
  }
}