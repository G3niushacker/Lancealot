import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GuardSignUpProvider extends ChangeNotifier {
  bool isSignUp = false;
  bool isSignupInfo = false;
  File profileImage;

  void signupToSignin() {
    isSignUp = !isSignUp;
    notifyListeners();
  }

  Future pickProfileImage() async {
    var sampleImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    profileImage = sampleImage;
    notifyListeners();
  }

  Widget showProfileImage() {
    if (profileImage != null) {
      return ClipOval(
        child: Image.file(
          profileImage,
          fit: BoxFit.fill,
          height: 120,
          width: 120,
        ),
      );
    } else {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 5)),
          child: Image.asset(
            "images/profile.png",
            height: 120,
            width: 120,
          ),
        ),
      );
    }
  }
}
