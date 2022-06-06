import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yes_chef/pages/recipeInfoPage.dart';

import 'mainpage.dart';

String selectedReceipt = "";
String selectedReceiptTitle = "";
String selectedReceiptTime = "";
String selectedReceiptDescription = "";
String selectedReceiptImage = "";
String selectedReceiptKisi = "";
String selectedReceiptPoint = "";
String selectedReceiptMalzemeler = "";

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
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Ana Sayfa",
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 25, color: Colors.black87),
        ),

      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
          child: SizedBox(
            child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream:FirebaseFirestore.instance.collection('receipts')
                        .snapshots(),
                    builder: (
                        BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                      if (snapshot.hasError) {
                        return const Text("error");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("loading");
                      }
                      final data = snapshot.requireData;
                      return ListView.builder(
                        primary: false,
                        itemCount: data.size,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {

                                selectedReceipt = data.docs[index].id;

                                 selectedReceiptTitle = data.docs[index]['title'];
                                selectedReceiptDescription = data.docs[index]['description'];
                                selectedReceiptTime = data.docs[index]['time'];
                                 selectedReceiptImage =  data.docs[index]['image'];
                                 selectedReceiptKisi =  data.docs[index]['kisi'];
                                 selectedReceiptPoint =  data.docs[index]['point'];
                                 selectedReceiptMalzemeler = data.docs[index]['malzemeler'];


                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) =>  recipeInfoPage()));



                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.width*0.5,
                                    width: MediaQuery.of(context).size.width,

                                    //padding: EdgeInsets.only(bottom: 24.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '${data.docs[index]['image']}',
                                                  //'assets/images/sarma.png',
                                                  height: MediaQuery.of(context).size.width*0.3,
                                                  width: MediaQuery.of(context).size.width*0.87,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ]),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(children: [
                                          Text(
                                            '${data.docs[index]['title']}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black),
                                          )
                                        ]),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person_outline,
                                              size: 18,
                                              color: Color(0xFFFF1744),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),



                                            Text(
                                              data.docs[index]['kisi'],
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),







                                            const SizedBox(
                                              width: 20.0,
                                            ),
                                            Icon(
                                               Icons.directions_walk_outlined ,
                                              size: 18,
                                              color: Color(0xFFFF1744),
                                            ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              '${data.docs[index]['point']}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          );
                        },
                      );
                    },
                  )]),),
        )

    );
  }
}
