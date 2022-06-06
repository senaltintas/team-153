import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yes_chef/pages/loginpage.dart';
import 'package:yes_chef/pages/profilepage.dart';

import 'mainpage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfilePage> {


  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userSurnameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    _userNameController.text = currentName;
    _userSurnameController.text = currentSurname;
  }

  void _updateUser() async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(enteredEmail);

    var json = {
      'name': '',
      'surname': '',
    };

    json['name'] = _userNameController.text;
    json['surname'] = _userSurnameController.text;

    await docUser.update(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profil Düzenle",style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 25, color: Colors.black87),),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),

              CupertinoFormSection(
                  header: const Text(
                    "Kullanıcı Bilgileri",
                    style: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoTextField(
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      placeholderStyle: const TextStyle(color: Colors.grey),
                      placeholder: "İsim",
                      controller: _userNameController,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
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
                    SizedBox(
                      height: 10,
                    ),
                    CupertinoTextField(

                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.text,
                      placeholderStyle: const TextStyle(color: Colors.grey),
                      placeholder: "currentSurname",

                      controller: _userSurnameController,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
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
                    SizedBox(
                      height: 10,
                    ),

                  ]),
              SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: CupertinoButton(
                    color: Colors.redAccent,
                    child: Text(
                      "Kaydet",
                    ),
                    onPressed: () {
                      _updateUser();

                      currentName = _userNameController.text;
                      currentSurname = _userSurnameController.text;

                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => MainPage()));
                    }),

              )
            ],
          ),
        ));
  }
}
