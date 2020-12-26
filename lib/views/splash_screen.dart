import 'package:flutter/material.dart';
import 'package:lancelot/services/customer_service.dart';
import 'package:lancelot/views/condition_user.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void getMethodsCall(BuildContext context) {
    final provider = Provider.of<CustomerService>(context, listen: false);
    provider.getUserId();
  }

  @override
  void initState() {
    super.initState();
    getMethodsCall(context);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      home: ConditionUser(),
      duration: 3000,
      imageSize: 120,
      imageSrc: "images/guard.png",
      text: "Lancelot",
      textType: TextType.ScaleAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
