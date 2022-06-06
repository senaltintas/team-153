import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:yes_chef/pages/loginpage.dart';

void main() {
  runApp(SignUpPage());
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpDemo(),
    );
  }
}

class SignUpDemo extends StatefulWidget {
  @override
  _SignUpDemoState createState() => _SignUpDemoState();


}



class _SignUpDemoState extends State<SignUpDemo> {

  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userSurnameController = TextEditingController();

  void _addUser() async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(_userEmailController.text);

    var json = {
      'email': '',
      'password': '',
      'name': '',
      'surname': '',
    };

    json['email'] = _userEmailController.text;
    json['password'] = _userPasswordController.text;
    json['name'] = _userNameController.text;
    json['surname'] = _userSurnameController.text;

    await docUser.set(json);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Kayıt ol"),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(/*
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/flutter-logo.png')),*/
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ad',
                    hintText: 'İsminizi giriniz'),
                controller: _userNameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Soyad',
                    hintText: 'Soyisminizi giriniz'),
                controller: _userSurnameController,
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Geçerli bir mail adresi giriniz'),
                controller: _userEmailController,
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Şifrenizi oluşturunuz'),
                controller: _userPasswordController,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.redAccent, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => LoginPage()));
                  _addUser();
                },
                child: Text(
                  'Kayıt ol',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),

            GestureDetector(
              child: Text('Giriş yap'),
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}