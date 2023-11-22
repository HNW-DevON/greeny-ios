import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/button_type.dart';
import 'package:flutterproj/component/text/gsv_text.dart';
import 'package:flutterproj/component/text/text_type.dart';

class GsvButton extends StatelessWidget {

  static const double height = 44;

  final String text;
  final VoidCallback callback;
  final ButtonType buttonType;
  final bool isEnabled;
  final bool isLarge;

  const GsvButton({
    Key? key,
    required this.text,
    required this.callback,
    this.isEnabled = true,
    this.isLarge = true,
    this.buttonType = ButtonType.defaultButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: SizedBox(
          width: isLarge ? double.infinity : null,
          height: height,
          child: TextButton(
              style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  backgroundColor: buttonType.backgroundColor,
                  foregroundColor: buttonType.contentColor,
                  disabledBackgroundColor: buttonType.disabledBackgroundColor,
                  disabledForegroundColor: buttonType.disabledContentColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: isEnabled ? buttonType.strokeColor : buttonType.disabledStrokeColor,
                        width: 1.5
                    ),
                    borderRadius: BorderRadius.circular(height / 2),
                  ),
              ),
              onPressed: isEnabled ? () {
                callback();
              } : null,
              child: GsvText(
                text: text,
                textType: TextType.label,
                color: isEnabled ? buttonType.contentColor : buttonType.disabledContentColor,
              )
          )
      ),
    );
  }
}

