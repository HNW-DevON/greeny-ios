import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/button_type.dart';
import 'package:flutterproj/component/button/gsv_button.dart';
import 'package:flutterproj/component/text/gsv_text.dart';
import 'package:flutterproj/component/text/text_type.dart';

class UiView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 100),
              GsvButton(
                  text: "로그인asdas",
                  callback: () {

                  },
                  isEnabled: true
              ),

              GsvButton(
                  text: "test",
                  callback: () {

                  },
                  isEnabled: false
              ),
              GsvButton(
                text: "test",
                callback: () {

                },
                buttonType: ButtonType.strokeButton,
              ),
              GsvButton(
                  text: "test",
                  callback: () {

                  },
                  isEnabled: false,
                buttonType: ButtonType.strokeButton,
              ),
              GsvButton(
                  text: "test",
                  callback: () {

                  },
                buttonType: ButtonType.grayDefaultButton,
              ),
              GsvButton(
                text: "test",
                callback: () {

                },
                buttonType: ButtonType.grayStrokeButton,
              ),
              GsvButton(
                text: "test",
                callback: () {

                },
                buttonType: ButtonType.grayDefaultButton,
              ),
              const GsvText(text: "Hello", fontWeight: FontWeight.w100, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w200, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w300, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w400, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w500, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w600, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w700, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w800, textType: TextType.title),
              const GsvText(text: "Hello", fontWeight: FontWeight.w900, textType: TextType.title),

              const GsvText(text: "Hello", fontWeight: FontWeight.w100, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w200, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w300, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w400, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w500, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w600, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w700, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w800, textType: TextType.body),
              const GsvText(text: "Hello", fontWeight: FontWeight.w900, textType: TextType.body),
            ],
          ),
        )
      )
    );
  }
}