import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yes_chef/pages/recipeInfoPage.dart';

import 'mainpage.dart';

class AnasayfaPage extends StatefulWidget {
  const AnasayfaPage({Key? key}) : super(key: key);

  @override
  State<AnasayfaPage> createState() => _AnasayfaPageState();
}

class _AnasayfaPageState extends State<AnasayfaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Ana Sayfa",
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 25, color: Colors.black87),
        ),

      ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => recipeInfoPage()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100.0, vertical: 15.0)),
                child: const Text(
                  "TARİF SAYFASI",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ))
        ),

    );
  }
}
