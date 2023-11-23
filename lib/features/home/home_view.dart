import 'package:flutter/material.dart';
import 'package:flutterproj/component/extension/widget.dart';
import 'package:flutterproj/component/text/gsv_text.dart';
import 'package:flutterproj/component/text/text_type.dart';
import 'package:flutterproj/features/root/main_viewmodel.dart';
import 'package:flutterproj/theme/color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() {
    return MainView();
  }
}

class MainView extends State<HomeView> {

  final MainViewModel vm = MainViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorStyle.white,
          title: const Text("홈", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Container(
          color: ColorStyle.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    GsvText(text: "오늘의 착한 소비", textType: TextType.headline).redBoard().paddingOnly(left: 0),
                  ]
                ),
              ],
            ).redBoard()
          )
        )
    );
  }
}
