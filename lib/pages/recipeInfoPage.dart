import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_chef/pages/anasayfapage.dart';
import 'mainpage.dart';

class recipeInfoPage extends StatefulWidget {
  const recipeInfoPage({Key? key}) : super(key: key);

  @override
  State<recipeInfoPage> createState() => _recipeInfoPageState();
}

class _recipeInfoPageState extends State<recipeInfoPage> {

  int hazirda_yada_hazirlat = 0;

  List tabs = ["Malzemeler", "Tarif"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar
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
        title:  Text(
          selectedReceiptTitle,
          style: TextStyle(
              fontWeight: FontWeight.w300, fontSize: 25, color: Colors.black87),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Material(
                          color: Colors.transparent,
                          child: Ink.image(
                            image:
                             NetworkImage(selectedReceiptImage),
                            fit: BoxFit.fill,
                            width: 280.0,
                            height: 160.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children:  [
                      ImageIcon(
                        AssetImage(
                            "assets/icons/serving-dish.png"),
                        size: 28,
                        color: Color(0xFFFF1744),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        selectedReceiptKisi,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 65.0,
                      ),
                      ImageIcon(
                        AssetImage(
                            "assets/icons/clock.png"),
                        size: 25,
                        color: Color(0xFFFF1744),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        selectedReceiptTime,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 65.0,
                      ),
                      ImageIcon(
                        AssetImage(
                            "assets/icons/star.png"),
                        size: 25,
                        color: Color(0xFFFF1744),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        selectedReceiptPoint,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )

                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                      children: [
                        Container(
                          height:0.5,
                          width:350.0,
                          color:Colors.black,),
                      ]
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        tabs.length,
                            (index) => GestureDetector(
                          onTap: () => setState(() {
                            hazirda_yada_hazirlat = index;
                          }),
                          child: Container(
                            padding: const EdgeInsets.only(
                              bottom: 3, // space between underline and text
                            ),
                            decoration: hazirda_yada_hazirlat == index
                                ? BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: hazirda_yada_hazirlat==index ? Colors.redAccent: Colors.black, // Text colour here
                                  width: 1.0, // Underline width
                                ))
                            )
                                : const BoxDecoration(
                            ),
                            child: Text(
                              tabs[index],
                              style:  TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,

                                color: hazirda_yada_hazirlat == index
                                    ? Colors.redAccent[400]
                                    : Colors.black,

                              ),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30.0,
                  ),
                  if(hazirda_yada_hazirlat==0)
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                           Text(selectedReceiptMalzemeler)
                          ],
                        ),
                      ),
                    ),
                  if (hazirda_yada_hazirlat==1)
                     Text(
                      selectedReceiptDescription,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),


                ]),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
