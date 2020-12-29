import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/guard_service.dart';
import 'package:lancelot/services/signup_user.dart';
import 'package:lancelot/views/guard_side_app/models/guard_signup_model.dart';
import 'package:provider/provider.dart';

class GuardSideSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signPro = Provider.of<SignUpUsers>(context);
    final guardPro = Provider.of<GuardService>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<GuardSignUpProvider>(
        builder: (context, data, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      data.isSignUp ? "Welcome\nBack" : "Create\nAccount",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          data.isSignUp
                              ? Container()
                              : Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'First Name'),
                                        onChanged: (val) {
                                          guardPro.setfName(val);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: 'Last Name'),
                                        onChanged: (val) {
                                          guardPro.setLName(val);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(hintText: 'Email'),
                            onChanged: (val) {
                              guardPro.setEmail(val);
                              signPro.setEmail(val);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          data.isSignUp
                              ? Container()
                              : TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration:
                                      InputDecoration(hintText: 'Phone'),
                                  onChanged: (val) {
                                    guardPro.setPhone(val);
                                  },
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'),
                            onChanged: (val) {
                              signPro.setPassword(val);
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              data.isSignUp
                                  ? FlatButton(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        data.signupToSignin();
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                  : FlatButton(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        data.signupToSignin();
                                      },
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 30,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    signPro.signUpUsers(context);
                                    Navigator.pushNamed(context, guardSecurity);
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  data.isSignUp
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
