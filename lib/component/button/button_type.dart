import 'package:flutter/material.dart';
import 'package:flutterproj/theme/color.dart';

enum ButtonType {

  defaultButton(ColorStyle.main500,ColorStyle.white,ColorStyle.main200,ColorStyle.white);

  final Color backgroundColor;
  final Color contentColor;
  final Color disabledBackgroundColor;
  final Color disabledContentColor;

  const ButtonType(
    this.backgroundColor,
    this.contentColor,
    this.disabledBackgroundColor,
    this.disabledContentColor
  );

}
