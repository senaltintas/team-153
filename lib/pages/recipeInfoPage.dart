import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainpage.dart';

class recipeInfoPage extends StatefulWidget {
  const recipeInfoPage({Key? key}) : super(key: key);

  @override
  State<recipeInfoPage> createState() => _recipeInfoPageState();
}

class _recipeInfoPageState extends State<recipeInfoPage> {
  List CommentList = [
    {
      "profile_image": "assets/images/avatar.png",
      "name": "Leyla ",
      "comment": "It has survived not only five centuries"
    },
    {
      "profile_image": "assets/images/avatar.png",
      "name": "Ayşe",
      "comment": "It has survived not only five centuries"
    },
  ];

  int hazirda_yada_hazirlat = 0;

  List tabs = ["Malzemeler", "Tarif","Yorumlar"];
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 35,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Margarita Pizza",
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
                            const AssetImage('assets/images/margarita_pizza.jpg'),
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
                    children: const [
                      Text(
                        "Pizza, Fast Food",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            color: Colors.black87),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: const [
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
                        "4-6 kişilik",
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
                        "30 dk",
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
                        "4.7",
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
                            RichText(
                              text: const TextSpan(
                                text: 'Tavuk\n',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'Kaşar\n',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Hamur\n',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Zeytin\n',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (hazirda_yada_hazirlat==1)
                    const Text(
                      'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  if (hazirda_yada_hazirlat==2)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: CommentList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 150.0,
                                width: 350.0,
                                padding: EdgeInsets.only(bottom: 24.0),
                                decoration:  const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,



                                ),
                                child: Column(
                                  children: [
                                    Row(
                                        children:  [ ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            CommentList[index]["profile_image"],
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            CommentList[index]["name"],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          )
                                        ]
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Row(
                                      children:  [
                                        Text(
                                          CommentList[index]["comment"],
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                    )

                ]),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
