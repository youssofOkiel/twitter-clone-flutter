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
  List tweets = [];
   bool loading = false;


  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    return Wrap(
        spacing: 5.0, // gap between adjacent chips
        runSpacing: 2.0, // gap between lines
        children: [Text("data")]);
  }
}
