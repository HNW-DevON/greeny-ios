import 'package:flutter/material.dart';
import 'package:flutterproj/features/home/home_view.dart';
import 'package:flutterproj/theme/color.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _Nav();
}

class _Nav extends State<Nav> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
  );

  final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)
                ),
                boxShadow: [
                  BoxShadow(color: ColorStyle.black.withAlpha(12), spreadRadius: 1, blurRadius: 8)
                ]
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  elevation: 12,
                  iconSize: 32,
                  backgroundColor: ColorStyle.white,
                  selectedItemColor: ColorStyle.main500,
                  unselectedItemColor: ColorStyle.gray300,
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      // icon: Icon(Icons.text_snippet),
                      icon: ImageIcon(AssetImage("assets/image/home.png")),
                      label: 'home',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/image/explore.png")),
                      label: 'explore',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/image/cam.png")),
                      label: 'cam',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/image/quest.png")),
                      label: 'quest',
                    ),
                    BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage("assets/image/my.png")),
                      label: 'my',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                )
            )
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}