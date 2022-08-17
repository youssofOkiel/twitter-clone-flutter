import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFeedPage extends StatefulWidget {
  const MyFeedPage({Key? key}) : super(key: key);

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  // final CollectionReference postsList = FirebaseFirestore.instance.collection('posts');

  Future getAllposts() async {
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
              child: Container(
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
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
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    List<dynamic> allposts = [];
    List<dynamic> newList;
    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await posts.get();
      // Get data from docs and convert map to List
      List allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      allData.map((m) => allposts.add(m)).toList();
       allposts.retainWhere((element) { return element['senderId'] == '82cijLcdfq3kJtYZVPXf';});
    }

    getData();

    Object? getuser(id)  {
        Object? x;
        users.doc(id).get().then((value) =>  x = value.data());

        return x;
    }

    return FutureBuilder<DocumentSnapshot>(
      //Fetching data from the documentId specified of the student
      future: users.doc('xaCpJqtB9jXdGU22yNIr').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //Error Handling conditions
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              // To add separation line between the ListView
                              separatorBuilder: (context, index) =>
                                  Divider(color: Colors.grey),

                              itemCount: allposts.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text((allposts[index]['text'])),
                                      ],
                                    ),
                                    Image(
                                      image: NetworkImage(
                                          allposts[index]['image']),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text('${data['username']}')
                ],
              ),
            ),
          );
        }

        return Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 260.0),
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 7,
                    ),
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Home"),
    //     elevation: 20,
    //     automaticallyImplyLeading: false,
    //     shadowColor: Colors.black,
    //     backgroundColor: Color.fromARGB(255, 25, 128, 212),
    //     foregroundColor: Color.fromARGB(255, 255, 255, 255),
    //   ),

    //   body: Center(
    //       child: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: _pages.elementAt(_selectedIndex),
    //   )),
    //   bottomNavigationBar: BottomNavigationBar(
    //     selectedIconTheme:
    //         IconThemeData(color: Color.fromARGB(255, 25, 128, 212)),
    //     selectedItemColor: Color.fromARGB(255, 25, 128, 212),
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: 'Profile',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.add),
    //         label: 'Add Followers',
    //       ),
    //     ],
    //     currentIndex: _selectedIndex, //New
    //     onTap: _onItemTapped, //New
    //   ),

    //   // This trailing comma makes auto-formatting ni  cer for build methods.
    // );
  }
}
