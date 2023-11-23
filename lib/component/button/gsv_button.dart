import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/button_type.dart';
import 'package:flutterproj/component/text/gsv_text.dart';
import 'package:flutterproj/component/text/text_type.dart';

class GsvButton extends StatefulWidget {
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
  _GsvButtonState createState() => _GsvButtonState();
}

class _GsvButtonState extends State<GsvButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150)
    );

    _animation = Tween<double>(begin: 1.0, end: 0.98).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animation,
        child: SizedBox(
          width: double.infinity,
          height: null,
          child: TextButton(
            onPressed: widget.isEnabled ? () {
              _animationController.forward();
            } : null,
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              backgroundColor: widget.isEnabled
                  ? MaterialStateProperty.all(widget.buttonType.backgroundColor)
                  : MaterialStateProperty.all(widget.buttonType.disabledBackgroundColor),
              foregroundColor: widget.isEnabled
                  ? MaterialStateProperty.all(widget.buttonType.contentColor)
                  : MaterialStateProperty.all(widget.buttonType.disabledContentColor),
              side: MaterialStateProperty.all(
                  BorderSide(
                      color: widget.isEnabled
                          ? widget.buttonType.strokeColor
                          : widget.buttonType.disabledStrokeColor,
                      width: 1.5
                  )),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(GsvButton.height / 2),
                  )
              ),
            ),
            child: GsvText(
              text: widget.text,
              textType: TextType.label,
              color: widget.isEnabled
                  ? widget.buttonType.contentColor
                  : widget.buttonType.disabledContentColor,
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
