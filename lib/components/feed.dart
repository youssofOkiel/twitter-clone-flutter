import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyFeedPage extends StatefulWidget {
  const MyFeedPage({Key? key}) : super(key: key);

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {

  // final CollectionReference postsList = FirebaseFirestore.instance.collection('posts');

  Future getAllposts() async{
    // List myPost = [];
    // try{
    //     await postsList.get().then((value) {
    //           value.docs.forEach((element) { 
    //             myPost.add(element);
    //           });
    // });

    // print(myPost);
    // }
    // catch(e){
    //   print(e);
    // }
    
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List _pages = [
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
                        ),
                      ),
                      Text("Abdelsatar Ahmed",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, bottom: 10),
                    child: Row(
                      children: [
                        Text("hello from Abdelsata Ahmed :)"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                              width: 360),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
                        ),
                      ),
                      Text("Abdelsatar Ahmed",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, bottom: 10),
                    child: Row(
                      children: [
                        Text("hello from Abdelsata Ahmed :)"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                              width: 360),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
                        ),
                      ),
                      Text("Abdelsatar Ahmed",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, bottom: 10),
                    child: Row(
                      children: [
                        Text("hello from Abdelsata Ahmed :)"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                              width: 360),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
                        ),
                      ),
                      Text("Abdelsatar Ahmed",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0, bottom: 10),
                    child: Row(
                      children: [
                        Text("hello from Abdelsata Ahmed :)"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                              width: 360),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    Column(
      children: [
        Row(
          children: [
            Flexible(
              child:  Container(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),),
          
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 90,
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg"),
          ),
        ),
        Text("Abdelsatar Ahmed",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ],
    ),
    Text("AddFollow")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        elevation: 20,
        automaticallyImplyLeading: false,
        shadowColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 25, 128, 212),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),

      body: Center(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _pages.elementAt(_selectedIndex),
      )),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 25, 128, 212)),
        selectedItemColor: Color.fromARGB(255, 25, 128, 212),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Followers',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped, //New
      ),

      // This trailing comma makes auto-formatting ni  cer for build methods.
    );
  }
}
