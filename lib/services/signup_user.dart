import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SignUpUsers extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  var userId;
  void getUserId() {
    var fUser = auth.currentUser;
    userId = fUser.uid;
  }

  String email;
  String password;

  void setEmail(String val) {
    email = val;
  }

  void setPassword(String val) {
    password = val;
  }

  void signUpUsers() {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((newUser) {
      userId = newUser.user.uid;
    });
  }

  void signInUser() {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((signInUser) {
      userId = signInUser.user.uid;
    });
  }

  void logout() {
    auth.signOut();
  }
}
