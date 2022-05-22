import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfilePage> {
  bool isVegan = false;
  bool isVegeterian = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Profil"),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  fit: StackFit.loose,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.deepOrange,
                    ),
                    GestureDetector(
                      onTap: (() {
                        print("Profil Resmi Değiştir");
                      }),
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        child: Center(
                            child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoFormSection(
                  header: const Text(
                    "Kullanıcı Bilgileri",
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold),
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
                      placeholder: "Soyisim",
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
                      keyboardType: TextInputType.emailAddress,
                      placeholderStyle: const TextStyle(color: Colors.grey),
                      placeholder: "E-Posta",
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
                            Icons.email,
                            color: Colors.grey,
                            size: 30,
                          )),
                    )
                  ]),
              SizedBox(
                height: 20,
              ),
              Material(
                child: ListTile(
                  title: Text("Vegan"),
                  trailing: CupertinoSwitch(
                      activeColor: Colors.deepOrange,
                      value: isVegan,
                      onChanged: (value) {
                        setState(() {
                          isVegan = value;
                        });
                      }),
                ),
              ),
              const Divider(),
              Material(
                child: ListTile(
                  title: Text("Vejeteryan"),
                  trailing: CupertinoSwitch(
                      activeColor: Colors.deepOrange,
                      value: isVegeterian,
                      onChanged: (value) {
                        setState(() {
                          isVegeterian = value;
                        });
                      }),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              CupertinoButton(
                  color: Colors.deepOrange,
                  child: Text(
                    "Kaydet",
                  ),
                  onPressed: () {})
            ],
          ),
        ));
  }
}
