import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'components/login.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
       home:MyHomePage(),
      //  FutureBuilder(
      //       future: _initialization,
      //       builder: (context , snapshot){
      //         if(snapshot.hasError){
      //           print('error');
      //         }
      //         if(snapshot.connectionState == ConnectionState.done){
      //             return MyHomePage();
      //         }
      //         return CircularProgressIndicator();
      //       },
      // ),
    );
  }
}

