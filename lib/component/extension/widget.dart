
import 'package:flutter/material.dart';

bool isDebug = true;

extension WidgetExtension on Widget {
  Widget redBoard() {
    if (!isDebug) return this;
    return Container(
      padding: const EdgeInsets.only(top: 1, left: 1),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
      ),
      child: this,
    );
  }

  Widget paddingOnly({
    double top = 0,
    double left = 0,
    double right = 0,
    double bottom = 0}) {
    return Container(
      padding: EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
      child: this,
    );
  }

  Widget paddingAll(double padding) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}


