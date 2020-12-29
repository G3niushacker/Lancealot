import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GuardService extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var user;
  void getUserId() {
    var fUser = auth.currentUser;
    user = fUser.uid;
    print(user);
  }

  String firstName;
  String lastName;
  String email;
  String phone;

  File profileImage;

  String licenceNo;
  String licenceExp;

  String house;
  String state;
  String city;
  String zipCode;
  double latitude;
  double longitude;

  void setLat(double val) {
    latitude = val;
  }

  void setLong(double val) {
    longitude = val;
  }

  void setfName(String val) {
    firstName = val;
  }

  void setLName(String val) {
    lastName = val;
  }

  void setEmail(String val) {
    email = val;
  }

  void setPhone(String val) {
    phone = val;
  }

  void sethouse(String val) {
    house = val;
  }

  void setstate(String val) {
    state = val;
  }

  void setCity(String val) {
    city = val;
  }

  void setZip(String val) {
    zipCode = val;
  }

  void setLicenceNo(String val) {
    licenceNo = val;
  }

  void setLicenceExp(String val) {
    licenceExp = val;
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

  void uploadGuardInfo() async {
    int num = 12658;
    var ramdm = Random().nextInt(num);
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('guardPic$ramdm.jpg');
    StorageUploadTask uploadTask = storageReference.putFile(profileImage);
    await uploadTask.onComplete;
    String url = await storageReference.getDownloadURL();
    firestore.collection('guards').doc(user).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'house': house,
      'state': state,
      'city': city,
      'image': url,
      'zipCode': zipCode,
      'latitude': latitude,
      'longitude': longitude,
      'role': 'guard'
    });
    getUserInfo();
  }

  String displayfName;
  String displaylName;
  String displayimage;
  String displayPhone;
  dynamic role;
  // assigning user value to local veriables
  void _assignData(_fname, _lname, _image, _phone, role) {
    displayfName = _fname;
    displaylName = _lname;
    displayimage = _image;
    displayPhone = _phone;
    role = role;
    notifyListeners();
  }

  // getting user info
  Future<dynamic> getUserInfo() async {
    await firestore.collection('guards').doc(user).get().then((value) {
      var data = value.data();
      print(data);
      String _fname = data['firstName'];
      String _lname = data['lastName'];
      String _image = data['image'];
      String _phone = data['phone'];
      String _role = data['role'];
      _assignData(_fname, _lname, _image, _phone, _role);
    });
  }
}
