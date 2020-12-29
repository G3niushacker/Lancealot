import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/customer_service.dart';
import 'package:lancelot/services/guard_service.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  Future<User> getUser() async {
    user = await auth.currentUser;
    return user;
  }

  void getMethodsCall(BuildContext context) {
    final provider = Provider.of<CustomerService>(context, listen: false);
    final guardPro = Provider.of<GuardService>(context, listen: false);
    Timer(Duration(seconds: 7), () {
      if (user != null) {
        provider.getUserId();
        provider.getUserInfo();
        guardPro.getUserId();
        guardPro.getUserInfo();
        if (guardPro.role == 'guard') {
          Navigator.pushNamed(context, guardHome);
        } else {
          Navigator.pushNamed(context, homeRoute);
        }
      } else {
        Navigator.pushNamed(context, conditionScreen);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getMethodsCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/guard.png",
              height: 150,
              width: 150,
            ),
            TextLiquidFill(
              text: 'LANCEALOT',
              waveColor: Colors.black,
              boxBackgroundColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 100.0,
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              "We Save You",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
