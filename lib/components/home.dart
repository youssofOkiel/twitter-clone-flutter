import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitterapp/Models/Tweet.dart';
import 'package:twitterapp/Models/UserModel.dart';
import 'package:twitterapp/Services/firebase.dart';
import 'package:twitterapp/Widgets/TweetContainer.dart';
import 'package:twitterapp/components/tweetBox.dart';

class HomeScreen extends StatefulWidget {
  final String profileId;

  const HomeScreen({Key? key, required this.profileId}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List _followingTweets = [];
  bool _loading = false;

  buildTweets(Tweet tweet, UserModel user) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TweetContainer(
        tweet: tweet,
        user: user,
        profileId: widget.profileId,
      ),
    );
  }

  setupFollowingTweets() async {
    setState(() {
      _loading = true;
    });

    print("setupFollowingTweets");
    List followingTweets = await FirebaseServices.getHomeTweets();
    print(followingTweets.length);

    setState(() {
      _followingTweets = followingTweets;
      _loading = false;
    });
  }

  showFollowingTweets(String currentUserId) {
    List<Widget> followingTweetsList = [];
    for (Tweet tweet in _followingTweets) {
      followingTweetsList.add(FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(tweet.senderId)
              .get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              UserModel author = UserModel.fromDoc(snapshot.data);
              return buildTweets(tweet, author);
            } else {
              return SizedBox.shrink();
            }
          }));
    }

    return followingTweetsList;
  }

  @override
  void initState() {
    super.initState();
    print("initState");
    setupFollowingTweets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: SizedBox(),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TweetBox(
                          profileId: widget.profileId,
                        )));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          centerTitle: true,
          leading: Container(
            height: 40,
            child: SizedBox(),
          ),
          title: Text(
            'Home',
            style: TextStyle(
              color: Color(0xff00acee),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () => setupFollowingTweets(),
          child: ListView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              _loading ? LinearProgressIndicator() : SizedBox.shrink(),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5),
                  Column(
                    children: showFollowingTweets(widget.profileId),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
