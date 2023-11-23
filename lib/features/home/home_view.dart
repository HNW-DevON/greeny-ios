import 'package:flutter/material.dart';
import 'package:flutterproj/component/extension/widget.dart';
import 'package:flutterproj/component/text/gsv_text.dart';
import 'package:flutterproj/component/text/text_type.dart';
import 'package:flutterproj/component/today/today_ceil.dart';
import 'package:flutterproj/features/root/main_viewmodel.dart';
import 'package:flutterproj/theme/color.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() {
    return _MainView();
  }
}

class _MainView extends State<HomeView> {

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
                  const GsvText(text: "오늘의 착한 소비", textType: TextType.headline).redBoard().paddingOnly(left: 0),
                ]
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        child: Row(
                          children: [
                            const TodayCeil(product: "product", detail: "detail", imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif').redBoard(),
                            const TodayCeil(product: "product", detail: "detail", imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif').redBoard(),
                            const TodayCeil(product: "product", detail: "detail", imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif').redBoard(),
                            const TodayCeil(product: "product", detail: "detail", imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif').redBoard(),
                            const TodayCeil(product: "product", detail: "detail", imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif').redBoard(),
                          ],
                        )
                    )
                ),
              )

            ],
          ).redBoard()
        )
      )
    );
  }
}
