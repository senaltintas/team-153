import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yes_chef/pages/mainpage.dart';
import 'package:yes_chef/pages/signuppage.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}


String enteredEmail = "";
String enteredPassword = "";
String currentName = "";
String currentSurname = "";

class _LoginDemoState extends State<LoginDemo> {
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  Future userControl() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
    for (int i = 0; i < querySnapshot.size; i++) {
      var a = querySnapshot.docs[i];
      if(a["email"] == enteredEmail) {
        if(a["password"] == enteredPassword){
          print("giriş başarılı");

          currentName = a['name'];
          currentSurname = a['surname'];
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MainPage()));
          return null;
        }
        else{
          print("şifre hatalı");
          return null;
        }
      } else{
      }
    }
    print("böyle kullanıcı yok");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Giriş Yap"),
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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Geçerli mail adresi girin'),
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
                    hintText: 'Şifre girin'),
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



                  enteredPassword = _userPasswordController.text;
                  enteredEmail = _userEmailController.text;
                  userControl();
                },
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            GestureDetector(
              child: Text('Yeni hesap oluştur.'),
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignUpPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}