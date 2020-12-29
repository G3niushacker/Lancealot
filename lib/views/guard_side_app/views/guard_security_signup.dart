import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/guard_service.dart';
import 'package:provider/provider.dart';

class GuardSecuritySign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GuardService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Your Personal Info's",
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
                    Stack(
                      children: [
                        Align(child: provider.showProfileImage()),
                        Positioned(
                          top: 60,
                          left: 100,
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              provider.pickProfileImage();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your Profile"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Drivers license number',
                      ),
                      onChanged: (val) {
                        provider.setLicenceNo(val);
                      },
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Drivers license expiration',
                      ),
                      onChanged: (val) {
                        provider.setLicenceExp(val);
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      shape: StadiumBorder(),
                      color: Colors.black,
                      height: 50,
                      onPressed: () {
                        Navigator.pushNamed(context, guardAddress);
                      },
                      child: Text(
                        "Next",
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
    );
  }
}
