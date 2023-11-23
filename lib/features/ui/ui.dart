import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/button_type.dart';
import 'package:flutterproj/component/button/gsv_button.dart';
import 'package:flutterproj/component/text/gsv_text.dart';
import 'package:flutterproj/component/text/text_type.dart';
import 'package:flutterproj/component/text_field/gsv_text_field.dart';

class UiView extends StatefulWidget {

  @override
  _UiView createState() => _UiView();
}

class _UiView extends State<UiView> {
  final TextEditingController _nameController = TextEditingController();

  bool a = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 30),
              GsvButton(
                  text: "로그인asdas",
                  callback: () {
                  },
                  isEnabled: a
              ),

              GsvButton(
                  text: "test",
                  callback: () {
                    setState(() {
                      a = !a;
                    });
                  },
                  isEnabled: true
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
                  Navigator.of(context).pushNamed('/home');
                },
                buttonType: ButtonType.grayDefaultButton,
              ),
              const SizedBox(height: 16),
              GsvTextField(controller: _nameController, labelText: '이메일을 입력해주세요'),
              const SizedBox(height: 16),
              GsvTextField(controller: _nameController, labelText: '이메일을 입력해주세요', isPassword: true),
              const SizedBox(height: 16),
              GsvTextField(controller: _nameController, labelText: "ㅁ닝ㅁ", isEnabled: false,),
              const SizedBox(height: 16),
              GsvTextField(controller: _nameController, labelText: "ㅁ닝ㅁ", prefixIconData: Icons.add, callback: () {
                _nameController.text = "";
              },hideIcon: Icons.add_circle,),
              const Row(
                children: [
                  Column(
                    children: [
                      GsvText(text: "Hello", fontWeight: FontWeight.w100, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w200, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w300, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w400, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w500, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w600, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w700, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w800, textType: TextType.title),
                      GsvText(text: "Hello", fontWeight: FontWeight.w900, textType: TextType.title),
                    ],
                  ),
                  Column(
                    children: [
                      GsvText(text: "Hello", fontWeight: FontWeight.w100, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w200, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w300, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w400, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w500, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w600, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w700, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w800, textType: TextType.body),
                      GsvText(text: "Hello", fontWeight: FontWeight.w900, textType: TextType.body),
                    ],
                  )
                ],
              )



            ],
          ),
        )
      )
    );
  }
}