import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerService extends ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var user;
  void getUserId() {
    var fUser = auth.currentUser;
    user = fUser.uid;
    print(user);
  }

  String name;
  String email;
  String phone;
  String house;
  String state;
  String city;
  String zipCode;
  int ringCamera;
  int secureBusiness;
  String ringEmail;
  String ringPassword;
  String bHouse;
  String bState;
  String bCity;
  String bZip;
  double latitude;
  double longitude;

  void setLat(double val) {
    latitude = val;
  }

  void setLong(double val) {
    longitude = val;
  }

  void setName(String val) {
    name = val;
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

  void setRingCamera(int val) {
    ringCamera = val;
  }

  void setSecureBusiness(int val) {
    secureBusiness = val;
  }

  void setRingEmail(String val) {
    ringEmail = val;
  }

  void setRingPass(String val) {
    ringPassword = val;
  }

  void setBHouse(String val) {
    bHouse = val;
  }

  void setBState(String val) {
    bState = val;
  }

  void setBCity(String val) {
    bCity = val;
  }

  void setBZip(String val) {
    bZip = val;
  }

  void addCustomerData() {
    print(latitude);
    firestore.collection('customers').doc(user).set({
      'name': name,
      'email': email,
      'phone': phone,
      'house': house,
      'state': state,
      'city': city,
      'zipCode': zipCode,
      'ringCamera': ringCamera == 1 ? 'Yes' : 'No',
      'secureBusiness': secureBusiness == 1 ? 'Yes' : 'No',
      'ringEmail': ringEmail,
      'ringPassword': ringPassword,
      'businessHouse': bHouse,
      'businessState': bState,
      'businessCity': bCity,
      'businessZip': bZip,
      'latitude': latitude,
      'longitude': longitude,
    });
  }

  String displayName;
  String displayimage;
  String displayPhone;
  // assigning user value to local veriables
  void _assignData(_name, _image, _phone) {
    displayName = _name;
    displayimage = _image;
    displayPhone = _phone;
    notifyListeners();
  }

  // getting user info
  Future<dynamic> getUserInfo() async {
    await firestore.collection('customers').doc(user).get().then((value) {
      var data = value.data();
      print(data);
      String _name = data['name'];
      String _image = data['image'];
      String _phone = data['phone'];
      _assignData(_name, _image, _phone);
    });
  }
}
