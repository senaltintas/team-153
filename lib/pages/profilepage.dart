import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yes_chef/pages/editprofilepage.dart';
import 'package:yes_chef/pages/loginpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Profil"),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Text(""),
                ),
                SizedBox(
                  width: 30,
                ),
                Text("Servet KABLAN")
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
              Material(
                child: ListTile(
                  leading: const Icon(Icons.alarm),
                  title: const Text("Bildirimler"),
                  onTap: () {},
                ),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            CupertinoFormSection(children: [
              Material(
                child: ListTile(
                  leading: const Icon(Icons.security),
                  title: const Text("Gizlilik"),
                  onTap: () {},
                ),
              ),
              Material(
                child: ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text("Yardım & Destek"),
                  onTap: () {},
                ),
              ),
              Material(
                child: ListTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text("Kullanıcı Sözleşmesi"),
                  onTap: () {},
                ),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            CupertinoFormSection(children: [
              Material(
                child: ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Çıkış Yap"),
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const LoginPage()));
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
