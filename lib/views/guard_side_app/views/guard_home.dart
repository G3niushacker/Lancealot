import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lancelot/views/condtition_screen.dart';

class GuardHome extends StatefulWidget {
  @override
  _GuardHomeState createState() => _GuardHomeState();
}

class _GuardHomeState extends State<GuardHome> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Set<Marker> marker = {};

  @override
  void initState() {
    super.initState();
    marker.add(
      Marker(
        markerId: MarkerId(
          _kGooglePlex.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              "John Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Text(
              "+1 568 236 5989",
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
        title: Text("Home"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: marker,
      ),
    );
  }
}
