import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/gsv_button.dart';

class UiView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              GsvButton(
                  text: "로그인",
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
                  isEnabled: false
              ),
            ],
          ),
        )
      ),
    );
  }
}