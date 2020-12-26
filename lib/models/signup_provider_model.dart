import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpProvider extends ChangeNotifier {
  bool isSignUp = false;
  bool isSignupInfo = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void signupToSignin() {
    isSignUp = !isSignUp;
    notifyListeners();
  }
}
