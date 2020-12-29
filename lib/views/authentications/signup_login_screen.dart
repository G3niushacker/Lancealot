import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lancelot/models/signup_provider_model.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/signup_user.dart';
import 'package:provider/provider.dart';
import 'package:lancelot/services/customer_service.dart';

class SignUpLoginScreen extends StatefulWidget {
  @override
  _SignUpLoginScreenState createState() => _SignUpLoginScreenState();
}

class _SignUpLoginScreenState extends State<SignUpLoginScreen> {
  void getLatLong(BuildContext context) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final provider = Provider.of<CustomerService>(context, listen: false);
    provider.latitude = position.latitude;
    provider.longitude = position.longitude;
    print(provider.latitude);
  }

  @override
  void initState() {
    super.initState();
    getLatLong(context);
  }

  @override
  Widget build(BuildContext context) {
    final signprovider = Provider.of<SignUpUsers>(context, listen: false);
    final customerDataProvider =
        Provider.of<CustomerService>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<SignUpProvider>(
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
                                : TextField(
                                    decoration:
                                        InputDecoration(hintText: 'Name'),
                                    onChanged: (val) {
                                      customerDataProvider.setName(val);
                                    },
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(hintText: 'Email'),
                              onChanged: (val) {
                                customerDataProvider.setEmail(val);
                                signprovider.setEmail(val);
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
                                      customerDataProvider.setPhone(val);
                                    },
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(hintText: 'Password'),
                              onChanged: (val) {
                                signprovider.setPassword(val);
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
                                      signprovider.signUpUsers(context);
                                      Navigator.pushNamed(
                                          context, signupInfoRoute);
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
        ));
  }
}
