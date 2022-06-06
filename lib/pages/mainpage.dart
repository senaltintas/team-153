import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_chef/pages/anasayfapage.dart';
import 'package:yes_chef/pages/profilepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.redAccent,), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.account_box,color: Colors.redAccent), label: "Profil")
      ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return AnasayfaPage();
          case 1:
            return ProfilePage();
          default:
            return AnasayfaPage();
        }
      },
    );
  }
}
