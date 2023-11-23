
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget redBoard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
      ),
      child: this,
    );
  }
}
