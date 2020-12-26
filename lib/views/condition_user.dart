import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/customer_service.dart';
import 'package:provider/provider.dart';

class ConditionUser extends StatefulWidget {
  @override
  _ConditionUserState createState() => _ConditionUserState();
}

class _ConditionUserState extends State<ConditionUser> {
  void checkUserAndGetUserInfo(BuildContext context) {
    final provider = Provider.of<CustomerService>(context, listen: false);
    if (provider.user != null) {
      provider.getUserInfo();
      Navigator.pushNamed(context, homeRoute);
    } else {
      Navigator.pushNamed(context, conditionScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    checkUserAndGetUserInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
