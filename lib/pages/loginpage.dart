import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_chef/pages/signuppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _HesapGirisPageState createState() => _HesapGirisPageState();
}

class _HesapGirisPageState extends State<LoginPage> {
  final TextEditingController _txtSifre = TextEditingController();
  final TextEditingController _txtKullanici = TextEditingController();

  bool gorunmezSifre = true;
  bool hatirlaBeni = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Giriş"),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: Text(
                  "CODIZZA",
                  style: TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Uygulamayı kullanabilmek için giriş yapmalısınız!",
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CupertinoTextField(
                      style: const TextStyle(color: Colors.black),
                      controller: _txtKullanici,
                      keyboardType: TextInputType.emailAddress,
                      placeholderStyle: const TextStyle(color: Colors.grey),
                      placeholder: "Kullanıcı Adı",
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffix: const SizedBox(
                        height: 60,
                      ),
                      prefix: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoTextField(
                      style: const TextStyle(color: Colors.black),
                      controller: _txtSifre,
                      obscureText: gorunmezSifre,
                      placeholderStyle: const TextStyle(color: Colors.grey),
                      placeholder: "Şifre",
                      padding: const EdgeInsets.all(10),
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
                      prefix: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.password,
                            color: Colors.grey,
                            size: 30,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Bilgilerimi hatırla"),
                          CupertinoSwitch(
                              activeColor: Colors.deepOrange,
                              value: hatirlaBeni,
                              onChanged: (value) {
                                setState(() {
                                  hatirlaBeni = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoButton(
                      color: Colors.deepOrange,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Navigator.of(context).push(CupertinoPageRoute(
                        //     builder: (context) => const EditProfilePage()));
                      },
                      child: const Text(
                        "Giriş Yap",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    CupertinoButton(
                        child: Text(
                          "Kaydol",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => const SignUpPage()));
                        }),
                    CupertinoButton(
                        child: Text(
                          "Şifremi unuttum",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
