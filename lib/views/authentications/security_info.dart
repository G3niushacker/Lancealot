import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:lancelot/services/customer_service.dart';

class SecurityInfo extends StatefulWidget {
  @override
  _SecurityInfoState createState() => _SecurityInfoState();
}

class _SecurityInfoState extends State<SecurityInfo> {
  int ringvalue = 0;

  void onChangedCall1(val) {
    setState(() {
      ringvalue = val;
    });
  }

  void onChangedCall2(val) {
    setState(() {
      ringvalue = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerService>(context, listen: false);
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
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Do you have RING Camera system at your home?",
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
                              provider.setRingCamera(val);
                            },
                          ),
                          Text("Yes"),
                          Radio(
                            value: 1,
                            groupValue: ringvalue,
                            onChanged: (val) {
                              onChangedCall2(val);
                              provider.setRingCamera(val);
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
                                      "Provide your RING camera info",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    TextField(
                                      decoration:
                                          InputDecoration(hintText: 'Email'),
                                      onChanged: (val) {
                                        provider.setRingEmail(val);
                                      },
                                    ),
                                    TextField(
                                      decoration:
                                          InputDecoration(hintText: 'Password'),
                                      onChanged: (val) {
                                        provider.setRingPass(val);
                                      },
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
                          Navigator.pushNamed(
                              context, signupSecurityInfoBusiness);
                        },
                        child: Text(
                          ringvalue == 0 ? "Skip" : "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
