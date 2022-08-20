import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<bool> signUp(String displayName, String username, String email,
      String password) async {
    try {
      UserCredential authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? signedInUser = authResult.user;

      if (signedInUser != null) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(signedInUser.uid)
            .set({
          'displayName': displayName,
          'username': username,
          'email': email,
          'photoURL': '',
          'password': password,
          'wallpaper': '',
          'bio': '',
          'followers': [],
          'following': [],
          'is_active':true,
          'verified':true
        });
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static void logout() {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
}
