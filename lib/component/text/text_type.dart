import 'package:flutter/material.dart';

enum TextType {
  title(fontWeight: FontWeight.w700, fontSize: 24),
  headline(fontWeight: FontWeight.w700, fontSize: 20),
  subhead(fontWeight: FontWeight.w700, fontSize: 18),
  body(fontWeight: FontWeight.w500, fontSize: 16),
  label(fontWeight: FontWeight.w500, fontSize: 14),
  caption(fontWeight: FontWeight.w500, fontSize: 11);

  final FontWeight fontWeight;
  final double fontSize;

  const TextType({
    required this.fontWeight,
    required this.fontSize
  });
}