import 'package:flutter/material.dart';
import 'package:flutterproj/component/text/text_type.dart';
import '../../theme/color.dart';

class GsvText extends StatelessWidget {

  static const String _fontName = 'Pretendard';

  final String text;
  final Color color;
  final TextType textType;
  final FontWeight? fontWeight;

  const GsvText({
    Key? key,
    required this.text,
    this.color = ColorStyle.black,
    this.textType = TextType.body,
    this.fontWeight
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight ?? textType.fontWeight,
        fontSize: textType.fontSize,
        fontFamily: _fontName
      ),
    );
  }
}