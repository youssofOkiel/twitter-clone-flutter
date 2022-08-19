import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String username;
  String photoURL;
  String email;
  String bio;
  String wallpaper;
  List<dynamic> followers;
  List<dynamic> following;


  UserModel(
      {this.id = "",
      this.username = "",
      this.photoURL ="",
      this.email = "",
      this.bio = "",
      this.wallpaper = "",
      this.followers = const [],
      this.following = const []
      });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      username: doc['username'],
      email: doc['email'],
      photoURL: doc['photoURL'],
      bio: doc['bio'],
      wallpaper: doc['wallpaper'],
      followers: doc['followers'],
      following: doc['following']
    );
  }
}
