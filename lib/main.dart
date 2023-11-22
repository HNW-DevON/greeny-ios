import 'package:flutter/material.dart';
import 'package:flutterproj/component/button/gsv_button.dart';
import 'package:flutterproj/features/ui/ui.dart';
import 'package:flutterproj/main_viewmodel.dart';
import 'package:provider/provider.dart';
import 'features/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => MainViewModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          initialRoute: "/ui",
          routes: {
            '/home': (context) => const HomeView(),
            '/ui': (context) => UiView()
          },
          // home: UiView(),
          debugShowCheckedModeBanner: false,
        ));
  }
}

