import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/components/home.dart';
import 'package:twitterapp/components/profile.dart';

class MyFeedPage extends StatefulWidget {

final String profileId;

  const MyFeedPage({Key? key, required this.profileId }) : super(key: key);

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  int _selectedTab = 0;


  @override
  Widget build(BuildContext context) {

        return Scaffold(
      body: [
        HomeScreen(
          profileId: widget.profileId,
        ),
        HomeScreen(
          profileId: widget.profileId,
        ),
        ProfileScreen(
          profileId: widget.profileId,
          visitedUserId: widget.profileId,
        ),
      ].elementAt(_selectedTab),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        activeColor: Color(0xff00acee),
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
