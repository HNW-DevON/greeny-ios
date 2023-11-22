import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/gsv_button.dart';
import 'package:flutterproj/main_viewmodel.dart';

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
          backgroundColor: Colors.white,
          title: const Text("홈", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: GsvButton(text: "버asdsads튼", callback: () {

            })
          )
        )
    );
  }
}