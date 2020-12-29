import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:lancelot/services/customer_service.dart';
import 'package:provider/provider.dart';

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

  void signUpUsers(BuildContext context) {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((newUser) {
      final customerProvider =
          Provider.of<CustomerService>(context, listen: false);
      customerProvider.user = newUser.user.uid;
      final guardProvider =
          Provider.of<CustomerService>(context, listen: false);
      guardProvider.user = newUser.user.uid;
      userId = newUser.user.uid;
    });
  }

  void signInUser(BuildContext context) {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((signInUser) {
      final customerProvider =
          Provider.of<CustomerService>(context, listen: false);
      customerProvider.user = signInUser.user.uid;
      final guardProvider =
          Provider.of<CustomerService>(context, listen: false);
      guardProvider.user = signInUser.user.uid;
      userId = signInUser.user.uid;
    });
  }

  void logout() {
    auth.signOut();
  }
}
