import 'package:flutter/material.dart';
import 'package:lancelot/components/condition_screen_card.dart';
import 'package:lancelot/routes/routes_name.dart';

class ConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Please Select a role",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            ConditionScreenCard(
              name: "Use as Customer",
              image: "images/user.png",
              onTap: () {
                Navigator.pushNamed(context, signupRoute);
              },
            ),
            ConditionScreenCard(
              name: "Use as Guard",
              image: "images/guard.png",
              onTap: () {
                Navigator.pushNamed(context, guardSignUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
