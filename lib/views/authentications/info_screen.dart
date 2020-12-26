import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:lancelot/services/customer_service.dart';

class InfoLoginScreen extends StatelessWidget {
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
                  "Your Info's",
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
                        "Enter Your Address",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration:
                            InputDecoration(hintText: 'House no Street'),
                        onChanged: (val) {
                          provider.sethouse(val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'state'),
                        onChanged: (val) {
                          provider.setstate(val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(hintText: 'City'),
                              onChanged: (val) {
                                provider.setCity(val);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: 'ZipCode'),
                              onChanged: (val) {
                                provider.setZip(val);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        shape: StadiumBorder(),
                        height: 50,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pushNamed(context, signupSecurityInfo);
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
