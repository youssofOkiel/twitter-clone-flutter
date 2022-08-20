import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/Models/Tweet.dart';
import 'package:twitterapp/Services/firebase.dart';
import 'package:twitterapp/Widgets/Button.dart';

class TweetBox extends StatefulWidget {
  final String profileId;

  const TweetBox({Key? key, required this.profileId}) : super(key: key);
  @override
  TweetBoxState createState() => TweetBoxState();
}

class TweetBoxState extends State<TweetBox> {
  String tweetText = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff00acee),
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
            SizedBox(height: 20),
            MaterialButton(
              
              child: Text('Tweet'),
              
              onPressed: () async {
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
          ],
        ),
      ),
    );
  }
}
