import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet {
  String id;
  String senderId;
  String text;
  String image;
  String timestamp;
  List<String> likes;

  Tweet(
      {this.id = "",
      this.senderId = "",
      this.text = "",
      this.image = "",
      this.timestamp = "",
      this.likes = const []});

  factory Tweet.fromDoc(DocumentSnapshot doc) {
    return Tweet(
      id: doc.id,
      senderId: doc['senderId'],
      text: doc['text'],
      image: doc['image'],
      timestamp: doc['timestamp'],
      likes: doc['likes'],
    );
  }
}
