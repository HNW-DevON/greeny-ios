import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/button_type.dart';

class GsvButton extends StatelessWidget {

  static const double _height = 44;

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
    return SizedBox(
      width: isLarge ? double.infinity : null,
      height: _height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonType.backgroundColor,
              foregroundColor: buttonType.contentColor,
              disabledBackgroundColor: buttonType.disabledBackgroundColor,
              disabledForegroundColor: buttonType.disabledContentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_height / 2)
              )
          ),
          onPressed: isEnabled ? () {
            callback();
          } : null,
          child: Text(text)
      )
    );
  }
}

