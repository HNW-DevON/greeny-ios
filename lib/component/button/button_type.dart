import 'package:flutter/material.dart';
import 'package:flutterproj/theme/color.dart';

enum ButtonType {

  defaultButton(
    backgroundColor: ColorStyle.main500,
    contentColor: ColorStyle.white,
    disabledBackgroundColor: ColorStyle.main200,
    disabledContentColor: ColorStyle.white,
    strokeColor: ColorStyle.transparent,
    disabledStrokeColor: ColorStyle.transparent
  ),
  strokeButton(
    backgroundColor: ColorStyle.white,
    contentColor: ColorStyle.main500,
    strokeColor: ColorStyle.main500,
    disabledBackgroundColor: ColorStyle.white,
    disabledContentColor: ColorStyle.main200,
    disabledStrokeColor: ColorStyle.main200
  ),
  grayDefaultButton(
    backgroundColor: ColorStyle.gray50,
    contentColor: ColorStyle.gray300,
    strokeColor: ColorStyle.transparent,
    disabledBackgroundColor: ColorStyle.gray50,
    disabledContentColor: ColorStyle.gray300,
    disabledStrokeColor: ColorStyle.transparent
  ),
  grayStrokeButton(
    backgroundColor: ColorStyle.white,
    contentColor: ColorStyle.gray200,
    strokeColor: ColorStyle.gray200,
    disabledBackgroundColor: ColorStyle.white,
    disabledContentColor: ColorStyle.gray200,
    disabledStrokeColor: ColorStyle.gray200
  );



  final Color backgroundColor;
  final Color contentColor;
  final Color strokeColor;
  final Color disabledBackgroundColor;
  final Color disabledContentColor;
  final Color disabledStrokeColor;

  const ButtonType({
    required this.backgroundColor,
    required this.contentColor,
    required this.strokeColor,
    required this.disabledBackgroundColor,
    required this.disabledContentColor,
    required this.disabledStrokeColor
  });

}
