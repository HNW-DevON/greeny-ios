import 'package:flutter/material.dart';
import 'package:flutterproj/theme/color.dart';

enum TextFieldType {

  defaultTextField(
    backgroundColor: ColorStyle.gray50,
    contentColor: ColorStyle.gray700,
    strokeColor: ColorStyle.transparent,
    disabledBackgroundColor: ColorStyle.gray50,
    disabledContentColor: ColorStyle.gray100,
    disabledStrokeColor: ColorStyle.gray100,
    labelColor: ColorStyle.gray300
  );

  final Color backgroundColor;
  final Color contentColor;
  final Color strokeColor;
  final Color disabledBackgroundColor;
  final Color disabledContentColor;
  final Color disabledStrokeColor;
  final Color labelColor;

  const TextFieldType({
    required this.backgroundColor,
    required this.contentColor,
    required this.strokeColor,
    required this.disabledBackgroundColor,
    required this.disabledContentColor,
    required this.disabledStrokeColor,
    required this.labelColor
  });

}
