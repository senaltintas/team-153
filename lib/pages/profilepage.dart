
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yes_chef/pages/editprofilepage.dart';
import 'package:yes_chef/pages/loginpage.dart';

import 'mainpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("Profil",style: TextStyle(
             fontWeight: FontWeight.w300, fontSize: 25, color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children:  [

                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(enteredEmail)
                        .snapshots(),

                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return new Text("Loading");
                      } else {
                        final data = snapshot.requireData;
                        return  Text("${data['name']} ${data['surname']}",style: TextStyle(fontSize: 25,color: Colors.redAccent),);
                      }
                    }),

              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoFormSection(children: [
              Material(
                child: ListTile(
                  leading: const Icon(Icons.account_box),
                  title: const Text("Profili Düzenle"),
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const EditProfilePage()));
                  },
                ),
              ),
            ]),
            const SizedBox(
              height: 10,
            ),
            CupertinoFormSection(children: [
              Material(
                child: ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Çıkış Yap"),
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) =>  LoginPage()));
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
