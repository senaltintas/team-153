import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_chef/pages/loginpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa")
      ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return LoginPage();

          default:
        }
      },
    );
  }
}
