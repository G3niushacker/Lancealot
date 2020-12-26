import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/signup_user.dart';
import 'package:provider/provider.dart';
import 'package:lancelot/services/customer_service.dart';

class SecurityInfoBusiness extends StatefulWidget {
  @override
  _SecurityInfoBusinessState createState() => _SecurityInfoBusinessState();
}

class _SecurityInfoBusinessState extends State<SecurityInfoBusiness> {
  int ringvalue = 0;
  bool isNext = false;

  void onChangedCall1(val) {
    setState(() {
      ringvalue = val;
    });
  }

  void onChangedCall2(val) {
    setState(() {
      ringvalue = val;
      isNext = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerService>(context, listen: false);
    final signProvider = Provider.of<SignUpUsers>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Your Security Info's",
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
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Would you like us to secure your business location for an additional 10 Dollar per month\n(Please note we will come to you wherever you are located at the time you use the 'save me' This is if you want us to respond to your business when you are not there)",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No"),
                          Radio(
                            value: 0,
                            groupValue: ringvalue,
                            onChanged: (val) {
                              onChangedCall1(val);
                              provider.setSecureBusiness(val);
                            },
                          ),
                          Text("Yes"),
                          Radio(
                            value: 1,
                            groupValue: ringvalue,
                            onChanged: (val) {
                              onChangedCall2(val);
                              provider.setSecureBusiness(val);
                            },
                          )
                        ],
                      ),
                      ringvalue == 0
                          ? Container()
                          : Card(
                              elevation: 8.0,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Enter Your Business Address",
                                      style: TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: 'House no Street'),
                                      onChanged: (val) {
                                        provider.setBHouse(val);
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration:
                                          InputDecoration(hintText: 'state'),
                                      onChanged: (val) {
                                        provider.setBState(val);
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: 'City'),
                                            onChanged: (val) {
                                              provider.setBCity(val);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                hintText: 'ZipCode'),
                                            onChanged: (val) {
                                              provider.setBZip(val);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      MaterialButton(
                        shape: StadiumBorder(),
                        color: Colors.black,
                        height: 50,
                        onPressed: () {
                          signProvider.signUpUsers();
                          provider.addCustomerData();
                          signProvider.getUserId();
                          var user = signProvider.userId;
                          if (user != null) {
                            Navigator.pushNamed(context, homeRoute);
                          } else {
                            print("Here's an error");
                          }
                        },
                        child: Text(
                          ringvalue == 0 ? "Skip" : "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
