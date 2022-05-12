import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_chef/pages/mainpage.dart';
import 'package:yes_chef/pages/hesap/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate
      ],
      title: 'CODIZZA',
      home: MainPage(),
    );
  }
}
