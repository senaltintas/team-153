import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _txtSifre = new TextEditingController();
  TextEditingController _txtSifre2 = new TextEditingController();

  TextEditingController _txtKullanici = new TextEditingController();

  bool gorunmezSifre = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Kaydol"),
        ),
        child: ListView(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Text("CODIZZA")),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Uygulamayı kullanmak için lütfen üye olun",
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CupertinoTextField(
                      style: TextStyle(color: Colors.black),
                      controller: _txtKullanici,
                      keyboardType: TextInputType.emailAddress,
                      placeholderStyle: TextStyle(color: Colors.grey),
                      placeholder: "Kullanıcı Adı",
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffix: SizedBox(
                        height: 60,
                      ),
                      prefix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoTextField(
                      style: TextStyle(color: Colors.black),
                      controller: _txtSifre,
                      obscureText: gorunmezSifre,
                      placeholderStyle: TextStyle(color: Colors.grey),
                      placeholder: "Şifre",
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffix: CupertinoButton(
                          child: Icon(
                            gorunmezSifre
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              gorunmezSifre = !gorunmezSifre;
                            });
                          }),
                      prefix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.password,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoTextField(
                      style: TextStyle(color: Colors.black),
                      controller: _txtSifre2,
                      obscureText: gorunmezSifre,
                      placeholderStyle: TextStyle(color: Colors.grey),
                      placeholder: "Şifre doğrula",
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffix: CupertinoButton(
                          child: Icon(
                            gorunmezSifre
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              gorunmezSifre = !gorunmezSifre;
                            });
                          }),
                      prefix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.password,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoButton.filled(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Text(
                          "Kaydol",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
//
                          if (_txtKullanici.text.isNotEmpty &&
                              _txtSifre.text == _txtSifre2.text &&
                              _txtSifre.text.isNotEmpty) {
                          } else {}
//
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ));
  }
}
