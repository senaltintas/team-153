import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_chef/pages/anasayfapage.dart';
import 'package:yes_chef/pages/editprofilepage.dart';
import 'package:yes_chef/pages/loginpage.dart';
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: "Tarifler"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Ne Yapsam?"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoriler"),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "Profiil")
      ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return AnasayfaPage();

          case 4:
            return ProfilePage();
          default:
            return AnasayfaPage();
        }
      },
    );
  }
}
