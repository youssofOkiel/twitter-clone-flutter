import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitterapp/Models/Tweet.dart';

class FirebaseServices 
{
  static Future<List> getHomeTweets(String currentUserId) async {
    QuerySnapshot homeTweets = await FirebaseFirestore.instance
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .get();

    List<Tweet> followingTweets =
        homeTweets.docs.map((doc) => Tweet.fromDoc(doc)).toList();
    return followingTweets;
  }

}