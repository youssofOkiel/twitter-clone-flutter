import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitterapp/Models/Tweet.dart';

class FirebaseServices 
{
  static void createTweet(Tweet tweet) {
    FirebaseFirestore.instance
        .collection('posts').doc(tweet.senderId).set({'timestamp': tweet.timestamp});
    FirebaseFirestore.instance
        .collection('posts').add({
      'text': tweet.text,
      'image': tweet.image,
      "authorId": tweet.senderId,
      "timestamp": tweet.timestamp,
      'likes': tweet.likes,
    });
  }

  static Future<List> getHomeTweets() async {
    QuerySnapshot homeTweets = await FirebaseFirestore.instance
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .get();

    List<Tweet> followingTweets =
        homeTweets.docs.map((doc) => Tweet.fromDoc(doc)).toList();
    return followingTweets;
  }

  static void likeTweet(String currentUserId, Tweet tweet) {
    DocumentReference tweetDocProfile =
        FirebaseFirestore.instance.doc(tweet.senderId).collection('posts').doc(tweet.id);
    tweetDocProfile.get().then((doc) {
      // List likes = doc.data()['likes'];
      // tweetDocProfile.update({'likes': likes.add(currentUserId)});
    });

    DocumentReference tweetDocFeed =
        FirebaseFirestore.instance.doc(currentUserId).collection('userFeed').doc(tweet.id);
    tweetDocFeed.get().then((doc) {
      if (doc.exists) {
        // int likes = doc.data()['likes'];
        // tweetDocFeed.update({'likes': likes + 1});
      }
    });

    FirebaseFirestore.instance.doc(tweet.id).collection('tweetLikes').doc(currentUserId).set({});
  }

  static void unlikeTweet(String currentUserId, Tweet tweet) {
    DocumentReference tweetDocProfile =
        FirebaseFirestore.instance.doc(tweet.senderId).collection('userTweets').doc(tweet.id);
    tweetDocProfile.get().then((doc) {
      // int likes = doc.data()['likes'];
      // tweetDocProfile.update({'likes': likes - 1});
    });

    DocumentReference tweetDocFeed =
        FirebaseFirestore.instance.doc(currentUserId).collection('userFeed').doc(tweet.id);
    tweetDocFeed.get().then((doc) {
      if (doc.exists) {
        // int likes = doc.data()['likes'];
        // tweetDocFeed.update({'likes': likes - 1});
      }
    });

    FirebaseFirestore.instance
        .doc(tweet.id)
        .collection('tweetLikes')
        .doc(currentUserId)
        .get()
        .then((doc) => doc.reference.delete());
  }

  static Future<bool> isLikeTweet(String currentUserId, Tweet tweet) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .doc(tweet.id)
        .collection('tweetLikes')
        .doc(currentUserId)
        .get();

    return userDoc.exists;
  }


}