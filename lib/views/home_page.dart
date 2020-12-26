import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/customer_service.dart';
import 'package:lancelot/views/condtition_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getCalledUserInfo() {
    final proi = Provider.of<CustomerService>(context, listen: false);
    proi.getUserInfo();
  }

  @override
  void initState() {
    super.initState();
    getCalledUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerService>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: ClipOval(
                child: Image.asset(
                  "images/profile.png",
                  fit: BoxFit.fill,
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              provider.displayName == null ? "Loading" : provider.displayName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Text(
              provider.displayPhone == null
                  ? "Loading..."
                  : provider.displayPhone,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Card(
              child: ListTile(
                title: Text("Privacy Policy"),
                trailing: Icon(Icons.privacy_tip),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("About us"),
                trailing: Icon(Icons.info),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Help"),
                trailing: Icon(Icons.help),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConditionScreen()),
                        (route) => false);
                  },
                  child: Row(
                    children: [
                      Text("LogOut"),
                      Icon(Icons.exit_to_app),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, mapScreen);
                    },
                    child: Container(
                      height: 150,
                      width: 180,
                      child: Card(
                        color: Colors.grey,
                        elevation: 10.0,
                        child: Center(
                          child: Text(
                            "Help Me",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, mapScreen);
                    },
                    child: Container(
                      height: 150,
                      width: 180,
                      child: Card(
                        color: Colors.grey,
                        elevation: 10.0,
                        child: Center(
                            child: Text(
                          "Help My House",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, mapScreen);
                },
                child: Container(
                  height: 150,
                  width: 190,
                  child: Card(
                    color: Colors.grey,
                    elevation: 10.0,
                    child: Center(
                      child: Text(
                        "Help My Business",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
