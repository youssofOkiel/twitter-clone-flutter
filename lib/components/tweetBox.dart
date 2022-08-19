import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/Models/Tweet.dart';
import 'package:twitterapp/Services/firebase.dart';
import 'package:twitterapp/Widgets/Button.dart';

class TweetBox extends StatefulWidget {
  final String profileId;

  const TweetBox({Key? key,required this.profileId}) : super(key: key);
  @override
  TweetBoxState createState() => TweetBoxState();
}

class TweetBoxState extends State<TweetBox> {
  String tweetText ="";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Color(0xff00acee),
        centerTitle: true,
        title: Text(
          'Tweet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              maxLength: 280,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Enter your Tweet',
              ),
              onChanged: (value) {
                tweetText = value;
              },
            ),
            SizedBox(height: 10), Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color:  Color(0xff00acee),
                            
                      ),
                      )
                    ],
                  ),
            GestureDetector(
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color:  Color(0xff00acee),
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                  color:  Color(0xff00acee),
                ),
              ),
            ),
            SizedBox(height: 20),
            Button(
              btnText: 'Tweet',
              onBtnPressed: () async {
                setState(() {
                  loading = true;
                });
                if (tweetText != null && tweetText.isNotEmpty) { 
                  String image = '';
                  
                  Tweet tweet = Tweet(
                    text: tweetText,
                    image: image,
                    senderId: widget.profileId,
                    likes: [],
                    timestamp: "",
                  );
                  FirebaseServices.createTweet(tweet);
                  Navigator.pop(context);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            SizedBox(height: 20),
            loading ? CircularProgressIndicator() : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
