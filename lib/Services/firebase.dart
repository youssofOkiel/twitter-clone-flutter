import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:twitterapp/Models/Tweet.dart';
import 'package:twitterapp/Models/UserModel.dart';

class FirebaseServices {
  static void createTweet(Tweet tweet) {
    String time = "";
    if (tweet.timestamp == "") {
      final formate = new DateFormat('dd/MM/yyyy, hh:mm:ss').add_jm();
      time = formate.format(DateTime.now()).toString();
    }
    FirebaseFirestore.instance.collection('posts').add({
      'text': tweet.text,
      'image': tweet.image,
      "senderId": tweet.senderId,
      "timestamp": time,
      'likes': tweet.likes,
      'altText': ''
    });
  }

  static Future<List> getHomeTweets() async {
    print("getHomeTweets");
    QuerySnapshot homeTweets =
        await FirebaseFirestore.instance.collection('posts').get();

    print(homeTweets);
    List<Tweet> followingTweets =
        homeTweets.docs.map((doc) => Tweet.fromDoc(doc)).toList();
    print("followingTweets");

    return followingTweets;
  }

  static Future<List> getProfileTweets(profileId) async {
    print("getProfileTweets");
    QuerySnapshot homeTweets = await FirebaseFirestore.instance
        .collection('posts')
        .where('senderId', isEqualTo: profileId)
        .get();

    print(homeTweets);
    List<Tweet> followingTweets =
        homeTweets.docs.map((doc) => Tweet.fromDoc(doc)).toList();
    print("followingTweets");

    return followingTweets;
  }

  static Future<dynamic> followingNum(String userId) async {
    var followersCount =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return followersCount['following'].length;
  }

  static Future<dynamic> followersNum(String userId) async {
    var followersCount =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return followersCount['followers'].length;
  }

  static void likeTweet(String currentUserId, Tweet tweet) {
    DocumentReference tweetDocProfile = FirebaseFirestore.instance
        .doc(tweet.senderId)
        .collection('posts')
        .doc(tweet.id);
    tweetDocProfile.get().then((doc) {
      // List likes = doc.data()['likes'];
      // tweetDocProfile.update({'likes': likes.add(currentUserId)});
    });

    DocumentReference tweetDocFeed = FirebaseFirestore.instance
        .doc(currentUserId)
        .collection('userFeed')
        .doc(tweet.id);
    tweetDocFeed.get().then((doc) {
      if (doc.exists) {
        // int likes = doc.data()['likes'];
        // tweetDocFeed.update({'likes': likes + 1});
      }
    });

    FirebaseFirestore.instance
        .doc(tweet.id)
        .collection('tweetLikes')
        .doc(currentUserId)
        .set({});
  }

  static void unlikeTweet(String currentUserId, Tweet tweet) {
    tweet.likes.remove(currentUserId);
  }

  static Future LikeTweet(String currentUserId, Tweet tweet) async {
    tweet.likes.add(currentUserId);
  }
}
