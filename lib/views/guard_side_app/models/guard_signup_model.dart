import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GuardSignUpProvider extends ChangeNotifier {
  bool isSignUp = false;
  bool isSignupInfo = false;

  void signupToSignin() {
    isSignUp = !isSignUp;
    notifyListeners();
  }
}
